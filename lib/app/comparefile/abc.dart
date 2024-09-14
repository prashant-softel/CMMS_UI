-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 172.20.43.19    Database: hfe_cmms2
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assetcategories`
--

DROP TABLE IF EXISTS `assetcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` int DEFAULT '0',
  `calibrationStatus` int NOT NULL DEFAULT '0',
  `createdBy` int DEFAULT '0',
  `updatedBy` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text NOT NULL,
  `facilityId` int DEFAULT '0',
  `blockId` int NOT NULL DEFAULT '0',
  `parentId` int NOT NULL,
  `acCapacity` int NOT NULL,
  `dcCapacity` int NOT NULL,
  `moduleQuantity` int NOT NULL,
  `area` decimal(50,6) DEFAULT NULL,
  `categoryId` int DEFAULT '0',
  `typeId` int DEFAULT '0',
  `statusId` int DEFAULT NULL,
  `linkedToBlockId` int DEFAULT '0',
  `customerId` int DEFAULT '0',
  `ownerId` int DEFAULT '0',
  `operatorId` int DEFAULT '0',
  `manufacturerId` int DEFAULT '0',
  `supplierId` int DEFAULT '0',
  `serialNumber` varchar(255) DEFAULT NULL,
  `warrantyId` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `createdBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT '1',
  `isApproved` int DEFAULT '0',
  `photoId` int DEFAULT '0',
  `cost` double DEFAULT '0',
  `currency` int DEFAULT NULL,
  `model` varchar(250) DEFAULT NULL,
  `stockCount` int DEFAULT NULL,
  `specialTool` int DEFAULT '0',
  `specialToolEmpId` int DEFAULT '0',
  `vendorId` int DEFAULT NULL,
  `descriptionMaintenance` varchar(200) DEFAULT NULL,
  `calibrationFrequencyType` varchar(200) DEFAULT NULL,
  `calibrationFrequency` int DEFAULT NULL,
  `calibrationReminderDays` int NOT NULL DEFAULT '0',
  `calibrationDueDate` datetime DEFAULT NULL,
  `calibrationLastDate` datetime DEFAULT NULL,
  `calibrationStartDate` datetime DEFAULT NULL,
  `calibrationNextDueDate` datetime DEFAULT NULL,
  `retirementStatus` int DEFAULT '0',
  `multiplier` int NOT NULL DEFAULT '1',
  `dcRating` varchar(100) DEFAULT NULL,
  `acRating` varchar(250) DEFAULT NULL,
  `descMaintenace` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `unspCode` varchar(45) DEFAULT NULL,
  `purchaseCode` varchar(45) DEFAULT NULL,
  `spvId` int DEFAULT NULL,
  `num_of_module` int NOT NULL,
  `parent_equipment_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`num_of_module`),
  KEY `Facility_id` (`facilityId`) USING BTREE,
  KEY `Asset_category_id` (`categoryId`) USING BTREE,
  KEY `Asset_Type_id` (`typeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108687 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetstatus`
--

DROP TABLE IF EXISTS `assetstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `addedAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettypes`
--

DROP TABLE IF EXISTS `assettypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `addedAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` int DEFAULT '0',
  `addedBy` int DEFAULT '0',
  `updatedBy` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetwarranty`
--

DROP TABLE IF EXISTS `assetwarranty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetwarranty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `warranty_type` int DEFAULT '0',
  `warranty_description` varchar(255) DEFAULT NULL,
  `warranty_term_type` int DEFAULT '0',
  `asset_id` int DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `meter_limit` varchar(128) DEFAULT NULL,
  `meter_unit` varchar(128) DEFAULT NULL,
  `warranty_provider` int DEFAULT NULL,
  `certificate_file_id` int DEFAULT NULL,
  `certificate_number` varchar(255) DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `addedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT '0',
  `warrantyTenture` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bellary_upload_new format_v2`
--

DROP TABLE IF EXISTS `bellary_upload_new format_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bellary_upload_new format_v2` (
  `Plant_Name` text,
  `Asset_Facility_Name` text,
  `Asset_Category_Name` text,
  `Asset_Name` text,
  `Asset_Description` text,
  `Asset_Parent_Name` text,
  `Asset_Serial_No` text,
  `DC_Capacity` text,
  `DC_Rating` text,
  `AC_Rating` text,
  `Module_Quantity` int DEFAULT NULL,
  `Asset_Type_Name` text,
  `Asset_Status_Name` text,
  `Description_Maintenance` text,
  `Warranty Type` text,
  `Asset_Warranty_Provider` text,
  `Asset_Warranty_Start_Date` text,
  `Asset_Warranty_Expiry_Date` text,
  `Warranty Tenure (How many years/month/days)` text,
  `Asset_Warranty_Certificate_No` text,
  `Asset_Manufacturer_Name` text,
  `Asset_Supplier_Name` text,
  `Asset_Model_Name` text,
  `Asset_Cost` text,
  `Asset_Currency` text,
  `Asset_BarCode` text,
  `Asset_UNSPC_Code` text,
  `Asset_Purchase_Code` text,
  `Asset_Customer_Name` text,
  `Asset_Owner_Name` text,
  `Asset_SPV_Name` text,
  `Asset_Operator_Name` text,
  `Asset_Calibration/Testing_Date` text,
  `Asset_Calibration_Frequency` text,
  `Calibration_Reminder_Days` text,
  `Area` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bloodgroup`
--

DROP TABLE IF EXISTS `bloodgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bloodgroupaltnames`
--

DROP TABLE IF EXISTS `bloodgroupaltnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodgroupaltnames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `blood_group_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyparts`
--

DROP TABLE IF EXISTS `bodyparts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodyparts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sequence_no` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `status` int DEFAULT NULL,
  `Createdby` int NOT NULL,
  `Createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` varchar(45) DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '''''',
  `email` varchar(255) DEFAULT NULL,
  `contactNumber` varchar(128) DEFAULT NULL,
  `contactPerson` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `location` varchar(11) DEFAULT NULL,
  `secondContactNumber` varchar(128) DEFAULT NULL,
  `secondEmail` varchar(255) DEFAULT 'NULL',
  `type` int DEFAULT '0',
  `latitude` varchar(128) DEFAULT NULL,
  `longitude` varchar(128) DEFAULT NULL,
  `address` text,
  `cityId` int DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `countryId` int DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `zip` varchar(128) DEFAULT NULL,
  `currencyId` int DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '0',
  `addedBy` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=566 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businesstype`
--

DROP TABLE IF EXISTS `businesstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `businesstype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT 'NULL',
  `description` text,
  `addedAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `addedBy` int DEFAULT '0',
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calibration`
--

DROP TABLE IF EXISTS `calibration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calibration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int NOT NULL,
  `facility_id` int NOT NULL,
  `LastcalibrationDoneDate` datetime DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_date` date DEFAULT NULL,
  `calibration_certificate_file_id` int DEFAULT '0',
  `status` int NOT NULL COMMENT 'Status - 0 : Scheduled, 1 : In progress, 2 : Completed',
  `status_updated_at` datetime DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `is_damaged` int DEFAULT NULL,
  `requested_by` int DEFAULT NULL,
  `requested_at` datetime DEFAULT NULL,
  `request_approved_by` int DEFAULT NULL,
  `request_approved_at` datetime DEFAULT NULL,
  `request_approve_remark` varchar(200) DEFAULT NULL,
  `request_rejected_by` int DEFAULT NULL,
  `request_rejected_at` datetime DEFAULT NULL,
  `request_reject_remark` varchar(200) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `started_by` int DEFAULT NULL,
  `completed_by` int DEFAULT NULL,
  `completed_remark` varchar(45) DEFAULT NULL,
  `close_by` int DEFAULT NULL,
  `close_remark` varchar(45) DEFAULT NULL,
  `skipped_by` int DEFAULT NULL,
  `skipped_at` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approve_remark` varchar(45) DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `reject_remark` varchar(45) DEFAULT NULL,
  `health_status` varchar(100) DEFAULT NULL,
  `reschedule` int DEFAULT NULL,
  `prev_task_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35577 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checklist_mapping`
--

DROP TABLE IF EXISTS `checklist_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT '0',
  `category_id` int DEFAULT '0',
  `status` int DEFAULT '0',
  `checklist_id` int DEFAULT NULL,
  `plan_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checklist_number`
--

DROP TABLE IF EXISTS `checklist_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist_number` (
  `id` int NOT NULL AUTO_INCREMENT,
  `checklist_number` varchar(200) DEFAULT '0',
  `checklist_type` int NOT NULL DEFAULT '0',
  `facility_id` int NOT NULL DEFAULT '0',
  `status` int DEFAULT '0',
  `created_by` int DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_by` int DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `asset_category_id` int DEFAULT NULL,
  `frequency_id` int DEFAULT NULL,
  `manpower` int DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=962 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkpoint`
--

DROP TABLE IF EXISTS `checkpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkpoint` (
  `id` int NOT NULL AUTO_INCREMENT,
  `check_point` text,
  `check_list_id` int DEFAULT NULL,
  `requirement` text,
  `is_document_required` int DEFAULT '0',
  `action_to_be_done` text,
  `failure_weightage` int DEFAULT NULL,
  `type` int DEFAULT '0',
  `min_range` double(50,5) DEFAULT NULL,
  `max_range` double(50,5) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `risk_type` int DEFAULT NULL,
  `type_of_observation` int DEFAULT NULL,
  `cost_type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5685 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` mediumint unsigned NOT NULL,
  `country_id` mediumint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_test_ibfk_1` (`state_id`),
  KEY `cities_test_ibfk_2` (`country_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cleaning_execution`
--

DROP TABLE IF EXISTS `cleaning_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_execution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `planId` int NOT NULL,
  `moduleType` int DEFAULT NULL,
  `noOfDays` int DEFAULT NULL,
  `facilityId` int DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `assignedTo` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `executedById` int DEFAULT NULL,
  `executionStartedAt` datetime DEFAULT NULL,
  `updatedById` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `endedById` int DEFAULT NULL,
  `endedAt` datetime DEFAULT NULL,
  `approvedById` int DEFAULT NULL,
  `approvedAt` datetime DEFAULT NULL,
  `rejectedById` int DEFAULT NULL,
  `rejectedAt` datetime DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `abandonedById` int DEFAULT NULL,
  `abandonedAt` datetime DEFAULT NULL,
  `reasonForAbandon` varchar(45) DEFAULT NULL,
  `prevTaskId` int DEFAULT NULL,
  `prevTaskDoneDate` datetime DEFAULT NULL,
  `rescheduled` int DEFAULT '0',
  `frequencyId` int DEFAULT '0',
  `executionRejectedAt` datetime DEFAULT NULL,
  `executionRejectedRemarks` varchar(500) DEFAULT NULL,
  `abandonRejectedBy` int DEFAULT NULL,
  `abandonRejectedAt` datetime DEFAULT NULL,
  `abandonRejectedRemarks` varchar(500) DEFAULT NULL,
  `abandonApprovedBy` int DEFAULT NULL,
  `abandonApprovedAt` datetime DEFAULT NULL,
  `abandonApprovedRemarks` varchar(500) DEFAULT NULL,
  `end_approved_id` int DEFAULT NULL,
  `end_rejected_id` int DEFAULT NULL,
  `end_approved_at` datetime DEFAULT NULL,
  `end_rejected_at` datetime DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cleaning_execution_items`
--

DROP TABLE IF EXISTS `cleaning_execution_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_execution_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `moduleType` int DEFAULT NULL,
  `executionId` int NOT NULL,
  `scheduleId` int DEFAULT NULL,
  `assetId` int NOT NULL,
  `moduleQuantity` int DEFAULT NULL,
  `area` int DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '360-scheduled,361-inProgress,362-completed\\r\\n363-abandoned',
  `plannedDate` date DEFAULT NULL,
  `plannedDay` int DEFAULT NULL,
  `executionDay` int DEFAULT NULL,
  `createdbyId` int DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `cleanedById` int DEFAULT NULL,
  `cleanedAt` datetime DEFAULT NULL,
  `abandonedById` int DEFAULT NULL,
  `abandonedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3676 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cleaning_execution_schedules`
--

DROP TABLE IF EXISTS `cleaning_execution_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_execution_schedules` (
  `scheduleId` int NOT NULL AUTO_INCREMENT,
  `executionId` int NOT NULL,
  `planId` int NOT NULL,
  `moduleType` int DEFAULT NULL,
  `facilityId` int DEFAULT NULL,
  `status` int NOT NULL COMMENT '360-scheduled,361-inProgress,362-completed\r\n363-abandoned',
  `waterUsed` int DEFAULT NULL,
  `cleaningType` int NOT NULL COMMENT '1-Wet  2-dry',
  `actualDay` int DEFAULT NULL,
  `createdbyId` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `startedById` int DEFAULT NULL,
  `startedAt` datetime DEFAULT NULL,
  `endedById` int DEFAULT NULL,
  `endedAt` datetime DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `abandonedById` int DEFAULT NULL,
  `abandonedAt` datetime DEFAULT NULL,
  `updatedById` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ptw_id` int DEFAULT NULL,
  `rejectedById` int DEFAULT NULL,
  `rejectedAt` datetime DEFAULT NULL,
  `approvedById` int DEFAULT NULL,
  `approvedAt` datetime DEFAULT NULL,
  `remark_of_schedule` varchar(45) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cleaning_plan`
--

DROP TABLE IF EXISTS `cleaning_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_plan` (
  `planId` int NOT NULL AUTO_INCREMENT,
  `moduleType` int NOT NULL COMMENT '1-mc 2-vegetation',
  `facilityId` int DEFAULT '0',
  `startDate` datetime DEFAULT NULL,
  `assignedTo` int DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `frequencyId` int DEFAULT NULL,
  `durationDays` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `createdById` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedById` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isApproved` int NOT NULL DEFAULT '0',
  `approvedById` int DEFAULT NULL,
  `approvedAt` datetime DEFAULT NULL,
  `approvalReason` varchar(45) DEFAULT NULL,
  `cleaningType` int DEFAULT NULL,
  `deleted_by_id` int DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`planId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cleaning_plan_items`
--

DROP TABLE IF EXISTS `cleaning_plan_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_plan_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `planId` int NOT NULL DEFAULT '0',
  `moduleType` int DEFAULT NULL,
  `scheduleId` int DEFAULT '0',
  `assetId` int NOT NULL,
  `moduleQuantity` int DEFAULT NULL,
  `area` int DEFAULT NULL,
  `plannedDay` int NOT NULL,
  `createdById` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedById` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1956 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cleaning_plan_schedules`
--

DROP TABLE IF EXISTS `cleaning_plan_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_plan_schedules` (
  `scheduleId` int NOT NULL AUTO_INCREMENT,
  `planId` int DEFAULT '0',
  `moduleType` int DEFAULT NULL,
  `plannedDay` int NOT NULL,
  `cleaningType` varchar(50) DEFAULT NULL COMMENT '1-Wet  2-dry',
  `createdById` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedById` int DEFAULT NULL,
  `updatedAt` int DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmms_location_details`
--

DROP TABLE IF EXISTS `cmms_location_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cmms_location_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permit_to_work_id` varchar(255) NOT NULL,
  `jobcard_id` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `type` varchar(25) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `imei` varchar(255) NOT NULL,
  `browser_information` varchar(255) NOT NULL,
  `customer_id` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competencies`
--

DROP TABLE IF EXISTS `competencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `addedAt` datetime DEFAULT NULL,
  `addedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competenciesdetails`
--

DROP TABLE IF EXISTS `competenciesdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competenciesdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT '0',
  `competencyId` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `addedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contractor_attendnace`
--

DROP TABLE IF EXISTS `contractor_attendnace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractor_attendnace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `contractor_id` int DEFAULT '0',
  `age_lessthan_35` int DEFAULT '0',
  `age_Between_35_50` int DEFAULT '0' COMMENT 'age_lessthan_35, age_Between_35_50 , age_Greater_50',
  `age_Greater_50` int DEFAULT '0',
  `purpose` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_version`
--

DROP TABLE IF EXISTS `document_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_version` (
  `auto_id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `doc_master_id` int NOT NULL,
  `file_id` int NOT NULL,
  `sub_doc_name` varchar(255) DEFAULT NULL,
  `renew_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dsm`
--

DROP TABLE IF EXISTS `dsm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fy` varchar(50) DEFAULT NULL,
  `month` varchar(50) NOT NULL,
  `dsmPenalty` int DEFAULT NULL,
  `scheduleKwh` int DEFAULT NULL,
  `actualKwh` int DEFAULT NULL,
  `month_id` int DEFAULT '0',
  `site_id` int DEFAULT '0',
  `vendor_id` int DEFAULT '0',
  `category_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dsm_category`
--

DROP TABLE IF EXISTS `dsm_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsm_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dsm_type`
--

DROP TABLE IF EXISTS `dsm_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsm_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_attendance`
--

DROP TABLE IF EXISTS `employee_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attendance_id` int DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `present` int DEFAULT NULL,
  `in_time` varchar(100) DEFAULT NULL,
  `out_time` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3538 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `escalationlog`
--

DROP TABLE IF EXISTS `escalationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escalationlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `moduleId` int DEFAULT NULL,
  `moduleRefId` int DEFAULT NULL,
  `moduleStatus` int DEFAULT NULL,
  `notifSentToId` int DEFAULT NULL,
  `notifSentAt` datetime DEFAULT NULL,
  `emailUserCount` int DEFAULT NULL,
  `notificationType` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `escalationmatrix`
--

DROP TABLE IF EXISTS `escalationmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escalationmatrix` (
  `id` int NOT NULL AUTO_INCREMENT,
  `moduleId` int NOT NULL DEFAULT '0',
  `statusId` int NOT NULL DEFAULT '0',
  `roleId` int NOT NULL,
  `escalationLevel` int NOT NULL,
  `days` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `escalationsentto`
--

DROP TABLE IF EXISTS `escalationsentto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escalationsentto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `escalationLogId` int DEFAULT NULL,
  `notifSentTo` int DEFAULT NULL,
  `notifSentAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description_del` text,
  `spvId` int DEFAULT NULL,
  `customerId` int DEFAULT '0',
  `ownerId` int DEFAULT '0',
  `operatorId` int DEFAULT '0',
  `isBlock` int DEFAULT '0',
  `parentId` int DEFAULT '0',
  `address` text,
  `cityId` int DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `countryId` int DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` int DEFAULT '0',
  `latitude` varchar(128) DEFAULT NULL,
  `longitude` varchar(128) DEFAULT NULL,
  `createdBy` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `status` int DEFAULT '0',
  `photoId` int DEFAULT '0',
  `description` text,
  `timezone` varchar(50) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `openingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facilitycategories`
--

DROP TABLE IF EXISTS `facilitycategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilitycategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `addedAt` datetime DEFAULT NULL,
  `addedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facilityregions`
--

DROP TABLE IF EXISTS `facilityregions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilityregions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(999) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `addedBy` int NOT NULL,
  `addedAt` datetime NOT NULL,
  `updatedBy` int NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `id` int NOT NULL AUTO_INCREMENT,
  `softwareId` int NOT NULL,
  `moduleName` varchar(200) DEFAULT NULL,
  `featureName` varchar(50) NOT NULL,
  `menuImage` varchar(200) DEFAULT NULL,
  `add` int DEFAULT '0',
  `edit` int DEFAULT '0',
  `delete` int DEFAULT '0',
  `view` int DEFAULT '0',
  `issue` int NOT NULL DEFAULT '0',
  `approve` int NOT NULL DEFAULT '0',
  `selfView` int NOT NULL DEFAULT '0',
  `escalate` int NOT NULL DEFAULT '0',
  `isActive` int DEFAULT '1',
  `serialNo` int DEFAULT '0',
  PRIMARY KEY (`id`,`softwareId`),
  UNIQUE KEY `softwareId_UNIQUE` (`softwareId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filecategory`
--

DROP TABLE IF EXISTS `filecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filecategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequency`
--

DROP TABLE IF EXISTS `frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `years` int DEFAULT NULL,
  `months` int DEFAULT NULL,
  `days` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `frequency_type` int DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `initial` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `moduleType` int NOT NULL COMMENT '1 = Job, 2 = Permit, 3 = JobCard',
  `moduleRefId` int NOT NULL,
  `secondaryModuleRefType` int NOT NULL,
  `secondaryModuleRefId` int NOT NULL,
  `comment` longtext NOT NULL,
  `createdBy` int NOT NULL,
  `status` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deletedBy` int DEFAULT '0',
  `deletedAt` varchar(50) DEFAULT NULL,
  `currentLatitude` varchar(255) NOT NULL,
  `currentLongitude` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36829 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `immediate_correction`
--

DROP TABLE IF EXISTS `immediate_correction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immediate_correction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `incidents_id` int DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int NOT NULL,
  `block_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  `severity` int DEFAULT NULL,
  `risk_level` int DEFAULT NULL,
  `incident_datetime` datetime DEFAULT NULL,
  `victim_id` int NOT NULL,
  `action_taken_by` int NOT NULL,
  `action_taken_datetime` datetime DEFAULT NULL,
  `inverstigated_by` int NOT NULL,
  `verified_by` int NOT NULL,
  `risk_type` int NOT NULL,
  `esi_applicability` int NOT NULL,
  `esi_applicability_remark` varchar(500) DEFAULT NULL,
  `legal_applicability` int NOT NULL,
  `legal_applicability_remark` varchar(500) DEFAULT NULL,
  `rca_required` int NOT NULL,
  `rca_required_remark` varchar(500) DEFAULT NULL,
  `damaged_cost` double(50,2) NOT NULL,
  `damaged_cost_curr_id` int DEFAULT NULL,
  `generation_loss` int NOT NULL,
  `generation_loss_curr_id` int DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` text NOT NULL,
  `is_person_involved` varchar(450) DEFAULT NULL,
  `is_insurance_applicable` int NOT NULL,
  `insurance` varchar(45) DEFAULT NULL,
  `insurance_status` int NOT NULL,
  `insurance_remark` text NOT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_by` int NOT NULL DEFAULT '0',
  `update_at` datetime DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `status_updated_at` datetime DEFAULT NULL,
  `incidentscol` varchar(45) DEFAULT '0',
  `reject_reccomendations` text,
  `is_approved` int DEFAULT '0',
  `location_of_incident` varchar(450) DEFAULT NULL,
  `type_of_job` varchar(450) DEFAULT NULL,
  `is_activities_trained` varchar(45) DEFAULT NULL,
  `is_person_authorized` varchar(45) DEFAULT NULL,
  `instructions_given` varchar(450) DEFAULT NULL,
  `safety_equipments` varchar(450) DEFAULT NULL,
  `safe_procedure_observed` varchar(850) DEFAULT NULL,
  `unsafe_condition_contributed` varchar(450) DEFAULT NULL,
  `unsafe_act_cause` varchar(450) DEFAULT NULL,
  `incidet_type_id` int DEFAULT NULL,
  `cancel_remarks` varchar(450) DEFAULT NULL,
  `approved_remarks` varchar(450) DEFAULT NULL,
  `is_why_why_required` int DEFAULT NULL,
  `is_investigation_required` int DEFAULT NULL,
  `close_remarks` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incidenttype`
--

DROP TABLE IF EXISTS `incidenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidenttype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `incidenttype` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `injured_person`
--

DROP TABLE IF EXISTS `injured_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injured_person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `incidents_id` int DEFAULT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `person_type` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name_contractor` varchar(255) DEFAULT NULL,
  `body_part_and_nature_of_injury` varchar(255) DEFAULT NULL,
  `work_experience_years` int DEFAULT NULL,
  `plant_equipment_involved` varchar(255) DEFAULT NULL,
  `location_of_incident` varchar(255) DEFAULT NULL,
  `person_name` varchar(100) DEFAULT NULL,
  `other_victim` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `investigation_team`
--

DROP TABLE IF EXISTS `investigation_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investigation_team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `incidents_id` int DEFAULT NULL,
  `person_id` varchar(45) DEFAULT NULL,
  `person_type` int DEFAULT NULL,
  `person_name` varchar(50) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `investigation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ir_insuranceprovider`
--

DROP TABLE IF EXISTS `ir_insuranceprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ir_insuranceprovider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ir_risktype`
--

DROP TABLE IF EXISTS `ir_risktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ir_risktype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `risktype` varchar(255) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ir_status`
--

DROP TABLE IF EXISTS `ir_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ir_status` (
  `id` int NOT NULL DEFAULT '0',
  `risktype` varchar(45) DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobassociatedworktypes`
--

DROP TABLE IF EXISTS `jobassociatedworktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobassociatedworktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobId` int NOT NULL,
  `workTypeId` int DEFAULT '0',
  `otherWorkTypeName` varchar(255) DEFAULT NULL,
  `jobassociatedworktypescol` varchar(45) DEFAULT NULL,
  `toolId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `JobID` (`jobId`),
  KEY `WorkkType` (`workTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobcards`
--

DROP TABLE IF EXISTS `jobcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobcards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `JC_id` int DEFAULT '0',
  `JC_Code` varchar(128) DEFAULT NULL,
  `jobId` int NOT NULL,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `JC_title` varchar(255) DEFAULT NULL,
  `JC_Description` text,
  `JC_Done_Description` text,
  `JC_Start_By_id` int DEFAULT '0',
  `JC_Start_By_Code` varchar(128) DEFAULT NULL,
  `JC_Date_Start` datetime DEFAULT NULL,
  `JC_End_By_id` int DEFAULT '0',
  `JC_End_By_Code` varchar(128) DEFAULT NULL,
  `JC_Date_Stop` datetime DEFAULT NULL,
  `JC_Issued_By_id` int DEFAULT '0',
  `JC_Issued_By_Code` varchar(128) DEFAULT NULL,
  `JC_Approved_By_id` int DEFAULT '0',
  `JC_Approved_By_Code` varchar(128) DEFAULT NULL,
  `JC_Approve_Reason` varchar(200) DEFAULT NULL,
  `JC_Approved` int NOT NULL DEFAULT '0',
  `JC_Rejected_By_id` int NOT NULL DEFAULT '0',
  `JC_Rejected_Reason` text CHARACTER SET utf16 COLLATE utf16_general_ci,
  `JC_Rejected_TimeStamp` timestamp NULL DEFAULT NULL,
  `JC_Status` int NOT NULL DEFAULT '0',
  `status_updated_at` datetime DEFAULT NULL,
  `JC_Date` datetime DEFAULT NULL,
  `JC_Added_by` int DEFAULT '0',
  `JC_Added_Date` datetime DEFAULT NULL,
  `JC_Update_by` int DEFAULT NULL,
  `JC_Update_date` datetime DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `JC_Approved_TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobcards_backup`
--

DROP TABLE IF EXISTS `jobcards_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobcards_backup` (
  `id` int NOT NULL DEFAULT '0',
  `JC_id` int DEFAULT '0',
  `JC_Code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jobId` int NOT NULL,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `JC_Done_Description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `JC_Date_Start` datetime DEFAULT NULL,
  `JC_Date_Stop` datetime DEFAULT NULL,
  `JC_Start_By_id` int DEFAULT '0',
  `JC_Start_By_Code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Start_By_Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_End_By_id` int DEFAULT '0',
  `JC_End_By_Code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_End_By_Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Issued_By_id` int DEFAULT '0',
  `JC_Issued_By_Code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Issued_By_Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Approved_By_id` int DEFAULT '0',
  `JC_Approved_By_Code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Approved_By_Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Approved` int NOT NULL DEFAULT '0',
  `JC_Rejected_By_id` int NOT NULL DEFAULT '0',
  `JC_Rejected_Reason` text CHARACTER SET utf16 COLLATE utf16_general_ci,
  `JC_Rejected_TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JC_Rejected_By_Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Status` int NOT NULL DEFAULT '0',
  `JC_Carry_Forward` int DEFAULT NULL,
  `JC_Date` datetime DEFAULT NULL,
  `JC_Added_by` int DEFAULT '0',
  `JC_Added_Date` datetime DEFAULT NULL,
  `JC_Update_by` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_Update_date` datetime DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Facility_Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JC_TimeZone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobmappingassets`
--

DROP TABLE IF EXISTS `jobmappingassets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobmappingassets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobId` int NOT NULL,
  `assetId` int NOT NULL,
  `categoryId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categoryID` (`categoryId`),
  KEY `jobId` (`jobId`),
  KEY `assetID` (`assetId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facilityId` int NOT NULL,
  `blockId` int NOT NULL,
  `assignedId` int NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `linkedPermit` int NOT NULL DEFAULT '0',
  `breakdownTime` timestamp NULL DEFAULT NULL,
  `JobType` int NOT NULL DEFAULT '0' COMMENT '0 - self, 1 - PM, 2 - auto',
  `latestJC` int DEFAULT '0',
  `statusUpdatedAt` datetime DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdBy` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedBy` varchar(100) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NULL DEFAULT NULL,
  `cancelledBy` int DEFAULT '0',
  `cancelledAt` datetime DEFAULT NULL,
  `cancellationRemarks` varchar(255) DEFAULT NULL,
  `cancelStatus` varchar(11) NOT NULL DEFAULT 'N',
  `linked_schedule_id` int DEFAULT NULL,
  `on_time_status` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `latestJC` (`latestJC`),
  KEY `facilityID` (`facilityId`),
  KEY `blockId` (`blockId`),
  KEY `linkPermit` (`linkedPermit`),
  KEY `createdby` (`createdBy`),
  KEY `assignId` (`assignedId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs_backup`
--

DROP TABLE IF EXISTS `jobs_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_backup` (
  `id` int NOT NULL DEFAULT '0',
  `facilityId` int NOT NULL,
  `blockId` int NOT NULL,
  `assignedId` int NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `linkedPermit` int NOT NULL DEFAULT '0',
  `breakdownTime` timestamp NULL DEFAULT NULL,
  `JobType` int NOT NULL DEFAULT '0' COMMENT '0 - self, 1 - PM, 2 - auto',
  `status` int NOT NULL DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `createdBy` int NOT NULL,
  `updatedBy` varchar(100) NOT NULL DEFAULT '0',
  `cancellationRemarks` varchar(255) DEFAULT NULL,
  `cancelStatus` varchar(11) NOT NULL DEFAULT 'Y',
  `linked_schedule_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobworktypes`
--

DROP TABLE IF EXISTS `jobworktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobworktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipmentCategoryId` int NOT NULL DEFAULT '0',
  `workTypeName` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `createdBy` int NOT NULL DEFAULT '0',
  `updatedAt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` int NOT NULL DEFAULT '0',
  `jobworktypescol` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id`,`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log4netlog`
--

DROP TABLE IF EXISTS `log4netlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log4netlog` (
  `Date` datetime DEFAULT NULL,
  `Thread` varchar(450) DEFAULT NULL,
  `Level` varchar(45) DEFAULT NULL,
  `Logger` varchar(450) DEFAULT NULL,
  `Message` varchar(450) DEFAULT NULL,
  `Exception` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loguserrequest`
--

DROP TABLE IF EXISTS `loguserrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loguserrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `tokenLogID` int DEFAULT NULL,
  `requestMethod` varchar(45) DEFAULT NULL,
  `apiEndPoint` varchar(400) DEFAULT NULL,
  `apiPayLoad` varchar(10000) DEFAULT NULL,
  `apiHitTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235584 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_fueldata`
--

DROP TABLE IF EXISTS `mis_fueldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_fueldata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_id` int DEFAULT NULL,
  `DieselConsumedForVehicles` int NOT NULL,
  `PetrolConsumedForVehicles` int NOT NULL,
  `PetrolConsumedForGrassCuttingAndMovers` int NOT NULL,
  `DieselConsumedAtSite` int NOT NULL,
  `PetrolConsumedAtSite` int NOT NULL,
  `Status` int NOT NULL,
  `CreatedBy` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_grievance`
--

DROP TABLE IF EXISTS `mis_grievance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_grievance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facilityId` int DEFAULT NULL,
  `grievanceType` int DEFAULT NULL,
  `concern` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `actionTaken` varchar(255) DEFAULT NULL,
  `resolutionLevel` int DEFAULT NULL,
  `closedDate` date DEFAULT NULL,
  `closedBy` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `deletedBy` int DEFAULT NULL,
  `statusl` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_kaizensdata`
--

DROP TABLE IF EXISTS `mis_kaizensdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_kaizensdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_id` int DEFAULT NULL,
  `KaizensImplemented` int NOT NULL,
  `CostForImplementation` int NOT NULL,
  `CostSavedFromImplementation` int NOT NULL,
  `Status` int NOT NULL,
  `CreatedBy` int NOT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` int NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_m_grievancetype`
--

DROP TABLE IF EXISTS `mis_m_grievancetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_m_grievancetype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT 'NULL',
  `description` varchar(45) DEFAULT NULL,
  `status` int DEFAULT '0',
  `addedBy` int DEFAULT '0',
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_m_observationsheet`
--

DROP TABLE IF EXISTS `mis_m_observationsheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_m_observationsheet` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `idx_mis_m_observationsheet_id` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_m_resolutionlevel`
--

DROP TABLE IF EXISTS `mis_m_resolutionlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_m_resolutionlevel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT 'NULL',
  `description` varchar(45) DEFAULT NULL,
  `status` int DEFAULT '0',
  `addedAt` datetime DEFAULT NULL,
  `addedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_m_typeofobservation`
--

DROP TABLE IF EXISTS `mis_m_typeofobservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_m_typeofobservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `addedBy` varchar(45) DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='name, description, status , addedBy ,addedAt';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_occupationalhealthdata`
--

DROP TABLE IF EXISTS `mis_occupationalhealthdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_occupationalhealthdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_id` int DEFAULT NULL,
  `NoOfHealthExamsOfNewJoiner` int DEFAULT NULL,
  `PeriodicTests` int DEFAULT NULL,
  `OccupationaIllnesses` int DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_plantationdata`
--

DROP TABLE IF EXISTS `mis_plantationdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_plantationdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_id` int DEFAULT NULL,
  `SaplingsPlanted` int NOT NULL,
  `SaplingsSurvived` int NOT NULL,
  `SaplingsDied` int NOT NULL,
  `Status` int NOT NULL,
  `CreatedBy` int NOT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` int NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_training_course`
--

DROP TABLE IF EXISTS `mis_training_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_training_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Topic` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Traning_category_id` int DEFAULT '0',
  `No_Of_Days` int DEFAULT '0',
  `Max_capacity` int DEFAULT '0',
  `Targated_group_id` int DEFAULT '0',
  `Duration_in_Minutes` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_visitsandnotices`
--

DROP TABLE IF EXISTS `mis_visitsandnotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_visitsandnotices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_id` int DEFAULT NULL,
  `GovtAuthVisits` int DEFAULT NULL,
  `NoOfFineByThirdParty` int NOT NULL,
  `NoOfShowCauseNoticesByThirdParty` int DEFAULT NULL,
  `NoticesToContractor` int DEFAULT NULL,
  `AmountOfPenaltiesToContractors` int DEFAULT NULL,
  `AnyOther` int DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`,`NoOfFineByThirdParty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_wastetype`
--

DROP TABLE IF EXISTS `mis_wastetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_wastetype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `Type` int DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `Updateby` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `show_opening` int DEFAULT NULL,
  `isHazardous` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_waterdata`
--

DROP TABLE IF EXISTS `mis_waterdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_waterdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plantId` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `waterTypeId` int DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  `debitQty` decimal(10,2) DEFAULT NULL,
  `creditQty` decimal(10,2) DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isActive` int DEFAULT '1',
  `consumeTypeId` int DEFAULT '0',
  `show_opening` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mis_watertype`
--

DROP TABLE IF EXISTS `mis_watertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_watertype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `show_opening` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modulecleaning`
--

DROP TABLE IF EXISTS `modulecleaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulecleaning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facilityId` int DEFAULT '0',
  `blockId` int DEFAULT '0',
  `categoryId` int DEFAULT '0',
  `planDate` datetime DEFAULT NULL,
  `durationDays` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `planApprovedBy` int DEFAULT NULL,
  `planApprovedAt` datetime DEFAULT NULL,
  `planRejectedBy` int DEFAULT NULL,
  `planRejectedAt` datetime DEFAULT NULL,
  `planAcceptedBy` int DEFAULT NULL,
  `planAcceptedAt` datetime DEFAULT NULL,
  `executionApprovedBy` int DEFAULT NULL,
  `executionApprovedAt` datetime DEFAULT NULL,
  `executionRejectedBy` int DEFAULT NULL,
  `executionRejectedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modulecleaningexecution`
--

DROP TABLE IF EXISTS `modulecleaningexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulecleaningexecution` (
  `id` int NOT NULL,
  `schedule_id` int DEFAULT NULL,
  `moduleCompleted` int DEFAULT NULL,
  `waterUsed` int DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modulecleaningschedule`
--

DROP TABLE IF EXISTS `modulecleaningschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulecleaningschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mcId` int DEFAULT '0',
  `assetId` int DEFAULT '0',
  `planStartDate` datetime DEFAULT NULL,
  `planEndDate` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `moduletables`
--

DROP TABLE IF EXISTS `moduletables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moduletables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `softwareId` int NOT NULL,
  `tableName` varchar(255) NOT NULL,
  `updateTimeColumn` varchar(255) NOT NULL,
  `statusColumn` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `softwareId_UNIQUE` (`softwareId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `softwareId` int NOT NULL,
  `featureId` int NOT NULL,
  `notification` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitassetlists`
--

DROP TABLE IF EXISTS `permitassetlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitassetlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ptwId` int DEFAULT '0',
  `assetId` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` int DEFAULT '0',
  `updatedBy` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=838 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitblocks`
--

DROP TABLE IF EXISTS `permitblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitblocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ptw_id` int DEFAULT NULL,
  `block_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitconditionmaster`
--

DROP TABLE IF EXISTS `permitconditionmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitconditionmaster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permitTypeId` int DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `type` int DEFAULT '0' COMMENT 'Close - 1, Cancel - 2, Extend - 3',
  `input` int DEFAULT '0' COMMENT '1-checkbox, 2-radio, 3-text, 4-ok',
  `status` int DEFAULT '1',
  `createdAt` datetime DEFAULT NULL,
  `createdBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitconditions`
--

DROP TABLE IF EXISTS `permitconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitconditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permitId` int DEFAULT '0',
  `conditionId` int DEFAULT '0',
  `conditionType` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitemployeelists`
--

DROP TABLE IF EXISTS `permitemployeelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitemployeelists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pwtId` int DEFAULT '0',
  `JC_id` int NOT NULL DEFAULT '0',
  `employeeId` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` int DEFAULT '0',
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT '0',
  `responsibility` varchar(255) DEFAULT NULL,
  `isCustomEmployee` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=772 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitisolatedassetcategories`
--

DROP TABLE IF EXISTS `permitisolatedassetcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitisolatedassetcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permitId` int DEFAULT '0',
  `assetCategoryId` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `createdBy` datetime DEFAULT NULL,
  `normalisedStatus` int DEFAULT '0',
  `normalisedDate` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `permitId` (`permitId`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitjobtypelist`
--

DROP TABLE IF EXISTS `permitjobtypelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitjobtypelist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int DEFAULT '0',
  `createdBy` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `facilityId` int DEFAULT '0',
  `requireSOPJSA` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitlotoassets`
--

DROP TABLE IF EXISTS `permitlotoassets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitlotoassets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PTW_id` int DEFAULT '0',
  `Loto_Key` varchar(128) DEFAULT NULL,
  `Loto_Asset_id` int DEFAULT '0',
  `lotoRemovedStatus` int DEFAULT '0',
  `lotoRemovedDate` datetime DEFAULT NULL,
  `lotoLockNo` varchar(100) DEFAULT NULL,
  `emp_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitlotootherdetail`
--

DROP TABLE IF EXISTS `permitlotootherdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitlotootherdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permitId` int DEFAULT NULL,
  `employee_name` varchar(450) DEFAULT NULL,
  `contact_number` bigint DEFAULT NULL,
  `responsibility` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permits`
--

DROP TABLE IF EXISTS `permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL DEFAULT '0',
  `typeId` int DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `facilityId` int DEFAULT '0',
  `blockId` int DEFAULT '0',
  `empId` int DEFAULT '0',
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `permitNumber` int DEFAULT '0',
  `LOTOStatus` int DEFAULT '0',
  `LOTOId` int DEFAULT '0',
  `LOTOCode` varchar(128) DEFAULT NULL,
  `lockSrNo` varchar(128) DEFAULT NULL,
  `tagSrNo` varchar(128) DEFAULT NULL,
  `workOrder` varchar(128) DEFAULT NULL,
  `HWId` int DEFAULT '0',
  `jobTypeId` int DEFAULT '0',
  `TBTId` int DEFAULT '0',
  `TBTDiscription` text,
  `Isolation` int DEFAULT '0',
  `issuedById` int DEFAULT '0',
  `issuedRequestedToId` int DEFAULT '0',
  `issuedStatus` int DEFAULT '0',
  `issuedReccomendations` text,
  `issuedDate` datetime DEFAULT NULL,
  `acceptedById` int DEFAULT '0',
  `acceptedStatus` int DEFAULT '0',
  `acceptedDate` datetime DEFAULT NULL,
  `acceptedRequestedToId` int DEFAULT '0',
  `approvedById` int DEFAULT '0',
  `approvedStatus` int DEFAULT '0',
  `approvedDate` datetime DEFAULT NULL,
  `reccomendationsByApprover` text,
  `approveRequestedToId` int DEFAULT '0',
  `rejectedById` int DEFAULT NULL,
  `rejectedDate` datetime DEFAULT NULL,
  `rejectReason` text,
  `rejectStatus` int DEFAULT NULL,
  `finalSignature` int DEFAULT '0',
  `status` int DEFAULT '0',
  `status_updated_at` datetime DEFAULT NULL,
  `attachedTo` int NOT NULL DEFAULT '0' COMMENT '1- Job, 2- PM',
  `completedDate` datetime DEFAULT NULL,
  `completedStatus` int DEFAULT '0',
  `completedById` int DEFAULT '0',
  `cancelRequestById` int DEFAULT '0',
  `cancelRequestStatus` int DEFAULT '0',
  `cancelRequestDate` datetime DEFAULT NULL,
  `cancelRequestApproveById` int DEFAULT '0',
  `cancelRequestApproveDate` datetime DEFAULT NULL,
  `cancelRequestApproveStatus` int DEFAULT '0',
  `cancelReccomendations` text,
  `cancelRequestRejectById` int DEFAULT NULL,
  `cancelRequestRejectDate` datetime DEFAULT NULL,
  `cancelRequestRejectReason` text,
  `cancelRequestRejectStatus` int DEFAULT '0',
  `latitude` double DEFAULT '0',
  `longitude` double DEFAULT '0',
  `permittedArea` varchar(255) DEFAULT NULL,
  `workingTime` int DEFAULT NULL,
  `maintenanceType` varchar(128) DEFAULT NULL,
  `maintenanceId` int DEFAULT '0',
  `maintenanceStatus` int DEFAULT '0',
  `inchargeId` int DEFAULT '0',
  `inchargeRequestedToId` int DEFAULT '0',
  `inchargeStatus` varchar(128) DEFAULT NULL,
  `inchargeDate` datetime DEFAULT NULL,
  `inchargeReccomendations` text,
  `projectEngineerEmpID` int NOT NULL DEFAULT '0',
  `extendStatus` int NOT NULL DEFAULT '0' COMMENT '1 - Request, 2 - Approve , 3 - Reject',
  `extendReason` varchar(200) DEFAULT '0',
  `extendByMinutes` int DEFAULT '0',
  `extendTime` datetime DEFAULT '0000-00-00 00:00:00',
  `extendRejectReason` varchar(200) DEFAULT '0',
  `extendRequestTime` datetime DEFAULT NULL,
  `extendApproveTime` datetime DEFAULT NULL,
  `extendNoficationSent` int DEFAULT '0',
  `extendFile` varchar(45) DEFAULT '0',
  `closeFile` varchar(45) DEFAULT '0',
  `cancelFile` varchar(45) DEFAULT '0',
  `1` int DEFAULT '0',
  `2` int DEFAULT '0',
  `3` int DEFAULT '0',
  `4` int DEFAULT '0',
  `5` int DEFAULT '0',
  `6` int DEFAULT '0',
  `7` int DEFAULT '0',
  `8` int DEFAULT '0',
  `9` int DEFAULT '0',
  `closeOther` varchar(45) DEFAULT NULL,
  `cancelOther` varchar(45) DEFAULT NULL,
  `extendOther` varchar(45) DEFAULT NULL,
  `permitscol` varchar(45) DEFAULT NULL,
  `TBT_Done_By` int DEFAULT NULL,
  `TBT_Done_At` datetime DEFAULT NULL,
  `gridIsolation` int DEFAULT '0',
  `gridStartDate` datetime DEFAULT NULL,
  `gridStopDate` datetime DEFAULT NULL,
  `gridRemark` varchar(200) DEFAULT NULL,
  `physicalIsolation` int DEFAULT '0',
  `physicalIsoEquips` varchar(200) DEFAULT NULL,
  `physicalIsoRemark` varchar(200) DEFAULT NULL,
  `lotoRequired` int DEFAULT '0',
  `lotoRemark` varchar(200) DEFAULT NULL,
  `TBT_Done_Check` int DEFAULT '0',
  `extendRequestby_id` int DEFAULT NULL,
  `extendRequestByName` varchar(255) DEFAULT NULL,
  `extendRequestRejectedby_id` int DEFAULT NULL,
  `cancelRequestRejectedByName` varchar(255) DEFAULT NULL,
  `extend_at` datetime DEFAULT NULL,
  `extendRequestApprovedby_id` int DEFAULT NULL,
  `extendRequestApprovedByName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `end_date_status` (`endDate`,`status`),
  KEY `status` (`status`),
  KEY `type_id` (`typeId`),
  KEY `jobtypeId` (`jobTypeId`),
  KEY `tbtId` (`TBTId`),
  KEY `blockId` (`blockId`),
  KEY `issueby` (`issuedById`),
  KEY `approveby` (`approvedById`),
  KEY `acceptby` (`acceptedById`),
  KEY `completid` (`completedById`) /*!80000 INVISIBLE */,
  KEY `canclebyid` (`cancelRequestRejectById`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permits_backup`
--

DROP TABLE IF EXISTS `permits_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permits_backup` (
  `id` int NOT NULL DEFAULT '0',
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `typeId` int DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `facilityId` int DEFAULT '0',
  `blockId` int DEFAULT '0',
  `empId` int DEFAULT '0',
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `permitNumber` int DEFAULT '0',
  `LOTOStatus` int DEFAULT '0',
  `LOTOId` int DEFAULT '0',
  `LOTOCode` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lockSrNo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tagSrNo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workOrder` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HWId` int DEFAULT '0',
  `jobTypeId` int DEFAULT '0',
  `TBTId` int DEFAULT '0',
  `TBTDiscription` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Isolation` int DEFAULT '0',
  `issuedById` int DEFAULT '0',
  `issuedRequestedToId` int DEFAULT '0',
  `issuedStatus` int DEFAULT '0',
  `issuedReccomendations` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `issuedDate` datetime DEFAULT NULL,
  `acceptedById` int DEFAULT '0',
  `acceptedStatus` int DEFAULT '0',
  `acceptedDate` datetime DEFAULT NULL,
  `acceptedRequestedToId` int DEFAULT '0',
  `approvedById` int DEFAULT '0',
  `approvedStatus` int DEFAULT '0',
  `approvedDate` datetime DEFAULT NULL,
  `reccomendationsByApprover` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `approveRequestedToId` int DEFAULT '0',
  `finalSignature` int DEFAULT '0',
  `status` int DEFAULT '0',
  `attachedTo` int NOT NULL DEFAULT '0' COMMENT '1- Job, 2- PM',
  `completedDate` datetime DEFAULT NULL,
  `completedStatus` int DEFAULT '0',
  `completedById` int DEFAULT '0',
  `cancelRequestById` int DEFAULT '0',
  `cancelRequestStatus` int DEFAULT '0',
  `cancelRequestDate` datetime DEFAULT NULL,
  `cancelRequestApproveById` int DEFAULT '0',
  `cancelRequestApproveDate` datetime DEFAULT NULL,
  `cancelRequestApproveStatus` int DEFAULT '0',
  `cancelReccomendations` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `latitude` double DEFAULT '0',
  `longitude` double DEFAULT '0',
  `permittedArea` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workingTime` int DEFAULT NULL,
  `maintenanceType` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `maintenanceId` int DEFAULT '0',
  `maintenanceStatus` int DEFAULT '0',
  `inchargeId` int DEFAULT '0',
  `inchargeRequestedToId` int DEFAULT '0',
  `inchargeStatus` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inchargeDate` datetime DEFAULT NULL,
  `inchargeReccomendations` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `projectEngineerEmpID` int NOT NULL DEFAULT '0',
  `extendStatus` int NOT NULL DEFAULT '0' COMMENT '1 - Request, 2 - Approve , 3 - Reject',
  `extendReason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `extendTime` int DEFAULT '0',
  `extendRejectReason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `extendRequestTime` datetime DEFAULT '0000-00-00 00:00:00',
  `extendApproveTime` datetime DEFAULT '0000-00-00 00:00:00',
  `extendNoficationSent` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitsafetyquestions`
--

DROP TABLE IF EXISTS `permitsafetyquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitsafetyquestions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permitId` int DEFAULT '0',
  `safetyMeasureValue` varchar(128) DEFAULT NULL,
  `safetyMeasureId` int DEFAULT '0',
  `ischeck` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permittbtjoblist`
--

DROP TABLE IF EXISTS `permittbtjoblist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permittbtjoblist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `jobTypeId` int DEFAULT '0',
  `fileId` int DEFAULT NULL,
  `fileName` varchar(200) DEFAULT NULL,
  `fileDescription` text,
  `filePath` varchar(255) DEFAULT NULL,
  `fileTypeId` int DEFAULT '0',
  `fileCategoryId` int DEFAULT '0',
  `status` int DEFAULT '0',
  `fileNameChanged` varchar(200) DEFAULT NULL,
  `TBTRemarks` varchar(256) DEFAULT NULL,
  `JSAFileId` int DEFAULT NULL,
  `JSAFileCategoryId` int NOT NULL DEFAULT '0',
  `JSAFileName` varchar(255) DEFAULT NULL,
  `JSAFilePath` varchar(255) DEFAULT NULL,
  `JSAFileNameChanged` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permittypelists`
--

DROP TABLE IF EXISTS `permittypelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permittypelists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int DEFAULT '0',
  `createdBy` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `facilityId` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permittypesafetymeasures`
--

DROP TABLE IF EXISTS `permittypesafetymeasures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permittypesafetymeasures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permitTypeId` int DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `discription` text,
  `input` int DEFAULT '0' COMMENT '1-checkbox, 2-radio, 3-text, 4-ok',
  `status` int DEFAULT '1',
  `createdAt` datetime DEFAULT NULL,
  `createdBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `required` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `placekeys`
--

DROP TABLE IF EXISTS `placekeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placekeys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `countryId` int NOT NULL DEFAULT '0',
  `stateId` int NOT NULL DEFAULT '0',
  `cityId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_location_track`
--

DROP TABLE IF EXISTS `platform_location_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_location_track` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Module_Name` varchar(128) DEFAULT NULL,
  `Module_Request_data` varchar(128) DEFAULT NULL,
  `IMEI` varchar(30) DEFAULT NULL,
  `user_id` int DEFAULT '0',
  `Emp_id` int DEFAULT '0',
  `username` varchar(200) DEFAULT 'NULL',
  `user_UA` varchar(255) DEFAULT NULL,
  `user_lat` double DEFAULT '0',
  `user_lang` double DEFAULT '0',
  `user_altitude` varchar(128) DEFAULT NULL,
  `user_geo_accuracy` varchar(128) DEFAULT NULL,
  `tocken_status` int DEFAULT '0',
  `tocken` varchar(255) DEFAULT NULL,
  `tocken_added_date` datetime DEFAULT NULL,
  `tocken_updated_date` datetime DEFAULT NULL,
  `type_of_conn` varchar(128) DEFAULT NULL,
  `network_status` varchar(128) DEFAULT NULL,
  `device_model` varchar(128) DEFAULT NULL,
  `device_platform` varchar(128) DEFAULT NULL,
  `device_uuid` varchar(128) DEFAULT NULL,
  `device_version` varchar(128) DEFAULT NULL,
  `device_manufacturer` varchar(128) DEFAULT NULL,
  `deivce_is_vertual` int DEFAULT '0',
  `device_serial_no` varchar(200) DEFAULT NULL,
  `user_ip` varchar(128) DEFAULT NULL,
  `OTP` double DEFAULT '0',
  `OTP_Status` int DEFAULT '0',
  `OTP_Gen_date` datetime DEFAULT NULL,
  `OTP_Verify_date` datetime DEFAULT NULL,
  `PIN` double DEFAULT '0',
  `PIN_Status` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_user_group`
--

DROP TABLE IF EXISTS `platform_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_user_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Group_Code` varchar(128) DEFAULT NULL,
  `Group_Name` varchar(200) DEFAULT NULL,
  `Group_Added_date` datetime DEFAULT NULL,
  `Group_Added_By` int DEFAULT '0',
  `Group_Update_date` datetime DEFAULT NULL,
  `Group_Update_By` int DEFAULT '0',
  `Group_Status` int DEFAULT '0',
  `notification_override_id` int NOT NULL DEFAULT '1',
  `notification_default_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_user_info`
--

DROP TABLE IF EXISTS `platform_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `IMEI` varchar(30) DEFAULT NULL,
  `login_id` varchar(200) DEFAULT 'NULL',
  `password` varchar(200) DEFAULT 'NULL',
  `Secondry_email` varchar(200) DEFAULT NULL,
  `First_name` varchar(200) DEFAULT NULL,
  `Last_name` varchar(200) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `MobileNumber` varchar(15) NOT NULL DEFAULT '',
  `BloodGroup` varchar(200) DEFAULT NULL,
  `photo_id` int DEFAULT NULL,
  `Land_Line` varchar(15) DEFAULT NULL,
  `Role_id` int DEFAULT '0',
  `Role_Code` varchar(128) DEFAULT NULL,
  `Role_Name` varchar(128) DEFAULT NULL,
  `Group_id` int DEFAULT '0',
  `Group_Code` varchar(128) DEFAULT NULL,
  `Group_Name` varchar(200) DEFAULT NULL,
  `User_Access_permissions` text,
  `Country` varchar(200) DEFAULT NULL,
  `State` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `Zip` double DEFAULT '0',
  `Address` varchar(200) DEFAULT NULL,
  `plant_id` int NOT NULL,
  `GCM_id` varchar(255) DEFAULT NULL,
  `Emp_id` int DEFAULT '0',
  `Emp_Code` varchar(128) DEFAULT NULL,
  `User_Added_By` int DEFAULT NULL,
  `User_Added_date` datetime DEFAULT NULL,
  `User_Update_By` int DEFAULT NULL,
  `User_Update_date` datetime DEFAULT NULL,
  `User_Status` int DEFAULT NULL,
  `Emp_Signature` varchar(255) NOT NULL,
  `User_Display_in_Site_List` int NOT NULL DEFAULT '1',
  `user_prefrance_id` int NOT NULL DEFAULT '0',
  `notification_default_id` int NOT NULL DEFAULT '0',
  `notification_override_id` int NOT NULL DEFAULT '0',
  `notification_get_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_user_info_tocken`
--

DROP TABLE IF EXISTS `platform_user_info_tocken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_user_info_tocken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `IMEI` varchar(30) DEFAULT NULL,
  `user_id` int DEFAULT '0',
  `Emp_id` int DEFAULT '0',
  `username` varchar(200) DEFAULT 'NULL',
  `user_UA` varchar(255) DEFAULT NULL,
  `user_lat` double DEFAULT '0',
  `user_lang` double DEFAULT '0',
  `user_altitude` varchar(128) DEFAULT NULL,
  `user_geo_accuracy` varchar(128) DEFAULT NULL,
  `tocken_status` int DEFAULT '0',
  `tocken` varchar(255) DEFAULT NULL,
  `tocken_added_date` datetime DEFAULT NULL,
  `tocken_updated_date` datetime DEFAULT NULL,
  `type_of_conn` varchar(128) DEFAULT NULL,
  `network_status` varchar(128) DEFAULT NULL,
  `device_model` varchar(128) DEFAULT NULL,
  `device_platform` varchar(128) DEFAULT NULL,
  `device_uuid` varchar(128) DEFAULT NULL,
  `device_version` varchar(128) DEFAULT NULL,
  `device_manufacturer` varchar(128) DEFAULT NULL,
  `deivce_is_vertual` int DEFAULT '0',
  `device_serial_no` varchar(200) DEFAULT NULL,
  `user_ip` varchar(128) DEFAULT NULL,
  `OTP` double DEFAULT '0',
  `OTP_Status` int DEFAULT '0',
  `OTP_Gen_date` datetime DEFAULT NULL,
  `OTP_Verify_date` datetime DEFAULT NULL,
  `PIN` double DEFAULT '0',
  `PIN_Status` varchar(128) DEFAULT NULL,
  `Push_Tocken` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_user_login_track`
--

DROP TABLE IF EXISTS `platform_user_login_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_user_login_track` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `login_ip` varchar(500) NOT NULL,
  `login_host` varchar(500) NOT NULL,
  `login_time` datetime NOT NULL,
  `login_timezone` varchar(500) NOT NULL,
  `lastModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_user_plant_access`
--

DROP TABLE IF EXISTS `platform_user_plant_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_user_plant_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `plant_id` int NOT NULL,
  `plant_name` varchar(250) NOT NULL,
  `plant_path` varchar(250) NOT NULL,
  `update_date` datetime NOT NULL,
  `added_date` datetime NOT NULL,
  `update_by` int NOT NULL,
  `added_by` int NOT NULL,
  `status` int NOT NULL,
  `Dsignation_id` int DEFAULT '0',
  `Dsignation_Code` varchar(128) DEFAULT NULL,
  `Dsignation_Name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_user_profile`
--

DROP TABLE IF EXISTS `platform_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_user_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `firstname` varchar(150) DEFAULT NULL,
  `lastname` varchar(150) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `hometown` varchar(150) DEFAULT NULL,
  `lang` varchar(150) DEFAULT NULL,
  `ip_address` varchar(30) DEFAULT NULL,
  `IP_Isp` varchar(250) DEFAULT NULL,
  `IP_orgnisation` varchar(250) DEFAULT NULL,
  `Job_profile` varchar(150) DEFAULT NULL,
  `Job_department` varchar(150) DEFAULT NULL,
  `Job_phone` varchar(25) DEFAULT NULL,
  `second_email` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pm_execution`
--

DROP TABLE IF EXISTS `pm_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_execution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `PM_Schedule_Id` int NOT NULL DEFAULT '0',
  `PM_Schedule_Code` varchar(255) DEFAULT NULL,
  `Check_Point_id` int DEFAULT NULL,
  `Check_Point_Name` text,
  `Check_Point_Code` text,
  `is_ok` int NOT NULL DEFAULT '0',
  `boolean` int DEFAULT NULL,
  `range` int DEFAULT '0',
  `text` varchar(255) DEFAULT NULL,
  `PM_Schedule_Observation` varchar(500) DEFAULT NULL,
  `job_created` int NOT NULL DEFAULT '0' COMMENT '0 - No, 1 - Yes',
  `custom_checkpoint` int NOT NULL DEFAULT '0' COMMENT '0 - No, 1 - Yes',
  `file_required` int DEFAULT '0',
  `linked_job_id` int DEFAULT NULL,
  `PM_Schedule_Observation_added_by` int DEFAULT NULL,
  `PM_Schedule_Observation_add_date` datetime DEFAULT NULL,
  `PM_Schedule_Observation_update_by` int DEFAULT NULL,
  `PM_Schedule_Observation_update_date` datetime DEFAULT NULL,
  `Check_Point_Requirement` varchar(255) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `Observation_target_date` datetime DEFAULT NULL,
  `Observation_assign_to` int DEFAULT NULL,
  `Observation_Status` int DEFAULT '551',
  `preventive_action` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12687 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pm_plan`
--

DROP TABLE IF EXISTS `pm_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(200) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `frequency_id` int DEFAULT NULL,
  `plan_date` date DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `type_id` int DEFAULT NULL,
  `next_schedule_date` date DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_date` (`plan_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4919 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pm_plan_1`
--

DROP TABLE IF EXISTS `pm_plan_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_plan_1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(200) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `frequency_id` int DEFAULT NULL,
  `plan_date` date DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `type_id` int DEFAULT NULL,
  `next_schedule_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pm_schedule`
--

DROP TABLE IF EXISTS `pm_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PM_Schedule_Code` varchar(128) DEFAULT '0',
  `PM_Schedule_Name` varchar(255) DEFAULT NULL,
  `PM_Schedule_date` datetime DEFAULT NULL,
  `task_id` int NOT NULL DEFAULT '0',
  `plan_id` varchar(45) DEFAULT '0',
  `Asset_id` int DEFAULT '0',
  `checklist_id` int NOT NULL DEFAULT '0',
  `checklist_type` int NOT NULL DEFAULT '0',
  `PM_Frequecy_Name` varchar(128) DEFAULT NULL,
  `PM_Frequecy_id` int DEFAULT '0',
  `PM_Frequecy_Code` varchar(128) DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Name` varchar(255) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Block_Id` int DEFAULT '0',
  `Block_Code` varchar(45) DEFAULT NULL,
  `Asset_Category_id` int DEFAULT '0',
  `Asset_Category_Code` varchar(128) DEFAULT NULL,
  `Asset_Category_name` varchar(255) DEFAULT NULL,
  `Asset_Code` varchar(128) DEFAULT NULL,
  `Asset_Name` varchar(255) DEFAULT NULL,
  `PM_Schedule_User_id` int DEFAULT '0',
  `PM_Schedule_User_Name` varchar(255) DEFAULT NULL,
  `PM_Schedule_Emp_id` int DEFAULT '0',
  `PM_Schedule_Emp_name` varchar(255) DEFAULT NULL,
  `PM_Schedule_created_date` datetime DEFAULT NULL,
  `PM_Schedule_updated_by` int DEFAULT NULL,
  `PM_Schedule_updated_date` datetime DEFAULT NULL,
  `PM_Schedule_Start_Flag` int DEFAULT '0',
  `PM_Schedule_Approved_by_id` int DEFAULT '0',
  `PM_Schedule_Approved_date` datetime DEFAULT NULL,
  `PM_Schedule_Approve_Recomendations` text,
  `PM_Schedule_Rejected_by_id` int DEFAULT '0',
  `PM_Schedule_Rejected_date` datetime DEFAULT NULL,
  `PM_Schedule_Reject_Recomendations` text,
  `PM_Schedule_final_Signature` int DEFAULT '0',
  `Status` int DEFAULT '0',
  `status_updated_at` datetime DEFAULT NULL,
  `PM_Execution_Started_by_id` int DEFAULT NULL,
  `PM_Execution_Started_date` datetime DEFAULT NULL,
  `PM_Schedule_Completed_by_id` int DEFAULT '0',
  `PM_Schedule_Completed_date` datetime DEFAULT NULL,
  `PM_Schedule_Complete_Recomendations` text,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `PTW_Ttitle` varchar(255) DEFAULT NULL,
  `PTW_by_id` int DEFAULT '0',
  `PTW_Status` int DEFAULT '0',
  `PTW_Attached_At` datetime DEFAULT NULL,
  `Job_Card_Status` int DEFAULT '0',
  `Job_Card_date` datetime DEFAULT NULL,
  `Job_Card_id` int DEFAULT '0',
  `Job_Card_Name` varchar(255) DEFAULT NULL,
  `Job_Card_Code` varchar(128) DEFAULT NULL,
  `PM_Schedule_cancel_by_id` int DEFAULT '0',
  `PM_Schedule_cancel_date` datetime DEFAULT NULL,
  `PM_Schedule_cancel_Recomendations` text,
  `PM_Schedule_lat` double DEFAULT '0',
  `PM_Schedule_long` double DEFAULT '0',
  `PM_Schedule_ip` varchar(128) DEFAULT NULL,
  `PM_Schedule_UA` text,
  `PM_Schedule_Number` varchar(255) DEFAULT NULL,
  `PM_Maintenance_Order_Number` varchar(255) DEFAULT NULL,
  `PTW_Complete_Date` datetime DEFAULT NULL,
  `Asset_Sno` varchar(200) DEFAULT NULL,
  `PM_Rescheduled` int DEFAULT '0',
  `Prev_Schedule_id` int DEFAULT '0',
  `type_id` int DEFAULT NULL,
  `createdById` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Asset_id_index` (`Asset_id`),
  KEY `Asset_freg_status` (`Asset_id`,`PM_Frequecy_id`,`Status`)
) ENGINE=InnoDB AUTO_INCREMENT=6250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pm_schedule_files`
--

DROP TABLE IF EXISTS `pm_schedule_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_schedule_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PM_Schedule_id` int DEFAULT '0',
  `PM_Schedule_Code` varchar(128) DEFAULT NULL,
  `PM_Schedule_Title` varchar(128) DEFAULT NULL,
  `PM_Execution_id` int DEFAULT NULL,
  `Check_Point_id` int DEFAULT '0',
  `Check_Point_Code` varchar(128) DEFAULT NULL,
  `Check_Point_Name` varchar(255) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `PM_Event` int NOT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` double DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Type_ext` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  `Current_lat` varchar(100) DEFAULT NULL,
  `Current_long` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11546 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pm_task`
--

DROP TABLE IF EXISTS `pm_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_id` int DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `frequency_id` int DEFAULT NULL,
  `plan_date` date DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `ptw_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `started_by` int DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `closed_by` int DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `cancelled_by` int DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancel_approved_by` int DEFAULT NULL,
  `cancel_approved_at` datetime DEFAULT NULL,
  `cancel_rejected_by` int DEFAULT NULL,
  `cancel_rejected_at` datetime DEFAULT NULL,
  `status_updated_by` int DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `reject_remarks` varchar(45) DEFAULT NULL,
  `approve_remarks` varchar(45) DEFAULT NULL,
  `update_remarks` varchar(45) DEFAULT NULL,
  `cancel_remarks` varchar(255) DEFAULT NULL,
  `close_remarks` varchar(255) DEFAULT NULL,
  `prev_task_id` int DEFAULT NULL,
  `prev_task_done_date` datetime DEFAULT NULL,
  `rescheduled` int DEFAULT '0',
  `schedule_time` datetime DEFAULT NULL,
  `assigned_to_audit` varchar(45) DEFAULT NULL,
  `createdById` int DEFAULT NULL,
  `completedById` int DEFAULT NULL,
  `deletedById` int DEFAULT NULL,
  `close_rejected_by_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=899 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmplanassetchecklist`
--

DROP TABLE IF EXISTS `pmplanassetchecklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pmplanassetchecklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `planId` int DEFAULT NULL,
  `assetId` int DEFAULT NULL,
  `checklistId` int DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25263 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proposed_action_plan`
--

DROP TABLE IF EXISTS `proposed_action_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposed_action_plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `incidents_id` int DEFAULT NULL,
  `actions_as_per_plan` varchar(255) DEFAULT NULL,
  `responsibility` varchar(255) DEFAULT NULL,
  `target_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id_Status` int DEFAULT NULL,
  `hse_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `responsibility`
--

DROP TABLE IF EXISTS `responsibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsibility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `status` varchar(50) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roleaccess`
--

DROP TABLE IF EXISTS `roleaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleaccess` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleId` int DEFAULT '0',
  `featureId` int DEFAULT '0',
  `add` int DEFAULT '0',
  `edit` int DEFAULT '0',
  `delete` int DEFAULT '0',
  `view` int DEFAULT '0',
  `selfView` int NOT NULL,
  `issue` int NOT NULL DEFAULT '0',
  `approve` int NOT NULL DEFAULT '0',
  `lastModifiedAt` datetime DEFAULT NULL,
  `lastModifiedBy` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3846 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rolenotifications`
--

DROP TABLE IF EXISTS `rolenotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolenotifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `notificationId` int NOT NULL,
  `defaultFlag` int NOT NULL,
  `canChange` int NOT NULL DEFAULT '1',
  `lastModifiedAt` datetime NOT NULL,
  `lastModifiedBy` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `root_cause`
--

DROP TABLE IF EXISTS `root_cause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `root_cause` (
  `id` int NOT NULL AUTO_INCREMENT,
  `incidents_id` int DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_master`
--

DROP TABLE IF EXISTS `site_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site` varchar(45) DEFAULT NULL,
  `spvId` int DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `countryId` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smassetitems`
--

DROP TABLE IF EXISTS `smassetitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smassetitems` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `assetMasterID` int DEFAULT NULL,
  `materialID` int DEFAULT NULL,
  `facility_ID` int NOT NULL,
  `asset_code` varchar(200) NOT NULL,
  `serial_number` varchar(200) DEFAULT NULL,
  `replaced_asset_id` int NOT NULL DEFAULT '0',
  `replaced_serial_number` int DEFAULT NULL,
  `location_ID` int DEFAULT '0',
  `item_condition` int DEFAULT '1' COMMENT '1-new,2-used,3-',
  `status` int DEFAULT '0' COMMENT '1-available,2-hold,3-not available',
  `lastmodifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderflag` int DEFAULT NULL,
  `asset_type` int DEFAULT NULL,
  `reorder_qty` int DEFAULT NULL,
  `min_stock_qty` int DEFAULT NULL,
  `goods_order_ID` int DEFAULT NULL,
  `item_issued_mrs` int DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2318 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smassetmasterfiles`
--

DROP TABLE IF EXISTS `smassetmasterfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smassetmasterfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_master_id` int NOT NULL,
  `File_path` varchar(255) NOT NULL,
  `File_name` varchar(255) NOT NULL,
  `File_type` varchar(255) NOT NULL,
  `File_size` varchar(255) NOT NULL,
  `Uploaded_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smassetmasters`
--

DROP TABLE IF EXISTS `smassetmasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smassetmasters` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `plant_ID` int NOT NULL,
  `asset_code` varchar(200) NOT NULL,
  `asset_name` varchar(200) NOT NULL,
  `description` text,
  `asset_type_ID` int DEFAULT NULL,
  `item_category_ID` int DEFAULT NULL,
  `unit_of_measurement` int DEFAULT NULL,
  `approval_required` int DEFAULT NULL COMMENT '1-yes,2-no',
  `max_request_qty` int DEFAULT NULL,
  `reorder_qty` int DEFAULT NULL,
  `damaged_flag` int DEFAULT NULL,
  `flag` int NOT NULL,
  `lastmodifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `section` varchar(500) DEFAULT NULL,
  `isOpening` int DEFAULT NULL,
  `isImported` int DEFAULT NULL,
  `min_qty` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2331 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smassettypes`
--

DROP TABLE IF EXISTS `smassettypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smassettypes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `asset_type` varchar(100) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smdamageditems`
--

DROP TABLE IF EXISTS `smdamageditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smdamageditems` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `assetItemID` int NOT NULL,
  `orderDetailsID` int NOT NULL,
  `imageLink` text NOT NULL,
  `lastModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smgoodsorder`
--

DROP TABLE IF EXISTS `smgoodsorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smgoodsorder` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `facilityID` int NOT NULL,
  `vendorID` int DEFAULT NULL,
  `receiverID` int DEFAULT NULL,
  `generated_by` int DEFAULT NULL,
  `purchaseDate` datetime DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `challan_no` varchar(99) NOT NULL,
  `po_no` varchar(99) NOT NULL,
  `freight` varchar(99) NOT NULL,
  `transport` varchar(99) NOT NULL,
  `no_pkg_received` varchar(99) NOT NULL,
  `lr_no` varchar(99) NOT NULL,
  `condition_pkg_received` varchar(99) NOT NULL,
  `vehicle_no` varchar(99) NOT NULL,
  `gir_no` varchar(99) NOT NULL,
  `challan_date` datetime DEFAULT '0000-00-00 00:00:00',
  `po_date` datetime NOT NULL,
  `job_ref` varchar(999) NOT NULL,
  `amount` int NOT NULL,
  `currency` int NOT NULL DEFAULT '0',
  `status` int DEFAULT NULL,
  `lastModifiedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `generate_flag` int DEFAULT NULL,
  `s2s_generated_by` int DEFAULT NULL,
  `received_on` datetime DEFAULT NULL,
  `invoice_copy` text,
  `issued_by` varchar(10) DEFAULT NULL,
  `issued_on` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approvedOn` datetime DEFAULT NULL,
  `withdraw_by` int NOT NULL DEFAULT '0',
  `withdrawOn` datetime NOT NULL,
  `reorder_flag` int DEFAULT NULL,
  `order_type` int NOT NULL,
  `remarks` text,
  `updated_by` int DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejectedOn` datetime DEFAULT NULL,
  `is_purchaseorder` int DEFAULT NULL,
  `isOpening` int DEFAULT NULL,
  `isImported` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smgoodsorderdetails`
--

DROP TABLE IF EXISTS `smgoodsorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smgoodsorderdetails` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `purchaseID` int NOT NULL,
  `assetItemID` int DEFAULT NULL,
  `location_ID` int DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `ordered_qty` decimal(10,2) DEFAULT NULL,
  `received_qty` decimal(10,2) DEFAULT NULL,
  `lost_qty` decimal(10,2) DEFAULT NULL,
  `requested_qty` decimal(10,2) DEFAULT NULL,
  `damaged_qty` decimal(10,2) DEFAULT NULL,
  `accepted_qty` decimal(10,2) DEFAULT NULL,
  `manager_approve_qty` double(50,2) DEFAULT NULL,
  `lastModifiedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `spare_status` int DEFAULT NULL,
  `remarks` text,
  `order_type` int DEFAULT NULL,
  `receive_later` int NOT NULL DEFAULT '0',
  `added_to_store` int NOT NULL DEFAULT '0',
  `paid_by_ID` int DEFAULT NULL,
  `sr_no` varchar(250) DEFAULT NULL,
  `is_splited` int DEFAULT '0',
  `requestOrderId` int DEFAULT NULL,
  `requestOrderItemID` int DEFAULT NULL,
  `isOpening` int DEFAULT NULL,
  `isImported` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2356 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smimages`
--

DROP TABLE IF EXISTS `smimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smimages` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `assetItemID` int NOT NULL,
  `image_name` text,
  `imageLink` text NOT NULL,
  `ref_by` int DEFAULT NULL,
  `ref_id` int DEFAULT NULL,
  `flag` int DEFAULT NULL,
  `lastModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smitemcategory`
--

DROP TABLE IF EXISTS `smitemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smitemcategory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(200) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smmrs`
--

DROP TABLE IF EXISTS `smmrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smmrs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `is_mrs_return` int DEFAULT '0',
  `facility_ID` int NOT NULL,
  `whereUsedType` int DEFAULT NULL,
  `whereUsedRefID` int DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '0-waiting for approval,1-approved',
  `requested_date` datetime NOT NULL,
  `requested_by_emp_ID` int NOT NULL,
  `updated_by_emp_ID` int DEFAULT NULL,
  `approved_by_emp_ID` int NOT NULL DEFAULT '0',
  `approved_date` datetime DEFAULT NULL,
  `approval_status` int DEFAULT NULL COMMENT '0-pending,1-approve,2-reject',
  `approval_comment` text,
  `rejected_by_emp_ID` int(10) unsigned zerofill DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  `rejected_comment` varchar(250) DEFAULT NULL,
  `returnDate` datetime DEFAULT NULL,
  `reference` int DEFAULT NULL,
  `referenceID` int DEFAULT NULL,
  `lastmodifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` int DEFAULT NULL COMMENT '0-request,1-approved,2-return',
  `setAsTemplate` varchar(250) DEFAULT NULL,
  `templateName` text,
  `activity` varchar(500) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `issue_comment` varchar(500) DEFAULT NULL,
  `issuedAt` datetime DEFAULT NULL,
  `issued_by_emp_ID` int DEFAULT NULL,
  `issue_approved_by_emp_ID` int DEFAULT NULL,
  `issue_approved_date` datetime DEFAULT NULL,
  `issue_approval_comment` varchar(250) DEFAULT NULL,
  `issue_rejected_by_emp_ID` int DEFAULT NULL,
  `issue_rejected_date` datetime DEFAULT NULL,
  `issue_rejected_comment` varchar(250) DEFAULT NULL,
  `isfaulty` int DEFAULT NULL,
  `from_actor_type_id` int DEFAULT NULL,
  `from_actor_id` int DEFAULT NULL,
  `to_actor_type_id` int DEFAULT NULL,
  `to_actor_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smmrstemplate`
--

DROP TABLE IF EXISTS `smmrstemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smmrstemplate` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `emp_ID` int NOT NULL,
  `plant_ID` int NOT NULL,
  `saved_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smmrstemplateitems`
--

DROP TABLE IF EXISTS `smmrstemplateitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smmrstemplateitems` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `template_ID` int NOT NULL,
  `item_ID` int NOT NULL,
  `requested_qty` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smpaidby`
--

DROP TABLE IF EXISTS `smpaidby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smpaidby` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `paid_by` varchar(500) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smpofiles`
--

DROP TABLE IF EXISTS `smpofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smpofiles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `file_cat_ID` int NOT NULL,
  `file_name` text NOT NULL,
  `remarks` text,
  `file_path` text,
  `ref_by` int DEFAULT NULL,
  `ref_ID` int DEFAULT NULL,
  `lastModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smreorderdata`
--

DROP TABLE IF EXISTS `smreorderdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smreorderdata` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `asset_code_ID` int DEFAULT NULL,
  `asset_code` varchar(100) DEFAULT NULL,
  `plant_ID` int DEFAULT NULL,
  `max_qty` decimal(10,2) DEFAULT NULL,
  `min_qty` decimal(10,2) DEFAULT NULL,
  `ordered_qty` decimal(10,2) DEFAULT NULL,
  `lastModifiedTIme` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smrequestorder`
--

DROP TABLE IF EXISTS `smrequestorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smrequestorder` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `facilityID` int NOT NULL,
  `receiverID` int DEFAULT NULL,
  `generated_by` int DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `request_no` varchar(99) DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `amount` decimal(10,0) NOT NULL DEFAULT '0',
  `currency` int NOT NULL DEFAULT '0',
  `status` int DEFAULT NULL,
  `lastModifiedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `generate_flag` int DEFAULT NULL,
  `received_on` datetime DEFAULT NULL,
  `issued_by` varchar(10) DEFAULT NULL,
  `issued_on` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approvedOn` datetime DEFAULT NULL,
  `withdraw_by` int NOT NULL DEFAULT '0',
  `withdrawOn` datetime DEFAULT NULL,
  `reorder_flag` int DEFAULT NULL,
  `order_type` int DEFAULT '0',
  `remarks` text,
  `reject_reccomendations` varchar(500) DEFAULT NULL,
  `rejeccted_by` int DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smrequestorderdetails`
--

DROP TABLE IF EXISTS `smrequestorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smrequestorderdetails` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `requestID` int NOT NULL,
  `assetItemID` int DEFAULT NULL,
  `location_ID` int DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `ordered_qty` decimal(10,2) DEFAULT NULL,
  `received_qty` decimal(10,2) DEFAULT NULL,
  `lost_qty` decimal(10,2) DEFAULT NULL,
  `requested_qty` decimal(10,2) DEFAULT NULL,
  `damaged_qty` decimal(10,2) DEFAULT NULL,
  `accepted_qty` decimal(10,2) DEFAULT NULL,
  `manager_approve_qty` double(50,2) DEFAULT NULL,
  `lastModifiedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `spare_status` int DEFAULT NULL,
  `remarks` text,
  `order_type` int DEFAULT NULL,
  `receive_later` int NOT NULL DEFAULT '1',
  `added_to_store` int NOT NULL DEFAULT '0',
  `currencyId` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smrsitems`
--

DROP TABLE IF EXISTS `smrsitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smrsitems` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `mrs_ID` int NOT NULL,
  `mrs_return_ID` int NOT NULL,
  `asset_item_ID` int NOT NULL,
  `asset_MDM_code` varchar(100) DEFAULT NULL,
  `serial_number` varchar(50) DEFAULT NULL,
  `is_from_stock` int DEFAULT '0',
  `is_splited` int DEFAULT '0',
  `available_qty` decimal(10,2) DEFAULT NULL,
  `requested_qty` decimal(10,2) DEFAULT NULL,
  `approved_qty` decimal(10,2) DEFAULT NULL,
  `issued_qty` decimal(10,2) DEFAULT NULL,
  `used_qty` decimal(10,2) DEFAULT NULL,
  `returned_qty` decimal(10,2) DEFAULT NULL,
  `is_faulty` int DEFAULT NULL,
  `faulty_item_asset_id` int DEFAULT NULL,
  `approval_required` int DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '0-request,1-approved,2-reject',
  `flag` int DEFAULT NULL COMMENT '0-request,1-issued,2-returned',
  `lastmodifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isDamaged` int DEFAULT NULL,
  `finalRemark` text,
  `issue_remarks` varchar(450) DEFAULT NULL,
  `return_remarks` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smshipperhistory`
--

DROP TABLE IF EXISTS `smshipperhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smshipperhistory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ModuleType` varchar(10) NOT NULL,
  `ModuleRefId` int NOT NULL,
  `ShipperID` int NOT NULL,
  `Tracking_Number` varchar(50) NOT NULL,
  `PostedBy` int NOT NULL,
  `PostByName` varchar(50) NOT NULL,
  `ship_to_name` text NOT NULL,
  `ship_to_email` text NOT NULL,
  `ship_to_mobile` text NOT NULL,
  `ship_to_address` text NOT NULL,
  `comment` varchar(50) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smshippermaster`
--

DROP TABLE IF EXISTS `smshippermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smshippermaster` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `phone` int NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `shipper_url` text NOT NULL,
  `status` int DEFAULT '0',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smtransactiondetails`
--

DROP TABLE IF EXISTS `smtransactiondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smtransactiondetails` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `plantID` int NOT NULL,
  `mrsID` int DEFAULT '0',
  `mrsItemID` int DEFAULT '0',
  `fromActorID` int NOT NULL,
  `fromActorType` varchar(200) NOT NULL,
  `toActorID` int NOT NULL,
  `toActorType` varchar(200) NOT NULL,
  `assetItemID` int NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `isFaulty` int DEFAULT NULL,
  `referedby` varchar(100) NOT NULL,
  `reference_ID` int NOT NULL,
  `remarks` text NOT NULL,
  `Nature_Of_Transaction` int NOT NULL DEFAULT '0' COMMENT '1. fm_return',
  `Asset_Item_Status` int NOT NULL DEFAULT '0',
  `flag` int DEFAULT NULL,
  `lastInsetedDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isOpening` int DEFAULT NULL,
  `isImported` int DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2318 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smtransition`
--

DROP TABLE IF EXISTS `smtransition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smtransition` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `transactionID` int NOT NULL,
  `facilityID` int DEFAULT NULL,
  `goID` int DEFAULT NULL,
  `mrsID` int NOT NULL,
  `assetItemID` int NOT NULL,
  `actorType` varchar(200) NOT NULL,
  `actorID` int NOT NULL,
  `debitQty` decimal(10,2) NOT NULL,
  `creditQty` decimal(10,2) NOT NULL,
  `isFaulty` int DEFAULT NULL,
  `lastModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isOpening` int DEFAULT NULL,
  `isImported` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `assetItemId` (`assetItemID`),
  KEY `facilityId` (`facilityID`),
  KEY `act_id_fac_last_modifydt` (`actorType`,`ID`,`facilityID`,`lastModifiedDate`),
  KEY `acttype_fac_actid` (`actorType`,`facilityID`,`actorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6947 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smunitmeasurement`
--

DROP TABLE IF EXISTS `smunitmeasurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smunitmeasurement` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `flag` int NOT NULL,
  `decimal_status` int NOT NULL DEFAULT '0',
  `spare_multi_selection` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spv`
--

DROP TABLE IF EXISTS `spv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `addedBy` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_asset_access`
--

DROP TABLE IF EXISTS `st_asset_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_asset_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_id` int DEFAULT '0',
  `Asset_Code` varchar(128) DEFAULT NULL,
  `Asset_Access_User_id` int DEFAULT '0',
  `Asset_Access_User_Code` varchar(128) DEFAULT NULL,
  `Asset_Access_Group` int DEFAULT '0',
  `Asset_Access_Added_date` datetime DEFAULT NULL,
  `Asset_Access_Added_by` int DEFAULT '0',
  `Asset_Access_Update_date` datetime DEFAULT NULL,
  `Asset_Access_Update_by` int DEFAULT '0',
  `Asset_Access_Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_asset_category_checklist`
--

DROP TABLE IF EXISTS `st_asset_category_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_asset_category_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_Category_id` int DEFAULT '0',
  `Asset_Category_name` varchar(128) DEFAULT NULL,
  `Asset_Category_Parameter_title` varchar(255) DEFAULT NULL,
  `Asset_Category_Parameter_id` varchar(128) DEFAULT NULL,
  `Asset_Category_discription` varchar(200) DEFAULT NULL,
  `Asset_Category_Measure_input` int DEFAULT '0',
  `Asset_Category_Measure_input_name` varchar(200) DEFAULT NULL,
  `Added_date` datetime DEFAULT NULL,
  `Added_by` int DEFAULT '0',
  ` Update_by` int DEFAULT '0',
  `Update_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Parameter_Minvalue` int DEFAULT '0',
  `Parameter_Maxvalue` int DEFAULT '0',
  `Parameter_Idealvalue` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_asset_files`
--

DROP TABLE IF EXISTS `st_asset_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_asset_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_id` int DEFAULT '0',
  `Asset_Code` varchar(128) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` varchar(255) DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Asset_name` varchar(255) DEFAULT NULL,
  `File_Category_Code` varchar(255) DEFAULT NULL,
  `File_Name_Changed` varchar(255) DEFAULT NULL,
  `File_Type_ext` varchar(255) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `File_Size_bytes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_asset_inverter_checklist`
--

DROP TABLE IF EXISTS `st_asset_inverter_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_asset_inverter_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_Category_id` int DEFAULT '0',
  `Asset_Category_name` varchar(128) DEFAULT NULL,
  `Asset_Code` varchar(128) DEFAULT NULL,
  `Asset_name` varchar(128) DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Facility_Name` varchar(128) DEFAULT NULL,
  `Asset_Category_Parameter_title` varchar(255) DEFAULT NULL,
  `Asset_Category_Parameter_id` int DEFAULT '0',
  `Asset_id` int DEFAULT '0',
  `Added_date` datetime DEFAULT NULL,
  `Added_by` int DEFAULT '0',
  `Update_by` int DEFAULT '0',
  `Update_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  `parameter_value` varchar(200) DEFAULT '0',
  `parameter_description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_asset_list`
--

DROP TABLE IF EXISTS `st_asset_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_asset_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_id` int DEFAULT '0',
  `Asset_Code` varchar(128) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` double DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_asset_transfer`
--

DROP TABLE IF EXISTS `st_asset_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_asset_transfer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_Equipment_id` int DEFAULT '0',
  `Asset_Facility_id` int DEFAULT '0',
  `Asset_Facility_Name` varchar(128) DEFAULT NULL,
  `Asset_Current_location_id` int DEFAULT '0',
  `Asset_Transfer_Status` int DEFAULT '0',
  `Asset_Requested_by` int DEFAULT '0',
  `Asset_Request_name` varchar(128) DEFAULT NULL,
  `Asset_Requested_date` datetime DEFAULT NULL,
  `Asset_Request_code` varchar(128) DEFAULT NULL,
  `Asset_Request_Recommendation` varchar(128) DEFAULT NULL,
  `Asset_Approved_date` datetime DEFAULT NULL,
  `Asset_Approved_by` int DEFAULT '0',
  `Asset_Approved_name` varchar(128) DEFAULT NULL,
  `Asset_Approved_code` varchar(128) DEFAULT NULL,
  `Asset_Approver_Recommendations` varchar(128) DEFAULT NULL,
  `Asset_Rejected_date` datetime DEFAULT NULL,
  `Asset_Rejected_by` int DEFAULT '0',
  `Asset_Rejected_name` varchar(128) DEFAULT NULL,
  `Asset_Rejected_code` varchar(128) DEFAULT NULL,
  `Asset_Rejected_Recommendations` varchar(128) DEFAULT NULL,
  `Asset_Category_id` int DEFAULT '0',
  `Asset_Serial_No` varchar(128) DEFAULT NULL,
  `Asset_Code` varchar(128) DEFAULT NULL,
  `Asset_Parent_Equipment_name` varchar(128) DEFAULT NULL,
  `Asset_Parent_Equipment_id` int DEFAULT '0',
  `Parent_equipment_location` varchar(128) DEFAULT NULL,
  `Parent_equipment_location__name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_audit`
--

DROP TABLE IF EXISTS `st_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Audit_id` int DEFAULT '0',
  `Audit_Code` varchar(128) DEFAULT NULL,
  `Audit_Title` varchar(255) DEFAULT NULL,
  `Audit_Type_id` int DEFAULT '0',
  `Audit_Type_name` varchar(200) DEFAULT NULL,
  `Audit_Type_Code` varchar(128) DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Title` varchar(200) NOT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Audit_Done_by_id` int DEFAULT '0',
  `Audit_Done_by_name` varchar(200) DEFAULT NULL,
  `Audit_Added_date` datetime DEFAULT NULL,
  `Audit_update_date` datetime DEFAULT NULL,
  `Audit_update_by_id` int DEFAULT '0',
  `Audit_update_by_name` varchar(200) DEFAULT NULL,
  `Manager_id` int DEFAULT '0',
  `Manager_Code` varchar(128) DEFAULT NULL,
  `Manager_Name` varchar(200) DEFAULT NULL,
  `Status` int NOT NULL,
  `Audit_Done_Date` date DEFAULT NULL,
  `Audit_Due_Date` date DEFAULT NULL,
  `Audit_Start_Time` time NOT NULL,
  `Audit_Completion_Time` time NOT NULL,
  `plan_number` varchar(50) DEFAULT NULL,
  `Auditee_Emp_ID` int DEFAULT NULL,
  `Auditor_Emp_ID` int DEFAULT NULL,
  `Frequency` int DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Schedule_Date` datetime DEFAULT NULL,
  `Checklist_id` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_Date` datetime DEFAULT NULL,
  `approved_Comment` varchar(450) DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_Date` datetime DEFAULT NULL,
  `rejected_Comment` varchar(450) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `module_type_id` int DEFAULT NULL,
  `assignedTo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`Facility_Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_audit_check_list`
--

DROP TABLE IF EXISTS `st_audit_check_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_audit_check_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Audit_id` int DEFAULT '0',
  `Audit_Code` varchar(128) DEFAULT NULL,
  `Audit_Title` varchar(255) DEFAULT NULL,
  `Audit_Type_id` int DEFAULT '0',
  `Audit_Type_name` varchar(200) DEFAULT NULL,
  `Audit_Measure_value` varchar(128) DEFAULT NULL,
  `Audit_Measure_id` int DEFAULT '0',
  `Audit_Measure_title` varchar(255) DEFAULT NULL,
  `Audit_Measure_input` int DEFAULT '0',
  `Audit_Measure_input_name` varchar(200) DEFAULT NULL,
  `Audit_Measure_add_date` datetime DEFAULT NULL,
  `Audit_Measure_add_by` int DEFAULT '0',
  `Audit_Measure_update_date` datetime DEFAULT NULL,
  `Audit_Measure_status` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Facility_Title` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_audit_criteria_list`
--

DROP TABLE IF EXISTS `st_audit_criteria_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_audit_criteria_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Criteria_Name` varchar(99) NOT NULL,
  `Criteria_Type` int NOT NULL DEFAULT '0',
  `Is_Create_Ticket` int NOT NULL DEFAULT '0',
  `Default` int NOT NULL DEFAULT '0',
  `Status` int NOT NULL DEFAULT '1',
  `Added_By_User_ID` int NOT NULL DEFAULT '0',
  `Added_At` datetime NOT NULL,
  `Updated_By_User_ID` int NOT NULL,
  `Updated_At` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_audit_files`
--

DROP TABLE IF EXISTS `st_audit_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_audit_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Audit_id` int DEFAULT '0',
  `Audit_Code` varchar(128) DEFAULT NULL,
  `Audit_Title` varchar(128) DEFAULT NULL,
  `Audit_Checklist_id` int DEFAULT '0',
  `Audit_Checklist_Code` varchar(128) DEFAULT NULL,
  `Audit_Checklist_Name` varchar(200) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` double DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Check_Point_id` int DEFAULT '0',
  `Check_Point_Code` varchar(200) DEFAULT NULL,
  `Check_Point_Name` varchar(128) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Type_ext` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_audit_observation`
--

DROP TABLE IF EXISTS `st_audit_observation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_audit_observation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Audit_id` int NOT NULL DEFAULT '0',
  `Audit_Code` varchar(255) DEFAULT NULL,
  `Check_Point_id` int DEFAULT NULL,
  `Check_Point_Name` varchar(255) DEFAULT NULL,
  `Check_Point_Code` varchar(255) DEFAULT NULL,
  `Audit_Observation` text,
  `Audit_Observation_added_by` int DEFAULT NULL,
  `Audit_Observation_add_date` datetime DEFAULT NULL,
  `Audit_Observation_update_by` int DEFAULT NULL,
  `Audit_Observation_update_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Check_Point_Requirement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_audit_type_checklist`
--

DROP TABLE IF EXISTS `st_audit_type_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_audit_type_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Audit_Type_id` int DEFAULT '0',
  `Audit_Type_name` varchar(200) DEFAULT NULL,
  `Audit_Type_Measure_id` int DEFAULT '0',
  `Audit_Type_Measure_title` varchar(255) DEFAULT NULL,
  `Audit_Type_Measure_discription` text,
  `Audit_Type_Measure_input` int DEFAULT '0',
  `Audit_Type_Measure_input_name` varchar(200) DEFAULT NULL,
  `Audit_Type_Measure_add_date` datetime DEFAULT NULL,
  `Audit_Type_Measure_add_by` int DEFAULT '0',
  `Audit_Type_Measure_update_date` datetime DEFAULT NULL,
  `Audit_Type_Measure_status` int DEFAULT '0',
  `Audit_Type_Measure_update_by` int DEFAULT NULL,
  `Audit_Type_Measure_Upload_Image` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_audit_type_list`
--

DROP TABLE IF EXISTS `st_audit_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_audit_type_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Audit_Type_id` int DEFAULT '0',
  `Audit_Type_Code` varchar(128) DEFAULT NULL,
  `Audit_Type_Title` varchar(255) DEFAULT NULL,
  `Audit_Type_Discription` text,
  `Audit_Type_status` int DEFAULT '0',
  `Audit_Type_add_by` int DEFAULT '0',
  `Audit_Type_add_date` datetime DEFAULT NULL,
  `Audit_Type_update_by` int DEFAULT '0',
  `Audit_Type_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_broadcast_msg`
--

DROP TABLE IF EXISTS `st_broadcast_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_broadcast_msg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '1',
  `title` varchar(100) NOT NULL,
  `remark` text NOT NULL,
  `text_color` varchar(20) NOT NULL,
  `text_height` int NOT NULL,
  `cover_screen_speed` int NOT NULL COMMENT 'higher speed is slower,speed in secs, eg: 2s',
  `url` varchar(100) NOT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_business_category_list`
--

DROP TABLE IF EXISTS `st_business_category_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_business_category_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Business_Cat_Name` varchar(255) DEFAULT 'NULL',
  `Business_Cat_Code` varchar(255) DEFAULT 'NULL',
  `Business_Cat_Discription` text,
  `Business_Cat_Added_date` datetime DEFAULT NULL,
  `Business_Cat_Updated_date` datetime DEFAULT NULL,
  `Business_Cat_Status` int DEFAULT '0',
  `Business_Cat_Added_by` int DEFAULT '0',
  `Business_Cat_Update_by` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_business_files`
--

DROP TABLE IF EXISTS `st_business_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_business_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Business_id` int DEFAULT '0',
  `Business_Code` varchar(128) DEFAULT 'NULL',
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(100) DEFAULT 'NULL',
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` varchar(200) DEFAULT '0',
  `File_Size_bytes` varchar(128) DEFAULT 'NULL',
  `File_Type_ext` varchar(255) DEFAULT NULL,
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_business_products`
--

DROP TABLE IF EXISTS `st_business_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_business_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Business_id` int DEFAULT '0',
  `Business_Name` varchar(200) DEFAULT NULL,
  `Product_Name` varchar(255) DEFAULT NULL,
  `Product_Code` varchar(255) DEFAULT NULL,
  `Product_Discription` text,
  `Product_Type_id` int DEFAULT '0',
  `Product_Type_name` varchar(255) DEFAULT NULL,
  `Product_Type_code` varchar(128) DEFAULT NULL,
  `Product_Category_id` int DEFAULT '0',
  `Product_Category_name` varchar(255) DEFAULT NULL,
  `Product_Category_Code` varchar(255) DEFAULT NULL,
  `Product_Cost` double DEFAULT '0',
  `Product_Cost_Currency` varchar(128) DEFAULT NULL,
  `Product_Added_date` datetime DEFAULT NULL,
  `Product_Updated_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_cmms_log`
--

DROP TABLE IF EXISTS `st_cmms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_cmms_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Module_Name` varchar(50) DEFAULT NULL,
  `Data_ID` int DEFAULT NULL,
  `Old_Data` text,
  `New_Data` text,
  `Updated_Field_Name` varchar(200) DEFAULT NULL,
  `Updated_By` int DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL,
  `IP_Address` varchar(100) DEFAULT NULL,
  `User_Agent` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_customer`
--

DROP TABLE IF EXISTS `st_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(255) DEFAULT NULL,
  `Customer_id` varchar(255) DEFAULT NULL,
  `Customer_Code` varchar(255) DEFAULT NULL,
  `Customer_Email` varchar(255) DEFAULT NULL,
  `Customer_Landline` varchar(128) DEFAULT NULL,
  `Customer_Mobile` varchar(128) DEFAULT NULL,
  `Customer_Website` varchar(128) DEFAULT NULL,
  `Customer_Address` text,
  `Customer_City` varchar(128) DEFAULT NULL,
  `Customer_State` varchar(128) DEFAULT NULL,
  `Customer_Country` varchar(128) DEFAULT NULL,
  `Customer_ZIP` double DEFAULT '0',
  `Customer_Person_id` int DEFAULT '0',
  `Customer_Person_name` varchar(255) DEFAULT NULL,
  `Customer_Photo_id` int DEFAULT '0',
  `Customer_Added_date` datetime DEFAULT NULL,
  `Customer_Added_by` int DEFAULT '0',
  `Customer_Updated_date` datetime DEFAULT NULL,
  `Customer_Updated_by` int DEFAULT '0',
  `Customer_Status` int DEFAULT '0',
  `Customer_Notes` text,
  `Customer_Alt_Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_customer_details`
--

DROP TABLE IF EXISTS `st_customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_customer_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_customer_emp_details`
--

DROP TABLE IF EXISTS `st_customer_emp_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_customer_emp_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Emp_id` int NOT NULL,
  `Emp_user_id` int DEFAULT '0',
  `Emp_Nick_name` varchar(255) NOT NULL,
  `Emp_First_Name` varchar(255) NOT NULL,
  `Emp_Last_Name` varchar(255) NOT NULL,
  `Emp_Code` varchar(150) NOT NULL,
  `Emp_Role` varchar(150) NOT NULL,
  `Emp_Designation` varchar(150) NOT NULL,
  `Emp_Job_Code` varchar(150) NOT NULL,
  `Emp_Remarks` text NOT NULL,
  `Emp_Joining_Date` date NOT NULL,
  `Emp_Added_date` datetime NOT NULL,
  `Emp_update_date` datetime NOT NULL,
  `Emp_Status` int NOT NULL,
  `Emp_Adress` text NOT NULL,
  `Emp_mob_num` varchar(100) NOT NULL,
  `Emp_Email_id` varchar(255) NOT NULL,
  `Emp_land_line` varchar(100) NOT NULL,
  `Emp_Alt_number` varchar(100) NOT NULL,
  `Emp_Photo_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_customer_files`
--

DROP TABLE IF EXISTS `st_customer_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_customer_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Customer_id` int DEFAULT '0',
  `Customer_Code` varchar(128) DEFAULT 'NULL',
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Name_Changed` varchar(255) DEFAULT NULL,
  `File_Category_Code` varchar(255) DEFAULT NULL,
  `File_Size` varchar(255) DEFAULT '0',
  `File_Size_bytes` varchar(128) DEFAULT '',
  `File_Type_ext` varchar(255) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_dgr`
--

DROP TABLE IF EXISTS `st_dgr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_dgr` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `plant_id` int NOT NULL,
  `plant_start_time` time NOT NULL,
  `plant_stop_time` time NOT NULL,
  `ref_PR` double NOT NULL,
  `PR` double NOT NULL,
  `PR_load_shedding` double NOT NULL,
  `specific_yield` double NOT NULL,
  `PLF` double NOT NULL,
  `plant_avail` double NOT NULL,
  `grid_avail` double NOT NULL,
  `operation_Hrs` double NOT NULL,
  `export_energy_kWh` double NOT NULL,
  `aux_consume_kWh` double NOT NULL,
  `peak_POA_w_m2` double NOT NULL,
  `peak_power_MW` double NOT NULL,
  `POA_kWh_m2` double NOT NULL,
  `GHI_kWh_m2` double NOT NULL,
  `average_module_temp` double NOT NULL,
  `inverter_BD_SD_Hrs` double NOT NULL,
  `curtilment_Hrs` double NOT NULL,
  `grid_down_time` double NOT NULL,
  `CUF` double NOT NULL,
  `CUF_load_shedding` double NOT NULL,
  `generation_33kV_export` double NOT NULL,
  `generation_33kV_import` double NOT NULL,
  `generation_inverter_kWh` double NOT NULL,
  `tilt_irradiance_POA` double NOT NULL,
  `AC_losses_day_Aux_consumption` double NOT NULL,
  `load_shedding_loss_33kV` double NOT NULL,
  `load_shedding_inverter_level` double NOT NULL,
  `inverter_energy_generation` double NOT NULL,
  `date` date NOT NULL,
  `Batch_id` int DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  `import_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_dgr_batch`
--

DROP TABLE IF EXISTS `st_dgr_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_dgr_batch` (
  `batch_id` int NOT NULL AUTO_INCREMENT,
  `imported_by_emp_id` int DEFAULT NULL,
  `employee_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_file_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_Timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`batch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_dgr_generate_files`
--

DROP TABLE IF EXISTS `st_dgr_generate_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_dgr_generate_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Plant_id` int NOT NULL,
  `From_Date` date NOT NULL,
  `To_Date` date NOT NULL,
  `File_Name` varchar(255) NOT NULL,
  `Generated_By` varchar(255) NOT NULL,
  `Generated_Date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_dgr_inverters`
--

DROP TABLE IF EXISTS `st_dgr_inverters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_dgr_inverters` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DGR_ID` int NOT NULL,
  `plant_id` int NOT NULL,
  `inverter_name` varchar(100) NOT NULL,
  `total` double NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_distribution_list`
--

DROP TABLE IF EXISTS `st_distribution_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_distribution_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plant_id` int NOT NULL,
  `Dlist_name` varchar(255) NOT NULL,
  `Dlist_description` text NOT NULL,
  `Dlist_created_by` int NOT NULL,
  `Dlist_created_at` datetime NOT NULL,
  `Dlist_edited_by` int NOT NULL,
  `Dlist_edited_at` datetime NOT NULL,
  `Active` char(1) NOT NULL COMMENT 'Yes:Y,No:N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_distribution_list_type`
--

DROP TABLE IF EXISTS `st_distribution_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_distribution_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plant_id` int NOT NULL,
  `dl_type` varchar(25) NOT NULL,
  `dl_name` varchar(250) NOT NULL,
  `dl_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_emp_files`
--

DROP TABLE IF EXISTS `st_emp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_emp_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Emp_id` int DEFAULT '0',
  `Emp_Code` varchar(128) DEFAULT 'NULL',
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Size` varchar(255) DEFAULT '0',
  `File_Size_bytes` varchar(128) DEFAULT 'NULL',
  `File_Category_code` varchar(255) DEFAULT NULL,
  `File_Name_Changed` varchar(255) DEFAULT NULL,
  `File_Type_ext` varchar(255) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_updated_by` int DEFAULT NULL,
  `File_updated_date` datetime DEFAULT NULL,
  `File_added_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_emp_job_list`
--

DROP TABLE IF EXISTS `st_emp_job_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_emp_job_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Job_id` varchar(128) DEFAULT NULL,
  `Job_Code` varchar(128) DEFAULT NULL,
  `Job_Name` varchar(200) DEFAULT NULL,
  `Job_Discription` text,
  `Added_date` datetime DEFAULT NULL,
  `Added_by` int DEFAULT '0',
  `Updated_date` datetime DEFAULT NULL,
  `Updated_by` int DEFAULT '0',
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_emp_plants_assigned`
--

DROP TABLE IF EXISTS `st_emp_plants_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_emp_plants_assigned` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Emp_id` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `CMS_access` int DEFAULT '0',
  `CMMS_access` int DEFAULT '0',
  `PTW_access` int DEFAULT '0',
  `JC_access` int DEFAULT '0',
  `TKT_access` int DEFAULT '0',
  `access_satus` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_empdetails_distribution_list`
--

DROP TABLE IF EXISTS `st_empdetails_distribution_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_empdetails_distribution_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plant_id` int NOT NULL,
  `Dlist_id` int NOT NULL,
  `Dlist_emp_id` int NOT NULL,
  `unsubscribed_by_employee` int NOT NULL DEFAULT '0' COMMENT '0-false,1-True',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_execution_files`
--

DROP TABLE IF EXISTS `st_execution_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_execution_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Schedule_id` int DEFAULT '0',
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `Event` int NOT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` double DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Type_ext` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  `Check_Point_id` int DEFAULT '0',
  `Check_Point_Code` varchar(128) DEFAULT NULL,
  `Check_Point_Name` varchar(255) DEFAULT NULL,
  `Document_Name` varchar(999) NOT NULL,
  `Current_lat` varchar(100) NOT NULL,
  `Current_long` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_facility_details`
--

DROP TABLE IF EXISTS `st_facility_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_facility_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Facility_id` int DEFAULT '0',
  `Facility_Code` varchar(255) DEFAULT NULL,
  `Facility_AC_Capacity` double DEFAULT '0',
  `Facility_AC_Unit` varchar(128) DEFAULT NULL,
  `Facility_DC_Capacity` double DEFAULT '0',
  `Facility_DC_unit` varchar(128) DEFAULT NULL,
  `Facility_Unit_Price` double DEFAULT '0',
  `Facility_Unit_Currency` varchar(128) DEFAULT NULL,
  `Facility_Notes` varchar(255) DEFAULT NULL,
  `Facility_bar_code` int DEFAULT NULL,
  `Facility_Details_Added_by` int DEFAULT NULL,
  `Facility_Details_Added_date` datetime DEFAULT NULL,
  `Facility_Details_Updated_by` int DEFAULT NULL,
  `Facility_Details_Updated_date` datetime DEFAULT NULL,
  `Status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_facility_files`
--

DROP TABLE IF EXISTS `st_facility_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_facility_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Facility_id` int DEFAULT '0',
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Facility_name` varchar(128) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Type_ext` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_facility_type`
--

DROP TABLE IF EXISTS `st_facility_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_facility_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Facility_Type_Code` varchar(255) DEFAULT NULL,
  `Facility_Type_Name` varchar(255) DEFAULT NULL,
  `Facility_Type_Discription` text,
  `Facility_Type_Added_date` datetime DEFAULT NULL,
  `Facility_Type_Updated_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Facility_Type_Added_by` int DEFAULT '0',
  `Facility_Type_Update_by` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_feedback`
--

DROP TABLE IF EXISTS `st_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Feedback_id` int DEFAULT '0',
  `Feedback_Code` varchar(128) DEFAULT NULL,
  `Campiagn_id` int NOT NULL,
  `HOTO_Type_id` int NOT NULL DEFAULT '0',
  `Feedback_Type_id` int DEFAULT '0',
  `Feedback_Type_name` varchar(200) DEFAULT NULL,
  `Feedback_Type_Code` varchar(128) DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Title` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Block_id` int DEFAULT '0',
  `Block_Name` varchar(200) DEFAULT NULL,
  `Block_Code` varchar(128) DEFAULT NULL,
  `Feedback_Done_by_id` int DEFAULT '0',
  `Feedback_Done_by_name` varchar(200) DEFAULT NULL,
  `Feedback_Added_date` datetime DEFAULT NULL,
  `Feedback_update_date` datetime DEFAULT NULL,
  `Feedback_update_by_id` int DEFAULT '0',
  `Feedback_update_by_name` varchar(200) DEFAULT NULL,
  `Customer_Representative_id` int DEFAULT '0',
  `Customer_Representative_Code` varchar(128) DEFAULT NULL,
  `Customer_Representative_Name` varchar(200) DEFAULT NULL,
  `Company_Name` varchar(128) DEFAULT NULL,
  `Visitor_Name` varchar(200) DEFAULT NULL,
  `Email_id` varchar(200) DEFAULT NULL,
  `Contact_No` varchar(128) DEFAULT NULL,
  `Purpose_Visit` varchar(255) DEFAULT NULL,
  `Designation` varchar(200) NOT NULL,
  `Visitor_info` varchar(255) DEFAULT NULL,
  `Feedback_Status` int DEFAULT '0',
  `Submit_Type` int NOT NULL DEFAULT '0' COMMENT '1-email,2-QR code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_feedback_check_list`
--

DROP TABLE IF EXISTS `st_feedback_check_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_feedback_check_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Feedback_id` int DEFAULT '0',
  `Feedback_Code` varchar(128) DEFAULT NULL,
  `Feedback_Type_id` int DEFAULT '0',
  `Feedback_Type_Name` varchar(200) DEFAULT NULL,
  `Feedback_Type_Code` varchar(128) DEFAULT NULL,
  `Feedback_Measure_value` varchar(128) DEFAULT NULL,
  `Feedback_Measure_value2` int NOT NULL COMMENT '1-poor,2-avg,3-good,4-verygood,5-excelent',
  `Feedback_Measure_rematk` text NOT NULL,
  `Feedback_Measure_id` int DEFAULT '0',
  `Feedback_Measure_title` varchar(255) DEFAULT NULL,
  `Feedback_Measure_input` int DEFAULT '0',
  `Feedback_Measure_input_name` varchar(200) DEFAULT NULL,
  `Feedback_Measure_add_date` datetime DEFAULT NULL,
  `Feedback_Measure_add_by` int DEFAULT '0',
  `Feedback_Measure_update_date` datetime DEFAULT NULL,
  `Feedback_Measure_status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_feedback_files`
--

DROP TABLE IF EXISTS `st_feedback_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_feedback_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HOTO_id` int DEFAULT '0',
  `HOTO_Code` varchar(128) DEFAULT NULL,
  `HOTO_Title` varchar(128) DEFAULT NULL,
  `HOTO_Checklist_id` int DEFAULT '0',
  `HOTO_Checklist_Code` varchar(128) DEFAULT NULL,
  `HOTO_Checklist_Name` varchar(200) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` double DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Facility_Name` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Type_ext` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_feedback_type_checklist`
--

DROP TABLE IF EXISTS `st_feedback_type_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_feedback_type_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HOTO_Type_id` int DEFAULT '0',
  `HOTO_Type_name` varchar(200) DEFAULT NULL,
  `HOTO_Type_Measure_id` int DEFAULT '0',
  `HOTO_Type_Measure_title` varchar(255) DEFAULT NULL,
  `HOTO_Type_Measure_discription` text,
  `HOTO_Type_Measure_input` int DEFAULT '0',
  `HOTO_Rquired_Status` varchar(200) DEFAULT NULL,
  `HOTO_Type_Measure_input_name` varchar(200) DEFAULT NULL,
  `HOTO_Type_Measure_add_date` datetime DEFAULT NULL,
  `HOTO_Type_Measure_add_by` int DEFAULT '0',
  `HOTO_Type_Measure_update_date` datetime DEFAULT NULL,
  `HOTO_Type_Measure_status` int DEFAULT '0',
  `HOTO_Type_Measure_update_by` datetime DEFAULT NULL,
  `Feedback_Good` int DEFAULT NULL,
  `Feedback_Poor` int DEFAULT NULL,
  `Feedback_VeryGood` int DEFAULT NULL,
  `Feedback_Excellent` int DEFAULT NULL,
  `Feedback_Average` int DEFAULT NULL,
  `HOTO_Type_Code` varchar(128) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `questatus` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_feedback_type_list`
--

DROP TABLE IF EXISTS `st_feedback_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_feedback_type_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HOTO_Type_id` int DEFAULT '0',
  `HOTO_Type_Code` varchar(128) DEFAULT NULL,
  `HOTO_Type_Title` varchar(255) DEFAULT NULL,
  `HOTO_Type_Discription` text,
  `HOTO_Type_status` int DEFAULT '0',
  `HOTO_Type_add_by` int DEFAULT '0',
  `HOTO_Type_add_date` datetime DEFAULT NULL,
  `HOTO_Type_update_by` int DEFAULT '0',
  `HOTO_Type_update_date` datetime DEFAULT NULL,
  `HOTO_Expiry_status` int NOT NULL,
  `HOTO_Expity_date` datetime NOT NULL,
  `Feedback_Type` int NOT NULL COMMENT '1-customer,2-visitor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_file_type`
--

DROP TABLE IF EXISTS `st_file_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_file_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `File_Type_Code` varchar(255) DEFAULT NULL,
  `File_Type_Name` varchar(255) DEFAULT NULL,
  `File_Formats_Allowed` varchar(255) DEFAULT NULL,
  `File_Type_Discription` text,
  `File_Type_Added_date` datetime DEFAULT NULL,
  `File_Type_Updated_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  `File_Type_Added_by` int DEFAULT '0',
  `File_Type_Update_by` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_files`
--

DROP TABLE IF EXISTS `st_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `File_Belongs_to` varchar(128) DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Facility_name` varchar(128) DEFAULT NULL,
  `Asset_id` int DEFAULT '0',
  `Asset_Code` varchar(128) DEFAULT NULL,
  `Asset_name` varchar(200) DEFAULT NULL,
  `Emp_id` int DEFAULT '0',
  `Emp_Code` varchar(128) DEFAULT NULL,
  `Emp_name` varchar(128) DEFAULT NULL,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `PTW_Name` varchar(200) DEFAULT NULL,
  `JC_id` int DEFAULT '0',
  `JC_Code` varchar(128) DEFAULT NULL,
  `JC_Name` varchar(200) DEFAULT NULL,
  `TBT_id` int DEFAULT '0',
  `TBT_Code` varchar(128) DEFAULT NULL,
  `TBT_Name` varchar(200) DEFAULT NULL,
  `Business_id` int DEFAULT '0',
  `Business_Code` varchar(128) DEFAULT NULL,
  `Business_Name` varchar(200) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Type_ext` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  `Status` int DEFAULT '0',
  `Access_Emp_id` int DEFAULT '0',
  `Access_Emp_Code` varchar(128) DEFAULT NULL,
  `Access_Emp_Name` varchar(200) DEFAULT NULL,
  `HAZOB_id` int DEFAULT NULL,
  `HAZOB_Code` varchar(255) DEFAULT NULL,
  `HAZOB_Title` varchar(255) DEFAULT NULL,
  `Current_lat` varchar(100) NOT NULL,
  `Current_long` varchar(100) NOT NULL,
  `JMR_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_global_setting`
--

DROP TABLE IF EXISTS `st_global_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_global_setting` (
  `show_other_work_type` int NOT NULL DEFAULT '0',
  `show_other_standard_action` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hazob`
--

DROP TABLE IF EXISTS `st_hazob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hazob` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HAZOB_id` int DEFAULT '0',
  `HAZOB_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Title` varchar(255) DEFAULT NULL,
  `HAZOB_Type_id` int DEFAULT '0',
  `HAZOB_Type_name` varchar(200) DEFAULT NULL,
  `HAZOB_Type_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Facility_id` int DEFAULT '0',
  `HAZOB_Facility_Title` varchar(200) DEFAULT NULL,
  `HAZOB_Facility_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Block_id` int DEFAULT '0',
  `HAZOB_Block_Name` varchar(200) DEFAULT NULL,
  `HAZOB_Block_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Done_by_id` int DEFAULT '0',
  `HAZOB_Done_by_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Done_by_Name` varchar(200) DEFAULT NULL,
  `HAZOB_Added_date` datetime DEFAULT NULL,
  `HAZOB_Added_id` int DEFAULT '0',
  `HAZOB_update_date` datetime DEFAULT NULL,
  `HAZOB_update_by_id` int DEFAULT '0',
  `HAZOB_update_by_name` varchar(200) DEFAULT NULL,
  `HAZOB_Type_Risk` varchar(200) DEFAULT '0',
  `HAZOB_Observation` varchar(256) DEFAULT NULL,
  `HAZOB_Asset_id` int DEFAULT '0',
  `HAZOB_Asset_Name` varchar(200) DEFAULT NULL,
  `HAZOB_Asset_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Status` int DEFAULT '0',
  `Feedback_done_status` int DEFAULT '0',
  `Feedback_done_by_id` int DEFAULT '0',
  `Feedback_done_by_Code` varchar(128) DEFAULT NULL,
  `Feedback_done_by_name` varchar(200) DEFAULT NULL,
  `Feedback_done_by_date` datetime DEFAULT NULL,
  `Feedback_approve_status` int DEFAULT '0',
  `Feedback_approve_by_id` int DEFAULT '0',
  `Feedback_approve_by_Code` varchar(128) DEFAULT NULL,
  `Feedback_approve_by_name` varchar(200) DEFAULT NULL,
  `Feedback_approve_date` datetime DEFAULT NULL,
  `Feedback` text,
  `HAZOB_Reporting_id` int DEFAULT NULL,
  `HAZOB_Reporting_Name` varchar(200) DEFAULT NULL,
  `HAZOB_Reporting_Code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hazob_block_list`
--

DROP TABLE IF EXISTS `st_hazob_block_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hazob_block_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HAZOB_id` int DEFAULT '0',
  `HAZOB_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Title` varchar(255) DEFAULT NULL,
  `HAZOB_Facility_id` int DEFAULT '0',
  `HAZOB_Facility_Title` varchar(200) DEFAULT NULL,
  `HAZOB_Facility_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Block_id` int DEFAULT '0',
  `HAZOB_Block_Name` varchar(200) DEFAULT NULL,
  `HAZOB_Block_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Added_date` datetime DEFAULT NULL,
  `Block_Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hazob_files`
--

DROP TABLE IF EXISTS `st_hazob_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hazob_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HAZOB_id` int DEFAULT '0',
  `HAZOB_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Title` varchar(128) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` varchar(200) DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Facility_Name` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Type_ext` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hazob_questions`
--

DROP TABLE IF EXISTS `st_hazob_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hazob_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HAZOB_Type_id` int DEFAULT '0',
  `HAZOB_Type_name` varchar(200) DEFAULT NULL,
  `HAZOB_Question_id` int DEFAULT '0',
  `HAZOB_Question_title` varchar(255) DEFAULT NULL,
  `HAZOB_Question_discription` text,
  `HAZOB_Question_Status` varchar(200) DEFAULT NULL,
  `HAZOB_Question_add_date` datetime DEFAULT NULL,
  `HAZOB_Question_add_by` int DEFAULT '0',
  `HAZOB_Question_update_date` datetime DEFAULT NULL,
  `HAZOB_Question_update_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hazob_type`
--

DROP TABLE IF EXISTS `st_hazob_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hazob_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HAZOB_Type_id` int DEFAULT '0',
  `HAZOB_Type_Code` varchar(128) DEFAULT NULL,
  `HAZOB_Type_Title` varchar(255) DEFAULT NULL,
  `HAZOB_Type_Discription` text,
  `HAZOB_Type_status` int DEFAULT '0',
  `HAZOB_Type_add_by` int DEFAULT '0',
  `HAZOB_Type_add_date` datetime DEFAULT NULL,
  `HAZOB_Type_update_by` int DEFAULT '0',
  `HAZOB_Type_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hoto`
--

DROP TABLE IF EXISTS `st_hoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hoto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HOTO_id` int DEFAULT '0',
  `HOTO_Code` varchar(128) DEFAULT NULL,
  `HOTO_Title` varchar(255) DEFAULT NULL,
  `HOTO_Type_id` int DEFAULT '0',
  `HOTO_Type_name` varchar(200) DEFAULT NULL,
  `HOTO_Type_Code` varchar(128) DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Title` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Block_id` int DEFAULT '0',
  `Block_Name` varchar(200) DEFAULT NULL,
  `Block_Code` varchar(128) DEFAULT NULL,
  `HOTO_Done_by_id` int DEFAULT '0',
  `HOTO_Done_by_name` varchar(200) DEFAULT NULL,
  `HOTO_Added_date` datetime DEFAULT NULL,
  `HOTO_update_date` datetime DEFAULT NULL,
  `HOTO_update_by_id` int DEFAULT '0',
  `HOTO_update_by_name` varchar(200) DEFAULT NULL,
  `EPC_Representative_id` int DEFAULT '0',
  `EPC_Representative_Code` varchar(128) DEFAULT NULL,
  `EPC_Representative_Name` varchar(200) DEFAULT NULL,
  `OnM_Representative_id` int DEFAULT '0',
  `OnM_Representative_Code` varchar(128) DEFAULT NULL,
  `OnM_Representative_Name` varchar(200) DEFAULT NULL,
  `Asset_id` int DEFAULT '0',
  `Asset_Name` varchar(200) DEFAULT NULL,
  `Asset_Code` varchar(128) DEFAULT NULL,
  `HOTO_Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hoto_check_list`
--

DROP TABLE IF EXISTS `st_hoto_check_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hoto_check_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HOTO_id` int DEFAULT '0',
  `HOTO_Code` varchar(128) DEFAULT NULL,
  `HOTO_Title` varchar(255) DEFAULT NULL,
  `HOTO_Type_id` int DEFAULT '0',
  `HOTO_Type_Name` varchar(200) DEFAULT NULL,
  `HOTO_Type_Code` varchar(128) DEFAULT NULL,
  `HOTO_Measure_value` varchar(128) DEFAULT NULL,
  `HOTO_Measure_id` int DEFAULT '0',
  `HOTO_Measure_title` varchar(255) DEFAULT NULL,
  `HOTO_Measure_input` int DEFAULT '0',
  `HOTO_Measure_input_name` varchar(200) DEFAULT NULL,
  `HOTO_Rquired_Status` varchar(200) DEFAULT NULL,
  `HOTO_Measure_Remarks` text,
  `HOTO_Measure_add_date` datetime DEFAULT NULL,
  `HOTO_Measure_add_by` int DEFAULT '0',
  `HOTO_Measure_update_date` datetime DEFAULT NULL,
  `HOTO_Measure_status` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Facility_Title` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hoto_execution`
--

DROP TABLE IF EXISTS `st_hoto_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hoto_execution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Schedule_Id` int NOT NULL DEFAULT '0',
  `CheckList_Type` int NOT NULL DEFAULT '0',
  `Check_Point_id` int DEFAULT NULL,
  `Check_Point_Name` text,
  `Check_Point_Code` text,
  `Check_Point_Remark` text,
  `ticket_created` int NOT NULL DEFAULT '0' COMMENT '0 - No, 1 - Yes',
  `criteria_id` int NOT NULL,
  `custom_checkpoint` int NOT NULL DEFAULT '0' COMMENT '0 - No, 1 - Yes',
  `evidence_required` int NOT NULL DEFAULT '0',
  `Schedule_added_by` int DEFAULT NULL,
  `Schedule_add_date` datetime DEFAULT NULL,
  `Schedule_update_by` int DEFAULT NULL,
  `Schedule_update_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Check_Point_Requirement` varchar(255) DEFAULT NULL,
  `Document_Name` varchar(999) NOT NULL,
  `Location` varchar(999) NOT NULL,
  `Doc_Type` int NOT NULL,
  `Document_Type` varchar(999) NOT NULL,
  `Is_Document_Approved` int NOT NULL DEFAULT '0',
  `Document_Approved_Remark` varchar(999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hoto_files`
--

DROP TABLE IF EXISTS `st_hoto_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hoto_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HOTO_id` int DEFAULT '0',
  `HOTO_Code` varchar(128) DEFAULT NULL,
  `HOTO_Title` varchar(128) DEFAULT NULL,
  `HOTO_Checklist_id` int DEFAULT '0',
  `HOTO_Checklist_Code` varchar(128) DEFAULT NULL,
  `HOTO_Checklist_Name` varchar(200) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` double DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Facility_Name` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Type_ext` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hoto_schedule`
--

DROP TABLE IF EXISTS `st_hoto_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hoto_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Checklist_Type` int NOT NULL DEFAULT '0' COMMENT '0-PM,1-HOTO',
  `plan_id` int NOT NULL,
  `Plan_Order_Number` varchar(255) DEFAULT NULL,
  `Schedule_date` datetime DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_name` varchar(255) DEFAULT NULL,
  `Asset_Category_id` int NOT NULL DEFAULT '0',
  `Asset_Category_name` varchar(255) DEFAULT NULL,
  `Asset_id` int NOT NULL DEFAULT '0',
  `Asset_name` varchar(255) DEFAULT NULL,
  `PTW_id` int NOT NULL DEFAULT '0',
  `PTW_Title` varchar(255) DEFAULT NULL,
  `PTW_by_id` int NOT NULL DEFAULT '0',
  `PTW_Status` int NOT NULL DEFAULT '0',
  `PTW_Attached_At` datetime DEFAULT NULL,
  `Start_Flag` int NOT NULL DEFAULT '0',
  `Executed_By_id` int NOT NULL DEFAULT '0',
  `Executed_Status` int NOT NULL DEFAULT '0',
  `Executed_Date` datetime DEFAULT NULL,
  `Approved_By_id` int NOT NULL DEFAULT '0',
  `Approved_Status` int NOT NULL DEFAULT '0',
  `Approved_Reccomendation` text,
  `Approved_Date` datetime DEFAULT NULL,
  `Rejected_By_id` int NOT NULL DEFAULT '0',
  `Rejected_Status` int NOT NULL DEFAULT '0',
  `Rejected_Reccomendation` text,
  `Rejected_Date` datetime DEFAULT NULL,
  `Created_date` datetime DEFAULT NULL,
  `Schedule_Created_By_Emp_Id` int NOT NULL,
  `Schedule_Updated_Date` datetime DEFAULT NULL,
  `Schedule_Updated_By_Emp_id` int NOT NULL,
  `Auditee_Emp_ID` int NOT NULL DEFAULT '0',
  `Auditor_Emp_ID` int NOT NULL DEFAULT '0',
  `Prev_Schedule_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hoto_type_checklist`
--

DROP TABLE IF EXISTS `st_hoto_type_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hoto_type_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HOTO_Type_id` int DEFAULT '0',
  `HOTO_Type_name` varchar(200) DEFAULT NULL,
  `HOTO_Type_Measure_id` int DEFAULT '0',
  `HOTO_Type_Measure_title` varchar(255) DEFAULT NULL,
  `HOTO_Type_Measure_discription` text,
  `HOTO_Type_Measure_input` int DEFAULT '0',
  `HOTO_Rquired_Status` varchar(200) DEFAULT NULL,
  `HOTO_Type_Measure_input_name` varchar(200) DEFAULT NULL,
  `HOTO_Type_Measure_add_date` datetime DEFAULT NULL,
  `HOTO_Type_Measure_add_by` int DEFAULT '0',
  `HOTO_Type_Measure_update_date` datetime DEFAULT NULL,
  `HOTO_Type_Measure_status` int DEFAULT '0',
  `HOTO_Type_Measure_update_by` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hoto_type_list`
--

DROP TABLE IF EXISTS `st_hoto_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hoto_type_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HOTO_Type_id` int DEFAULT '0',
  `HOTO_Type_Code` varchar(128) DEFAULT NULL,
  `HOTO_Type_Title` varchar(255) DEFAULT NULL,
  `HOTO_Type_Discription` text,
  `HOTO_Type_status` int DEFAULT '0',
  `HOTO_Type_add_by` int DEFAULT '0',
  `HOTO_Type_add_date` datetime DEFAULT NULL,
  `HOTO_Type_update_by` int DEFAULT '0',
  `HOTO_Type_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hse_sp_list`
--

DROP TABLE IF EXISTS `st_hse_sp_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_hse_sp_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_jc_associated_standard_actions`
--

DROP TABLE IF EXISTS `st_jc_associated_standard_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_jc_associated_standard_actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jc_id` int NOT NULL,
  `standard_action_id` int NOT NULL,
  `other_standard_action_name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_jc_files`
--

DROP TABLE IF EXISTS `st_jc_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_jc_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `JC_id` int DEFAULT '0',
  `JC_Code` varchar(128) DEFAULT NULL,
  `JC_Title` varchar(200) DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Name` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` varchar(256) DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `File_Event` int NOT NULL,
  `File_Name_Changed` varchar(256) DEFAULT NULL,
  `File_Category_Code` varchar(256) DEFAULT NULL,
  `File_Type_ext` varchar(128) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  `Current_lat` varchar(100) NOT NULL,
  `Current_long` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `JCId` (`JC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_jc_hw_repair`
--

DROP TABLE IF EXISTS `st_jc_hw_repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_jc_hw_repair` (
  `id` int NOT NULL AUTO_INCREMENT,
  `JC_id` int DEFAULT '0',
  `JC_repair_inventory_id` int DEFAULT '0',
  `JC_repair_inventory_name` varchar(255) DEFAULT NULL,
  `JC_repair_Discription` text,
  `JC_repair_normalization` text,
  `JC_repair_add_date` datetime DEFAULT NULL,
  `JC_repair_update_date` datetime DEFAULT NULL,
  `JC_repair_status` int DEFAULT '0',
  `JC_repair_inventory_plant_id` int DEFAULT '0',
  `JC_repair_added_by` int DEFAULT '0',
  `JC_repair_update_by` int DEFAULT '0',
  `JC_repair_Start_Date` datetime DEFAULT NULL,
  `JC_repair_End_Date` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_jc_ppe`
--

DROP TABLE IF EXISTS `st_jc_ppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_jc_ppe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `PPE_id` int DEFAULT '0',
  `PPE_Code` varchar(128) DEFAULT NULL,
  `PPE_Name` varchar(255) DEFAULT NULL,
  `PPE_Availabilty` int DEFAULT '0',
  `PP_Inspection` int DEFAULT '0',
  `PPE_Action_Required` text,
  `PPE_Discription` text,
  `PPE_Added_date` datetime DEFAULT NULL,
  `PPE_Added_by` int DEFAULT '0',
  `Status` int DEFAULT '0',
  `PPE_Update_by` int DEFAULT '0',
  `PPE_Update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_manpower_transfer`
--

DROP TABLE IF EXISTS `st_manpower_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_manpower_transfer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Transfer_Manpower_Code` varchar(100) DEFAULT NULL,
  `Transfer_Manpower_ID` int DEFAULT NULL,
  `Transfer_To_Site_ID` int DEFAULT NULL,
  `Is_Address_Custom` int DEFAULT NULL,
  `Transfer_To_Country` varchar(20) DEFAULT NULL,
  `Transfer_To_State` varchar(20) DEFAULT NULL,
  `Transfer_To_City` varchar(20) DEFAULT NULL,
  `Transfer_To_Address` varchar(100) DEFAULT NULL,
  `Transfer_To_Zip` varchar(20) DEFAULT NULL,
  `Manpower_New_Role_ID` int DEFAULT NULL,
  `Manpower_New_Group_Access_ID` int DEFAULT NULL,
  `Is_Mobile_Number_Same_As_Old_Number` int DEFAULT NULL,
  `Manpower_Mobile_number` varchar(20) DEFAULT NULL,
  `Transfer_Requested_By` int DEFAULT NULL,
  `Transfer_Requested_Date` datetime DEFAULT NULL,
  `Transfer_Approved_by` int DEFAULT NULL,
  `Transfer_Approved_Date` datetime DEFAULT NULL,
  `Transfer_Approve_Recommendation` varchar(100) DEFAULT NULL,
  `Transfer_Rejected_By` int DEFAULT NULL,
  `Transfer_Rejected_Date` datetime DEFAULT NULL,
  `Transfer_Reject_Recommendation` varchar(100) DEFAULT NULL,
  `Transfer_Status` int DEFAULT NULL,
  `Transfer_From_Site_ID` int DEFAULT NULL,
  `Transfer_Request_Remark` varchar(100) DEFAULT NULL,
  `Manpower_Old_Role_ID` varchar(100) DEFAULT NULL,
  `Manpower_Old_Group_Access_ID` varchar(100) DEFAULT NULL,
  `Is_New_Role_Custome` int DEFAULT NULL,
  `Is_New_Group_Access_Custome` int DEFAULT NULL,
  ` Transfer_Joining_Date` date NOT NULL,
  `Approved_Post_Data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_mms`
--

DROP TABLE IF EXISTS `st_mms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_mms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `added_by` int NOT NULL DEFAULT '0',
  `added_at` datetime NOT NULL,
  `updated_by` int NOT NULL DEFAULT '0',
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_module_threshold`
--

DROP TABLE IF EXISTS `st_module_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_module_threshold` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(999) NOT NULL,
  `threshold` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `added_by` int NOT NULL,
  `added_at` datetime NOT NULL,
  `updated_by` int NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_modulecleaning`
--

DROP TABLE IF EXISTS `st_modulecleaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_modulecleaning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MC_Code` varchar(128) NOT NULL DEFAULT '0',
  `MC_Type_id` int DEFAULT '0',
  `MC_Type_Title` varchar(255) DEFAULT NULL,
  `MC_Type_Code` varchar(128) DEFAULT NULL,
  `MC_Title` varchar(255) DEFAULT NULL,
  `MC_Disc` text,
  `MC_Facility_id` int DEFAULT '0',
  `MC_Facility_Name` varchar(255) DEFAULT NULL,
  `MC_Facility_Code` varchar(128) DEFAULT NULL,
  `MC_Block_id` int DEFAULT '0',
  `MC_Block_Name` varchar(255) DEFAULT NULL,
  `MC_Block_Code` varchar(128) DEFAULT NULL,
  `MC_Zone_id` int DEFAULT '0',
  `MC_Zone_Name` varchar(255) DEFAULT NULL,
  `MC_User_id` int DEFAULT '0',
  `MC_User_Name` varchar(255) DEFAULT NULL,
  `MC_Emp_id` int DEFAULT '0',
  `MC_Emp_name` varchar(255) DEFAULT NULL,
  `MC_date` datetime DEFAULT NULL,
  `MC_Planned_date` datetime DEFAULT NULL,
  `MC_Reschedule_status` int DEFAULT '0',
  `MC_Reschedule_date` datetime DEFAULT NULL,
  `MC_Reschedule_Prev_date` datetime DEFAULT NULL,
  `MC_PTW_id` int DEFAULT '0',
  `MC_JOB_id` int DEFAULT '0',
  `MC_issued_by_id` int DEFAULT '0',
  `MC_issued_by_Code` varchar(128) DEFAULT NULL,
  `MC_issued_by_name` varchar(200) DEFAULT NULL,
  `MC_issued_requested_to_id` int DEFAULT '0',
  `MC_issued_requested_to_Code` varchar(128) DEFAULT NULL,
  `MC_issued_requested_to_Name` varchar(200) DEFAULT NULL,
  `MC_issued_status` int DEFAULT '0',
  `MC_issued_Reccomendations` text,
  `MC_issued_date` datetime DEFAULT NULL,
  `MC_accepted_by_id` int DEFAULT '0',
  `MC_accepted_by_Code` varchar(128) DEFAULT NULL,
  `MC_accepted_status` int DEFAULT '0',
  `MC_accepted_date` datetime DEFAULT NULL,
  `MC_accepted_by_name` varchar(200) DEFAULT NULL,
  `MC_accepted_requested_to_name` varchar(200) DEFAULT NULL,
  `MC_accepted_requested_to_id` int DEFAULT '0',
  `MC_Approved_by_id` int DEFAULT '0',
  `MC_Approved_Status` int DEFAULT '0',
  `MC_Approved_date` datetime DEFAULT NULL,
  `MC_Reccomendations_by_Approver` text,
  `MC_Approved_by_name` varchar(200) DEFAULT NULL,
  `MC_Approved_by_Code` varchar(128) DEFAULT NULL,
  `MC_Approve_requested_to_name` varchar(200) DEFAULT NULL,
  `MC_Approve_requested_to_id` int DEFAULT '0',
  `MC_Approve_requested_to_Code` varchar(128) DEFAULT NULL,
  `MC_final_Signature` int DEFAULT '0',
  `Status` int DEFAULT '0',
  `MC_Completed_date` datetime DEFAULT NULL,
  `MC_Completed_Status` int DEFAULT '0',
  `MC_Completed_by_id` int DEFAULT '0',
  `MC_Completed_by_Name` varchar(200) DEFAULT NULL,
  `MC_Completed_by_Code` varchar(128) DEFAULT NULL,
  `MC_Completed_Reccomendations` varchar(300) DEFAULT NULL,
  `MC_cancel_Request_by_id` int DEFAULT '0',
  `MC_cancel_Request_status` int DEFAULT '0',
  `MC_cancel_Request_by_name` varchar(200) DEFAULT NULL,
  `MC_cancel_Request_by_Code` varchar(128) DEFAULT NULL,
  `MC_cancel_Request_date` datetime DEFAULT NULL,
  `MC_cancel_Request_approve_by_id` int DEFAULT '0',
  `MC_cancel_Request_approve_by_Name` varchar(200) DEFAULT NULL,
  `MC_cancel_Request_approve_by_Code` varchar(128) DEFAULT NULL,
  `MC_cancel_Request_approve_date` datetime DEFAULT NULL,
  `MC_cancel_Request_approve_status` int DEFAULT '0',
  `MC_cancel_Reccomendations` text,
  `MC_lat` double DEFAULT '0',
  `MC_long` double DEFAULT '0',
  `MC_ip` varchar(128) DEFAULT NULL,
  `MC_Planned_time` varchar(200) DEFAULT NULL,
  `MC_UA` text,
  `MC_accepted_Reccomendations` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_modulecleaning_asset_list`
--

DROP TABLE IF EXISTS `st_modulecleaning_asset_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_modulecleaning_asset_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MC_id` int DEFAULT '0',
  `MC_Asset_id` int DEFAULT '0',
  `MC_Asset_name` varchar(255) DEFAULT NULL,
  `MC_Asset_Code` varchar(128) DEFAULT NULL,
  `MC_Planned_date` datetime DEFAULT NULL,
  `MC_Started_date` datetime DEFAULT NULL,
  `MC_End_date` datetime DEFAULT NULL,
  `MC_Started_by_id` int DEFAULT '0',
  `MC_Started_by_code` varchar(128) DEFAULT NULL,
  `MC_Started_by_Name` varchar(255) DEFAULT NULL,
  `MC_Completed_date` datetime DEFAULT NULL,
  `MC_Completed_by_id` int DEFAULT '0',
  `MC_Completed_by_code` varchar(128) DEFAULT NULL,
  `MC_Completed_by_Name` varchar(255) DEFAULT NULL,
  `MC_Completed_Reccomendations` varchar(200) DEFAULT NULL,
  `MC_Asset_add_date` datetime DEFAULT NULL,
  `MC_Asset_update_date` datetime DEFAULT NULL,
  `MC_Asset_status` int DEFAULT '0',
  `MC_Asset_plant_id` int DEFAULT '0',
  `MC_Asset_plant_name` varchar(255) DEFAULT NULL,
  `MC_Asset_plant_Code` varchar(128) DEFAULT NULL,
  `MC_Asset_added_by` int DEFAULT '0',
  `MC_Asset_update_by` int DEFAULT '0',
  `MC_Status` int DEFAULT '0',
  `MC_Completed_Status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_modulecleaning_files`
--

DROP TABLE IF EXISTS `st_modulecleaning_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_modulecleaning_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MC_id` int DEFAULT '0',
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` varchar(255) DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Asset_name` varchar(255) DEFAULT NULL,
  `File_Category_Code` varchar(255) DEFAULT NULL,
  `File_Name_Changed` varchar(255) DEFAULT NULL,
  `File_Type_ext` varchar(255) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `File_Size_bytes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_pdm_number`
--

DROP TABLE IF EXISTS `st_pdm_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_pdm_number` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PDM_Number` varchar(255) DEFAULT NULL,
  `plan_belong_to` int NOT NULL DEFAULT '1' COMMENT '1-PDM, 2-HOTO, 3-AUDIT',
  `facility_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  `Auditee_Emp_ID` int NOT NULL DEFAULT '0',
  `Auditor_Emp_ID` int NOT NULL DEFAULT '0',
  `IsFrequencyApplied` int NOT NULL DEFAULT '0',
  `Frequency_Id` int NOT NULL DEFAULT '0',
  `Manager_Emp_ID` int NOT NULL DEFAULT '0',
  `Engineer_Emp_id` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `added_user_id` int NOT NULL DEFAULT '0',
  `added_at` datetime DEFAULT NULL,
  `updated_user_id` int NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_ppe_list`
--

DROP TABLE IF EXISTS `st_ppe_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_ppe_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PPE_Code` varchar(128) DEFAULT NULL,
  `PPE_Name` varchar(255) DEFAULT NULL,
  `PPE_Type_id` int DEFAULT '0',
  `PPE_Type_name` varchar(128) DEFAULT NULL,
  `PPE_Added_date` datetime DEFAULT NULL,
  `PPE_Added_by` int DEFAULT '0',
  `PPE_Updated_date` datetime DEFAULT NULL,
  `PPE_Updated_by` int DEFAULT '0',
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_ptw_files`
--

DROP TABLE IF EXISTS `st_ptw_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_ptw_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `PTW_Title` varchar(128) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` double DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Facility_Name` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Type_ext` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_pv_modules`
--

DROP TABLE IF EXISTS `st_pv_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_pv_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pv_name` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `added_by` int NOT NULL DEFAULT '0',
  `added_at` datetime NOT NULL,
  `updated_by` int NOT NULL DEFAULT '0',
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_rpt_inverter_data`
--

DROP TABLE IF EXISTS `st_rpt_inverter_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_rpt_inverter_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_code` varchar(25) NOT NULL,
  `facility_code` varchar(50) NOT NULL,
  `technology_id` int NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_rpt_inverter_mms_data`
--

DROP TABLE IF EXISTS `st_rpt_inverter_mms_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_rpt_inverter_mms_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_code` varchar(50) NOT NULL,
  `facility_code` varchar(50) NOT NULL,
  `technology_id` int NOT NULL,
  `vertical` int NOT NULL,
  `horizontal` int NOT NULL,
  `orientation` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_rpt_inverter_mms_technology_type`
--

DROP TABLE IF EXISTS `st_rpt_inverter_mms_technology_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_rpt_inverter_mms_technology_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Technology_Name` varchar(50) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_rpt_inverter_technology_type`
--

DROP TABLE IF EXISTS `st_rpt_inverter_technology_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_rpt_inverter_technology_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Technology_Name` varchar(50) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_rpt_module_data`
--

DROP TABLE IF EXISTS `st_rpt_module_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_rpt_module_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_code` varchar(10) NOT NULL,
  `business_id` int NOT NULL,
  `technology_id` int NOT NULL,
  `Quantity` int NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_rpt_module_technology_type`
--

DROP TABLE IF EXISTS `st_rpt_module_technology_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_rpt_module_technology_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Technology_Name` varchar(50) NOT NULL,
  `Technology_Type` varchar(50) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_special_tools`
--

DROP TABLE IF EXISTS `st_special_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_special_tools` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_id` varchar(128) DEFAULT NULL,
  `Asset_Code` varchar(128) DEFAULT NULL,
  `Asset_Name` varchar(255) DEFAULT NULL,
  `Asset_Discription` text,
  `Asset_category_id` int DEFAULT '0',
  `Asset_category_name` varchar(128) DEFAULT NULL,
  `Asset_Type_id` int DEFAULT '0',
  `Asset_Type_Name` varchar(128) DEFAULT NULL,
  `Asset_Status_id` int DEFAULT NULL,
  `Asset_Status_Name` varchar(128) DEFAULT NULL,
  `Asset_Facility_id` int DEFAULT '0',
  `Asset_Facility_Name` varchar(255) DEFAULT NULL,
  `Asset_Partof_status` int DEFAULT '0',
  `Asset_Partof_id` int DEFAULT '0',
  `Asset_Partof_code` varchar(128) DEFAULT NULL,
  `Asset_Partof_Name` varchar(255) DEFAULT NULL,
  `Asset_Customer_id` int DEFAULT '0',
  `Asset_Customer_Code` varchar(128) DEFAULT NULL,
  `Asset_Customer_Name` varchar(255) DEFAULT NULL,
  `Asset_Owner_id` int DEFAULT '0',
  `Asset_Owner_Code` varchar(128) DEFAULT NULL,
  `Asset_Owner_Name` varchar(255) DEFAULT NULL,
  `Asset_Operator_id` int DEFAULT '0',
  `Asset_Operator_Code` varchar(128) DEFAULT NULL,
  `Asset_Operator_Name` varchar(255) DEFAULT NULL,
  `Asset_Charge_department_id` int DEFAULT '0',
  `Asset_Charge_department_Name` varchar(255) DEFAULT NULL,
  `Asset_Manufacturer_id` int DEFAULT '0',
  `Asset_Manufacturer_Name` varchar(255) DEFAULT NULL,
  `Asset_Manufacturer_Code` varchar(128) DEFAULT NULL,
  `Asset_Supplier_id` int DEFAULT '0',
  `Asset_Supplier_Name` varchar(128) DEFAULT NULL,
  `Asset_Supplier_Code` varchar(128) DEFAULT NULL,
  `Asset_Model_id` int DEFAULT '0',
  `Asset_Model_Name` varchar(128) DEFAULT NULL,
  `Asset_Model_Code` varchar(128) DEFAULT NULL,
  `Asset_Serial_no` varchar(255) DEFAULT NULL,
  `Asset_BarCode` varchar(255) DEFAULT NULL,
  `Asset_UNSPC_Code` varchar(255) DEFAULT NULL,
  `Asset_BOM_id` int DEFAULT '0',
  `Asset_BOM_Name` varchar(255) DEFAULT NULL,
  `Asset_BOM_Code` varchar(128) DEFAULT NULL,
  `Asset_Purchase_id` int DEFAULT '0',
  `Asset_Purchase_Code` varchar(128) DEFAULT NULL,
  `Asset_Warrenty_id` int DEFAULT '0',
  `Asset_Warrenty_Code` varchar(128) DEFAULT NULL,
  `Asset_Added_Date` datetime DEFAULT NULL,
  `Asset_Added_by` int DEFAULT '0',
  `Asset_Updated_Date` datetime DEFAULT NULL,
  `Asset_Updated_by` int DEFAULT '0',
  `Status` int DEFAULT '0',
  `Asset_Photo_id` int DEFAULT '0',
  `Asset_cost` double DEFAULT '0',
  `Asset_Currency` varchar(128) DEFAULT NULL,
  `Asset_Stock_Count` int DEFAULT NULL,
  `Special_Tool` int DEFAULT '0',
  `Special_Tool_Emp_id` int DEFAULT '0',
  `Special_Tool_Emp_Code` varchar(128) DEFAULT NULL,
  `Special_Tool_Emp_Name` varchar(200) DEFAULT NULL,
  `Special_Tool_Facility_id` int NOT NULL,
  `Special_Tool_Facility_Name` varchar(255) NOT NULL,
  `Asset_Facility_Code` varchar(200) DEFAULT NULL,
  `First_Due_date` datetime DEFAULT NULL,
  `Frequency` varchar(200) DEFAULT NULL,
  `Description_Maintenance` varchar(200) DEFAULT NULL,
  `Asset_Employee_id` int DEFAULT NULL,
  `Asset_Employee_Code` varchar(200) DEFAULT NULL,
  `Asset_Employee_Name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_special_tools_files`
--

DROP TABLE IF EXISTS `st_special_tools_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_special_tools_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_id` int DEFAULT '0',
  `Asset_Code` varchar(128) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` varchar(255) DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Asset_name` varchar(255) DEFAULT NULL,
  `File_Category_Code` varchar(255) DEFAULT NULL,
  `File_Name_Changed` varchar(255) DEFAULT NULL,
  `File_Type_ext` varchar(255) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `File_Size_bytes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_special_tools_inverter_checklist`
--

DROP TABLE IF EXISTS `st_special_tools_inverter_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_special_tools_inverter_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_Category_id` int DEFAULT '0',
  `Asset_Category_name` varchar(128) DEFAULT NULL,
  `Asset_Code` varchar(128) DEFAULT NULL,
  `Asset_name` varchar(128) DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Facility_Name` varchar(128) DEFAULT NULL,
  `Asset_Category_Parameter_title` varchar(255) DEFAULT NULL,
  `Asset_Category_Parameter_id` int DEFAULT '0',
  `Asset_id` int DEFAULT '0',
  `Added_date` datetime DEFAULT NULL,
  `Added_by` int DEFAULT '0',
  `Update_by` int DEFAULT '0',
  `Update_date` datetime DEFAULT NULL,
  `Status` int DEFAULT '0',
  `parameter_value` varchar(200) DEFAULT '0',
  `parameter_description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_special_tools_transfer`
--

DROP TABLE IF EXISTS `st_special_tools_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_special_tools_transfer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Special_Tool_Holder_id` int DEFAULT '0',
  `Special_Tool_Equipment_id` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Emp_id` int DEFAULT '0',
  `Special_Tool_Custum_id` int DEFAULT '0',
  `Current_location_id` int DEFAULT '0',
  `Address` varchar(128) DEFAULT NULL,
  `courier_tracker_no` varchar(255) NOT NULL,
  `courier_company_id` int NOT NULL,
  `courier_company_name` varchar(255) NOT NULL,
  `Special_Tool_Requested_by` int DEFAULT '0',
  `Special_Tool_Requested_date` datetime NOT NULL,
  `Special_Tool_Approved_date` datetime NOT NULL,
  `Special_Tool_Approved_by` int DEFAULT '0',
  `Special_Tool_Rejected_date` datetime NOT NULL,
  `Special_Tool_Rejected_by` int DEFAULT '0',
  `Special_Tool_Status` int DEFAULT '0',
  `Special_Tool_Approved_name` varchar(128) DEFAULT NULL,
  `Special_Tool_Cancel_name` varchar(128) DEFAULT NULL,
  `Special_Tool_Request_name` varchar(128) DEFAULT NULL,
  `Remarks` varchar(128) DEFAULT NULL,
  `Special_Tool_Request_code` varchar(128) DEFAULT NULL,
  `Special_Tool_Approved_code` varchar(128) DEFAULT NULL,
  `Special_Tool_Cancel_code` varchar(128) DEFAULT NULL,
  `Special_Tool_Approver_Recommendations` varchar(128) DEFAULT NULL,
  `Special_Tool_Cancel_Recommendations` varchar(128) DEFAULT NULL,
  `Special_Tool_Received_By_id` int NOT NULL,
  `Special_Tool_Received_By_Name` varchar(100) NOT NULL,
  `Special_Tool_Received_By_Code` varchar(11) NOT NULL,
  `Special_Tool_Received_By_Recommendations` varchar(255) NOT NULL,
  `Special_Tool_Received_Date` datetime NOT NULL,
  `Special_Tool_Category_id` int DEFAULT '0',
  `Special_Tool_Serial_No` varchar(128) DEFAULT NULL,
  `Special_Tool_Code` varchar(128) DEFAULT NULL,
  `Special_Tool_Holder_Name` varchar(128) DEFAULT NULL,
  `Special_Tool_Facility_Name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_special_tools_warranty`
--

DROP TABLE IF EXISTS `st_special_tools_warranty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_special_tools_warranty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Asset_id` varchar(128) DEFAULT NULL,
  `Asset_Code` varchar(128) DEFAULT NULL,
  `Asset_Warranty_type_id` int DEFAULT '0',
  `Asset_Warranty_type_name` varchar(128) DEFAULT NULL,
  `Asset_Warranty_Description` varchar(255) DEFAULT NULL,
  `Asset_Warranty_term_type_id` int DEFAULT '0',
  `Asset_Warranty_term_type_Name` varchar(128) DEFAULT NULL,
  `Asset_Warranty_term_Date` datetime DEFAULT NULL,
  `Asset_Warranty_term_Meter` varchar(128) DEFAULT NULL,
  `Asset_Warranty_term_Meter_type` varchar(255) DEFAULT NULL,
  `Asset_Warranty_term_Meter_type_id` int DEFAULT '0',
  `Asset_Warranty_Meter_Reading_Units` varchar(128) DEFAULT NULL,
  `Asset_Warranty_term_Custom` varchar(255) DEFAULT NULL,
  `Asset_Warranty_Provider_id` int DEFAULT NULL,
  `Asset_Warranty_Provider_name` varchar(128) DEFAULT NULL,
  `Asset_Warranty_Cert_number` varchar(255) DEFAULT NULL,
  `Asset_Warranty_added_date` datetime DEFAULT NULL,
  `Asset_Warranty_added_by` int DEFAULT '0',
  `Asset_Warranty_update_date` datetime DEFAULT NULL,
  `Asset_Warranty_update_by` int DEFAULT '0',
  `Asset_Warranty_Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_standard_actions`
--

DROP TABLE IF EXISTS `st_standard_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_standard_actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_Type_Id` int NOT NULL DEFAULT '0',
  `standard_Action` varchar(999) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `Added_By_User_Id` int NOT NULL DEFAULT '0',
  `Added_At` datetime NOT NULL,
  `Updated_By_User_Id` int NOT NULL DEFAULT '0',
  `Updated_At` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_tbt`
--

DROP TABLE IF EXISTS `st_tbt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tbt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TBT_id` int DEFAULT '0',
  `TBT_Code` varchar(128) DEFAULT NULL,
  `TBT_Title` varchar(255) DEFAULT NULL,
  `TBT_Discription` text,
  `TBT_Job_Type_id` int DEFAULT '0',
  `TBT_Job_Type_name` varchar(255) DEFAULT NULL,
  `TBT_Job_Type_Code` varchar(128) DEFAULT NULL,
  `TBT_SOP_id` int DEFAULT '0',
  `TBT_SOP_name` varchar(255) DEFAULT NULL,
  `TBT_SOP_Code` varchar(128) DEFAULT NULL,
  `TBT_JSA_id` int DEFAULT '0',
  `TBT_JSA_Name` varchar(255) DEFAULT NULL,
  `TBT_JSA_Code` varchar(128) DEFAULT NULL,
  `TBT_HSE_id` int DEFAULT '0',
  `TBT_HSE_Name` varchar(255) DEFAULT NULL,
  `TBT_HSE_Code` varchar(128) DEFAULT NULL,
  `TBT_Procedures_availability` int DEFAULT '0',
  `TBT_Procedures_discussion` int DEFAULT '0',
  `TBT_Checklist_availability` int DEFAULT '0',
  `TBT_Checklist_discussion` int DEFAULT '0',
  `TBT_ToolBag_condition` int DEFAULT '0',
  `TBT_Added_date` datetime DEFAULT NULL,
  `TBT_Added_by` int DEFAULT '0',
  `TBT_Updated_date` datetime DEFAULT NULL,
  `TBT_Updated_by` int DEFAULT '0',
  `Status` varchar(128) DEFAULT NULL,
  `PTW_Code` varchar(128) DEFAULT NULL,
  `PTW_id` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Facility_Name` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `TBT_Risk_Assessment_name` varchar(256) DEFAULT NULL,
  `TBT_Risk_Mitigation_plan` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_tbt_emp`
--

DROP TABLE IF EXISTS `st_tbt_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tbt_emp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TBT_id` int DEFAULT '0',
  `TBT_Code` varchar(128) DEFAULT NULL,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `Emp_id` int DEFAULT '0',
  `Emp_Code` varchar(128) DEFAULT NULL,
  `Emp_name` varchar(200) DEFAULT NULL,
  `Emp_CE_CW_CU` varchar(128) DEFAULT NULL,
  `Emp_Role` varchar(128) DEFAULT NULL,
  `Emp_Responsibility` varchar(128) DEFAULT NULL,
  `Emp_Competencies` varchar(128) DEFAULT NULL,
  `Emp_Added_date` datetime DEFAULT NULL,
  `Emp_Added_by` int DEFAULT '0',
  `Emp_Updated_date` varchar(128) DEFAULT NULL,
  `Emp_Updated_by` int DEFAULT '0',
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_tbt_files`
--

DROP TABLE IF EXISTS `st_tbt_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tbt_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TBT_id` int DEFAULT '0',
  `TBT_Code` varchar(128) DEFAULT NULL,
  `TBT_Title` varchar(128) DEFAULT NULL,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `PTW_Title` varchar(200) DEFAULT NULL,
  `File_id` int DEFAULT '0',
  `File_Code` varchar(128) DEFAULT NULL,
  `File_Name` varchar(200) DEFAULT NULL,
  `File_Discription` text,
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Server_id` int DEFAULT '0',
  `File_Server_Path` varchar(255) DEFAULT NULL,
  `File_Preview_path` varchar(255) DEFAULT NULL,
  `File_Type_id` int DEFAULT '0',
  `File_Type_name` varchar(128) DEFAULT NULL,
  `File_Category_id` int DEFAULT '0',
  `File_Category_name` varchar(128) DEFAULT NULL,
  `File_Category_Code` varchar(128) DEFAULT NULL,
  `File_added_by` int DEFAULT '0',
  `File_added_date` datetime DEFAULT NULL,
  `File_updated_by` int DEFAULT '0',
  `File_updated_date` datetime DEFAULT NULL,
  `File_Size` double DEFAULT '0',
  `File_Size_Units` varchar(128) DEFAULT NULL,
  `Status` int DEFAULT '0',
  `Facility_id` int DEFAULT '0',
  `Facility_Name` varchar(200) DEFAULT NULL,
  `Facility_Code` varchar(128) DEFAULT NULL,
  `File_Name_Changed` varchar(200) DEFAULT NULL,
  `File_Type_ext` varchar(20) DEFAULT NULL,
  `File_Size_bytes` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_tbt_job_category`
--

DROP TABLE IF EXISTS `st_tbt_job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tbt_job_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `JOB_Catgeory_id` int DEFAULT '0',
  `JOB_Catgeory_Code` varchar(128) DEFAULT NULL,
  `JOB_Catgeory_Title` varchar(255) DEFAULT NULL,
  `JOB_Catgeory_Discription` text,
  `JOB_Catgeory_status` int DEFAULT '0',
  `JOB_Catgeory_add_by` int DEFAULT '0',
  `JOB_Catgeory_add_date` datetime DEFAULT NULL,
  `JOB_Catgeory_update_by` int DEFAULT '0',
  `JOB_Catgeory_update_date` datetime DEFAULT NULL,
  `Facility_id` int DEFAULT '0',
  `Facility_Code` varchar(128) DEFAULT NULL,
  `Facility_Name` varchar(255) DEFAULT NULL,
  `TBT_Type_id` int DEFAULT '0',
  `TBT_Type_Code` varchar(128) DEFAULT NULL,
  `TBT_Type_Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_tbt_old`
--

DROP TABLE IF EXISTS `st_tbt_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tbt_old` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TBT_id` int DEFAULT '0',
  `TBT_Code` varchar(128) DEFAULT NULL,
  `TBT_Title` varchar(255) DEFAULT NULL,
  `TBT_Discription` text,
  `TBT_Job_Type_id` int DEFAULT '0',
  `TBT_Job_Type_name` varchar(255) DEFAULT NULL,
  `TBT_SP_id` int DEFAULT '0',
  `TBT_SP_name` varchar(255) DEFAULT NULL,
  `TBT_HSE_id` int DEFAULT '0',
  `TBT_HSE_name` varchar(255) DEFAULT NULL,
  `TBT_Procedures_availability` int DEFAULT '0',
  `TBT_Procedures_discussion` int DEFAULT '0',
  `TBT_Checklist_availability` int DEFAULT '0',
  `TBT_Checklist_discussion` int DEFAULT '0',
  `TBT_ToolBag_condition` int DEFAULT '0',
  `TBT_filename` varchar(255) NOT NULL,
  `TBT_Added_date` datetime DEFAULT NULL,
  `TBT_Added_by` int DEFAULT '0',
  `TBT_Updated_date` datetime DEFAULT NULL,
  `TBT_Updated_by` int DEFAULT '0',
  `Status` varchar(128) DEFAULT NULL,
  `PTW_Code` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_tbt_ppe`
--

DROP TABLE IF EXISTS `st_tbt_ppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tbt_ppe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `TBT_id` int DEFAULT '0',
  `TBT_Code` varchar(128) DEFAULT NULL,
  `PPE_id` int DEFAULT '0',
  `PPE_Code` varchar(128) DEFAULT NULL,
  `PPE_Name` varchar(255) DEFAULT NULL,
  `PPE_Availabilty` int DEFAULT '0',
  `PP_Inspection` int DEFAULT '0',
  `PPE_Action_Required` text,
  `PPE_Discription` text,
  `PPE_Added_date` datetime DEFAULT NULL,
  `PPE_Added_by` int DEFAULT '0',
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_tbt_risk_assesment`
--

DROP TABLE IF EXISTS `st_tbt_risk_assesment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tbt_risk_assesment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TBT_id` int DEFAULT '0',
  `TBT_Code` varchar(128) DEFAULT NULL,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `Risk_id` int DEFAULT '0',
  `Risk_Code` varchar(128) DEFAULT NULL,
  `Risk_name` varchar(128) DEFAULT NULL,
  `Risk_discription` text,
  `Risk_Mitigation_plan` text,
  `Risk_Added_date` datetime DEFAULT NULL,
  `Risk_Added_by` int DEFAULT '0',
  `Risk_Update_date` datetime DEFAULT NULL,
  `Risk_Update_by` int DEFAULT '0',
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_tbt_risk_assesment_old`
--

DROP TABLE IF EXISTS `st_tbt_risk_assesment_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tbt_risk_assesment_old` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TBT_id` int DEFAULT '0',
  `TBT_Code` varchar(128) DEFAULT NULL,
  `PTW_id` int DEFAULT '0',
  `PTW_Code` varchar(128) DEFAULT NULL,
  `Risk_id` int DEFAULT '0',
  `Risk_Code` varchar(128) DEFAULT NULL,
  `Risk_name` varchar(128) DEFAULT NULL,
  `Risk_discription` text,
  `Risk_Mitigation_plan` text,
  `Risk_Added_date` datetime DEFAULT NULL,
  `Risk_Added_by` int DEFAULT '0',
  `Risk_Update_date` datetime DEFAULT NULL,
  `Risk_Update_by` int DEFAULT '0',
  `Status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_ticket`
--

DROP TABLE IF EXISTS `st_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_ticket` (
  `Ticket_id` int NOT NULL AUTO_INCREMENT,
  `Ticket_type` int NOT NULL COMMENT '1.Software, 2.Administration, 3.O&M',
  `Ticket_number` int NOT NULL,
  `Plant_id` int NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Requirement` varchar(999) DEFAULT NULL,
  `Create_date_and_time` datetime NOT NULL,
  `Closing_date_and_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `audit_closing_date` date NOT NULL,
  `Ticket_created_by` varchar(255) NOT NULL,
  `Ticket_created_by_id` int NOT NULL,
  `Ticket_assigned_to` varchar(255) NOT NULL,
  `Ticket_assigned_to_id` int NOT NULL,
  `ticket_assigned_by` varchar(100) DEFAULT NULL,
  `ticket_assigned_by_id` int DEFAULT NULL,
  `Assigned_date_and_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ticket_status` int NOT NULL,
  `ticket_approve_status` int NOT NULL,
  `ticket_reject_status` int NOT NULL,
  `ticket_approved_by_id` int NOT NULL DEFAULT '0',
  `ticket_approved_reccomendation` text NOT NULL,
  `ticket_approved_date` datetime NOT NULL,
  `ticket_rejected_by_id` int NOT NULL DEFAULT '0',
  `ticket_rejected_reccomendation` text NOT NULL,
  `ticket_rejected_date` datetime NOT NULL,
  `Priority` varchar(255) NOT NULL,
  `Dup_ticket_id` varchar(255) NOT NULL,
  `execution_id` int NOT NULL DEFAULT '0',
  `TimeStamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_ticket_files`
--

DROP TABLE IF EXISTS `st_ticket_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_ticket_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Ticket_id` int NOT NULL,
  `File_path` varchar(255) NOT NULL,
  `File_name` varchar(255) NOT NULL,
  `File_type` varchar(255) NOT NULL,
  `File_size` varchar(255) NOT NULL,
  `Uploaded_by` varchar(255) NOT NULL,
  `Uploaded_by_name` varchar(255) NOT NULL,
  `Uploaded_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_ticket_history`
--

DROP TABLE IF EXISTS `st_ticket_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_ticket_history` (
  `History_id` int NOT NULL AUTO_INCREMENT,
  `Ticket_id` int NOT NULL,
  `Ticket_status` int NOT NULL,
  `Comment` longtext NOT NULL,
  `Updated_by_id` varchar(255) NOT NULL,
  `Updated_by_name` varchar(255) NOT NULL,
  `TimeStamp` datetime NOT NULL,
  PRIMARY KEY (`History_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` mediumint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_region` (`country_id`),
  CONSTRAINT `country_region_final` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_of_appllication`
--

DROP TABLE IF EXISTS `status_of_appllication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_of_appllication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `softwareId` int NOT NULL,
  `statusName` varchar(45) DEFAULT NULL,
  `moduleId` int DEFAULT NULL,
  PRIMARY KEY (`id`,`softwareId`),
  UNIQUE KEY `softwareId_UNIQUE` (`softwareId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statutory`
--

DROP TABLE IF EXISTS `statutory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statutory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `Compliance_id` int DEFAULT NULL,
  `Issue_date` datetime DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `renew_from` varchar(100) DEFAULT NULL,
  `renew_from_id` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statutorycomliance`
--

DROP TABLE IF EXISTS `statutorycomliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statutorycomliance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) DEFAULT NULL,
  `isActive` int DEFAULT NULL,
  `Created_by` int DEFAULT NULL,
  `Created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatefile`
--

DROP TABLE IF EXISTS `templatefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatefile` (
  `id` int NOT NULL,
  `file_path` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uploadedfiles`
--

DROP TABLE IF EXISTS `uploadedfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uploadedfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int NOT NULL DEFAULT '0',
  `module_type` int NOT NULL DEFAULT '0',
  `module_ref_id` int NOT NULL DEFAULT '0',
  `file_category` int DEFAULT '4',
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `valid` int DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `logfile` text,
  `thumbnail` text,
  `file_size` double DEFAULT '0',
  `file_size_units` varchar(45) DEFAULT 'B',
  `file_size_bytes` int DEFAULT '0',
  `status` int DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mod_ref_id` (`module_ref_id`),
  KEY `mod_type` (`module_type`),
  KEY `ref_od_modtype` (`module_ref_id`,`module_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2290 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_responsibility`
--

DROP TABLE IF EXISTS `user_responsibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_responsibility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `responsibility` varchar(800) DEFAULT NULL,
  `since_when` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `added_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userdesignation`
--

DROP TABLE IF EXISTS `userdesignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdesignation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designationName` varchar(200) DEFAULT NULL,
  `designationDescriptions` text,
  `addedAt` datetime DEFAULT NULL,
  `addedBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userfacilities`
--

DROP TABLE IF EXISTS `userfacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userfacilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `facilityId` int DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `createdBy` int DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT '0',
  `status` int DEFAULT NULL,
  `isemployee` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2370 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `customToken` varchar(1000) DEFAULT NULL,
  `tokenIssueTime` datetime DEFAULT NULL,
  `tokenExpiryTime` datetime DEFAULT NULL,
  `tokenRefreshCount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3906 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usernotifications`
--

DROP TABLE IF EXISTS `usernotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usernotifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `notificationId` int NOT NULL,
  `canChange` int NOT NULL,
  `userPreference` int NOT NULL,
  `lastModifiedAt` datetime NOT NULL,
  `lastModifiedBy` int NOT NULL,
  `self` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1242 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `status` int DEFAULT '1',
  `addedBy` int DEFAULT NULL,
  `addedAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginId` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `secondaryEmail` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `firstName` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lastName` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `genderId` int NOT NULL DEFAULT '4',
  `gender` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mobileNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bloodGroupId` int DEFAULT NULL,
  `bloodGroup` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `photoId` int DEFAULT NULL,
  `landlineNumber` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reportToId` int NOT NULL DEFAULT '0',
  `countryId` mediumint DEFAULT '0',
  `stateId` mediumint DEFAULT '0',
  `cityId` mediumint DEFAULT '0',
  `zipcode` int DEFAULT NULL,
  `roleId` int NOT NULL DEFAULT '0',
  `isEmployee` int NOT NULL DEFAULT '0',
  `companyId` int DEFAULT '0',
  `joiningDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `createdBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` int DEFAULT '1',
  `signatureId` int NOT NULL DEFAULT '0',
  `dateofExit` datetime DEFAULT NULL,
  `designation_id` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `loginId_UNIQUE` (`loginId`),
  KEY `company` (`companyId`) /*!80000 INVISIBLE */,
  KEY `role_id` (`roleId`),
  CONSTRAINT `company` FOREIGN KEY (`companyId`) REFERENCES `business` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersaccess`
--

DROP TABLE IF EXISTS `usersaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersaccess` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `featureId` int NOT NULL,
  `add` int NOT NULL,
  `view` int NOT NULL,
  `edit` int NOT NULL,
  `delete` int NOT NULL,
  `issue` int NOT NULL,
  `approve` int NOT NULL,
  `selfView` int NOT NULL,
  `lastModifiedBy` int NOT NULL,
  `lastModifiedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25467 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warrantytype`
--

DROP TABLE IF EXISTS `warrantytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warrantytype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warrantyusageterm`
--

DROP TABLE IF EXISTS `warrantyusageterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warrantyusageterm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waste_data`
--

DROP TABLE IF EXISTS `waste_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waste_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facilityId` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `waterTypeId` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `debitQty` decimal(10,0) DEFAULT NULL,
  `creditQty` decimal(10,0) DEFAULT NULL,
  `Created_By` int DEFAULT NULL,
  `Created_At` datetime DEFAULT NULL,
  `consumeTypeId` int DEFAULT NULL,
  `isHazardous` int DEFAULT NULL,
  `isActive` int DEFAULT NULL,
  `wasteTypeId` int DEFAULT NULL,
  `Modified_By` int DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wc`
--

DROP TABLE IF EXISTS `wc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facilityId` int DEFAULT NULL,
  `equipment_cat_id` int DEFAULT NULL,
  `equipment_id` int NOT NULL,
  `equipment_sr_no` varchar(255) NOT NULL,
  `supplier_id` int NOT NULL,
  `good_order_id` varchar(100) NOT NULL,
  `affected_part` text NOT NULL,
  `order_reference_number` varchar(255) NOT NULL,
  `affected_sr_no` varchar(255) NOT NULL,
  `cost_of_replacement` int NOT NULL,
  `currencyId` int DEFAULT NULL,
  `currency` varchar(100) NOT NULL,
  `warranty_start_date` varchar(50) DEFAULT NULL,
  `warranty_end_date` date NOT NULL,
  `warranty_claim_title` varchar(255) NOT NULL,
  `warranty_description` text NOT NULL,
  `corrective_action_by_buyer` text NOT NULL,
  `request_to_supplier` text NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `issued_on` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `approved_by` int DEFAULT '0',
  `wc_fac_code` varchar(255) DEFAULT NULL,
  `failure_time` datetime DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `reject_reccomendations` varchar(45) DEFAULT NULL,
  `rejecctedBy` datetime DEFAULT NULL,
  `rejectedAt` datetime DEFAULT NULL,
  `closed_by` int DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `RejectedRemarks` varchar(45) DEFAULT NULL,
  `claim_status` int DEFAULT '0',
  `approxdailyloss` int DEFAULT NULL,
  `date_of_claim` date DEFAULT NULL,
  `severity` varchar(255) DEFAULT NULL,
  `approval_reccomendations` text,
  `close_approve_by` int DEFAULT NULL,
  `close_approve_at` datetime DEFAULT NULL,
  `close_remarks` varchar(45) DEFAULT NULL,
  `close_approve_comment` text,
  `close_rejected_by` int DEFAULT NULL,
  `close_rejected_at` datetime DEFAULT NULL,
  `close_reject_comment` text,
  `cancel_by` int DEFAULT NULL,
  `cancel_at` datetime DEFAULT NULL,
  `cancel_comment` text,
  `approver_id` int DEFAULT NULL,
  `closed_reject_at` datetime DEFAULT NULL,
  `closed_reject_by` int DEFAULT NULL,
  `closed_approve_by` int DEFAULT NULL,
  `closed_approve_at` datetime DEFAULT NULL,
  `updatedbyId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wc_affectedparts`
--

DROP TABLE IF EXISTS `wc_affectedparts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wc_affectedparts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `WC_id` int NOT NULL,
  `Equipment_No` varchar(255) NOT NULL,
  `Equipment_Name` varchar(255) NOT NULL,
  `Rated_Capacity` varchar(255) NOT NULL,
  `Model_No` varchar(255) NOT NULL,
  `Remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wc_emails`
--

DROP TABLE IF EXISTS `wc_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wc_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wc_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `rolename` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wc_product_files`
--

DROP TABLE IF EXISTS `wc_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wc_product_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `warranty_id` int NOT NULL,
  `File_path` text NOT NULL,
  `File_name` text NOT NULL,
  `File_type` text NOT NULL,
  `File_size` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `doc_id` varchar(100) NOT NULL,
  `Uploaded_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wcschedules`
--

DROP TABLE IF EXISTS `wcschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wcschedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `warranty_id` int NOT NULL,
  `supplier_action` varchar(255) NOT NULL,
  `input_value` int DEFAULT NULL,
  `is_required` int DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `why_why_analysis`
--

DROP TABLE IF EXISTS `why_why_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `why_why_analysis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `incidents_id` int DEFAULT NULL,
  `why` varchar(255) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worktypeassociatedtools`
--

DROP TABLE IF EXISTS `worktypeassociatedtools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worktypeassociatedtools` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workTypeId` int NOT NULL DEFAULT '0',
  `ToolId` varchar(100) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `createdBy` int NOT NULL DEFAULT '0',
  `updatedAt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worktypemasterassets`
--

DROP TABLE IF EXISTS `worktypemasterassets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worktypemasterassets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetName` varchar(99) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `createdBy` int NOT NULL DEFAULT '0',
  `updatedAt` datetime DEFAULT '0000-00-00 00:00:00',
  `updatedBy` int NOT NULL DEFAULT '0',
  `workTypeId` int DEFAULT NULL,
  `equipmentCategoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-14 17:56:44
