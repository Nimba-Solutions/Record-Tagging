public with sharing class TagCollection {

    private final static Integer MAX_RESULTS = 10;

    // Inner class to represent a Tag record
    public class TagRecord {
        public Id tagId { get; set; }
        public String tagName { get; set; }
    }

    // Method to get available tags by name (for lookup)
    @AuraEnabled(cacheable=true)
    public static String getTagsByName(String searchTerm) {
        List<TagRecord> tagRecords = new List<TagRecord>();

        // Log the search term for debugging
        System.debug('Search Term: ' + searchTerm);

        // Query Tag__c records based on the search term
        List<Tag__c> tags = [SELECT Id, Name FROM Tag__c WHERE Name LIKE :('%' + searchTerm + '%') LIMIT 10];

        // Log the query results for debugging
        System.debug('Query Results: ' + tags);

        // Populate the TagRecord list
        for (Tag__c tag : tags) {
            TagRecord tagRecord = new TagRecord();
            tagRecord.tagId = tag.Id;
            tagRecord.tagName = tag.Name;
            tagRecords.add(tagRecord);
        }

        return JSON.serialize(tagRecords);
    }

           @AuraEnabled(cacheable=true scope='global')
    public static List<LookupSearchResult> search(String searchTerm, List<String> selectedIds) {
        // Prepare query parameters
        searchTerm += '*';

        // Execute search query
        List<List<SObject>> searchResults = [
            FIND :searchTerm
            IN ALL FIELDS
            RETURNING
                Tag__c(Id, Name  WHERE id NOT IN :selectedIds)
            LIMIT :MAX_RESULTS
        ];

        // Prepare results
        List<LookupSearchResult> results = new List<LookupSearchResult>();

        // Extract Tags & convert them into LookupSearchResult
        String tagIcon = 'standard:account';
        Tag__c[] tags = (List<Tag__c>) searchResults[0];
        for (Tag__c tag : tags) {
            String subtitle = tag.Id == null ? 'Tag' : 'Tag • ' + tag.Id;
            results.add(new LookupSearchResult(tag.Id, 'Tag', tagIcon, tag.Name, subtitle));
        }


        // Optionally sort all results on title
        results.sort();

        return results;
    }

    // Add other methods for interacting with Tag records as needed
}