BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"Description" VARCHAR(255), 
	"Fax" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"AccountNumber" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"Rating" VARCHAR(255), 
	"Site" VARCHAR(255), 
	"AccountSource" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"AnnualRevenue" VARCHAR(255), 
	"BillingCity" VARCHAR(255), 
	"BillingCountry" VARCHAR(255), 
	"BillingGeocodeAccuracy" VARCHAR(255), 
	"BillingLatitude" VARCHAR(255), 
	"BillingLongitude" VARCHAR(255), 
	"BillingState" VARCHAR(255), 
	"BillingStreet" VARCHAR(255), 
	"BillingPostalCode" VARCHAR(255), 
	"CleanStatus" VARCHAR(255), 
	"DunsNumber" VARCHAR(255), 
	"Jigsaw" VARCHAR(255), 
	"NumberOfEmployees" VARCHAR(255), 
	"Industry" VARCHAR(255), 
	"NaicsCode" VARCHAR(255), 
	"NaicsDesc" VARCHAR(255), 
	"Ownership" VARCHAR(255), 
	"ShippingCity" VARCHAR(255), 
	"ShippingCountry" VARCHAR(255), 
	"ShippingGeocodeAccuracy" VARCHAR(255), 
	"ShippingLatitude" VARCHAR(255), 
	"ShippingLongitude" VARCHAR(255), 
	"ShippingState" VARCHAR(255), 
	"ShippingStreet" VARCHAR(255), 
	"ShippingPostalCode" VARCHAR(255), 
	"Sic" VARCHAR(255), 
	"SicDesc" VARCHAR(255), 
	"TickerSymbol" VARCHAR(255), 
	"Tradestyle" VARCHAR(255), 
	"Website" VARCHAR(255), 
	"YearStarted" VARCHAR(255), 
	"DandbCompanyId" VARCHAR(255), 
	"OperatingHoursId" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES(1,'','','Test Account 2','','','','','','','','','','','','','','','','Pending','','','','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO "Account" VALUES(2,'','','Test Account 1','','','','','','','','','','','','','','','','Pending','','','','','','','','','','','','','','','','','','','','','','','','');
CREATE TABLE "Campaign" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"LastName" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Contract" (
	id INTEGER NOT NULL, 
	"AccountId" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "DandBCompany" (
	id INTEGER NOT NULL, 
	"DunsNumber" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "OperatingHours" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"TimeZone" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Opportunity" (
	id INTEGER NOT NULL, 
	"Amount" VARCHAR(255), 
	"CloseDate" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"ForecastCategoryName" VARCHAR(255), 
	"LeadSource" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"NextStep" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"IsPrivate" VARCHAR(255), 
	"Probability" VARCHAR(255), 
	"TotalOpportunityQuantity" VARCHAR(255), 
	"StageName" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"CampaignId" VARCHAR(255), 
	"ContactId" VARCHAR(255), 
	"ContractId" VARCHAR(255), 
	"Pricebook2Id" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Opportunity" VALUES(1,'','2023-12-28','','Pipeline','','Test Opportunity 1','','','False','10.0','','Prospecting','2','','','','');
INSERT INTO "Opportunity" VALUES(2,'','2024-01-18','','Pipeline','','Test Opportunity 2','','','False','20.0','','Needs Analysis','2','','','','');
CREATE TABLE "Pricebook2" (
	id INTEGER NOT NULL, 
	"Description" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Tag__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Tag__c" VALUES(1,'Cartel Member');
INSERT INTO "Tag__c" VALUES(2,'Squirly Customer');
INSERT INTO "Tag__c" VALUES(3,'Poopy Client');
INSERT INTO "Tag__c" VALUES(4,'Party Animal');
INSERT INTO "Tag__c" VALUES(5,'Big Deal');
INSERT INTO "Tag__c" VALUES(6,'Test');
CREATE TABLE "TagRelationship__c" (
	id INTEGER NOT NULL, 
	"Account__c" VARCHAR(255), 
	"Opportunity__c" VARCHAR(255), 
	"Tag__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "TagRelationship__c" VALUES(1,'2','','6');
INSERT INTO "TagRelationship__c" VALUES(2,'1','','6');
INSERT INTO "TagRelationship__c" VALUES(3,'2','','2');
INSERT INTO "TagRelationship__c" VALUES(4,'1','','3');
INSERT INTO "TagRelationship__c" VALUES(5,'','2','6');
INSERT INTO "TagRelationship__c" VALUES(6,'','2','5');
INSERT INTO "TagRelationship__c" VALUES(7,'1','','1');
INSERT INTO "TagRelationship__c" VALUES(8,'','1','6');
COMMIT;
