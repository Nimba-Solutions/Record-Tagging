import { LightningElement, api, track, wire } from 'lwc';
import getTagsByName from '@salesforce/apex/TagCollection.getTagsByName';

export default class TagSelector extends LightningElement {
    @api recordId; // Record Id input variable from Flow
    @api tagOptions = [];
    @api selectedTag = '';
    @api tagOptionsFiltered = [];

    connectedCallback() {
        // Fetch available tags
        this.loadAvailableTags();
    }

    @wire(getTagsByName, { searchTerm: '$selectedTag' })
    wiredTags({ data, error }) {
        if (data) {
            console.log(JSON.stringify(data));
            // Use the correct property name from your data
            const results = JSON.parse(data);
            this.tagOptions = results.map(tag => ({ label: tag.tagName, value: tag.tagId }));
        } else if (error) {
            console.error('Error fetching tags:', error);
        }
    }

    handleTagSearch(event) {
        try {
            if (!event || !event.target || typeof event.target.value !== 'string') {
                throw new Error('Invalid event or event.target.value');
            }

            this.selectedTag = event.target.value;

            if (!this.tagOptions || !Array.isArray(this.tagOptions)) {
                throw new Error('Invalid tagOptions');
            }

            // Use the correct property name for searching
            this.tagOptionsFiltered = this.tagOptions.filter(option =>
                this.matchesSearch(option.label?.toLowerCase()?.trim(), this.selectedTag?.toLowerCase()?.trim())
            );
        } catch (error) {
            console.error('Error in handleTagSearch:', error.message);
            // Optionally, you can handle the error further or show a user-friendly message
        }
    }

    matchesSearch(optionLabel, search) {
        try {
            if (typeof optionLabel !== 'string') {
                throw new TypeError(`Invalid parameter type: optionLabel is of type ${typeof optionLabel}`);
            }

            if (typeof search !== 'string') {
                throw new TypeError(`Invalid parameter type: search is of type ${typeof search}`);
            }

            return optionLabel.includes(search);
        } catch (error) {
            console.error('Error in matchesSearch:', error.message);
            // Optionally, you can handle the error further or show a user-friendly message
            return false; // Default to false in case of error
        }
    }

    handleTagSelection(event) {
        // Update selectedTag when user clicks on a result
        this.selectedTag = event.currentTarget.dataset.value;
    }

    handleApply() {
        // Call an Apex method to perform the required actions
        // (Query, compare, remove, and create TagRelationship__c records)
        // Pass the selectedTag and recordId to the Apex method

        // Example:
        // YourApexClass.applyTags({ taggedRecordId: this.recordId, selectedTag: this.selectedTag })
        //     .then(result => {
        //         // Handle success
        //     })
        //     .catch(error => {
        //         // Handle error
        //     });
    }

    loadAvailableTags() {
        // Fetch available tags when the component is initialized
        getTagsByName({ searchTerm: '' })
            .then(result => {
                // Use the correct property name from your result
                this.tagOptions = result.map(tag => ({ label: tag.tagName, value: tag.tagId }));
            })
            .catch(error => {
                console.error('Error fetching tags:', error);
            });
    }
}