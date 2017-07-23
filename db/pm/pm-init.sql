/*
SQLyog ä¼ä¸šç‰ˆ - MySQL GUI v7.14 
MySQL - 5.7.19-log : Database - pm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`pm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `pm`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('3d6b7909d8cd4e5eb0e700178443ee43',1,'test_audit.bpmn20.xml','06a1cda066cb4ec18d545bf849a3cfd8','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"å¯åŠ¨å®¡æ‰¹\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"ç»“æŸå®¡æ‰¹\"/>\r\n    <userTask id=\"modify\" name=\"å‘˜å·¥è–ªé…¬æ¡£çº§ä¿®æ”¹\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"è–ªé…¬ä¸»ç®¡åˆå®¡\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨éƒ¨é•¿å®¡æ ¸\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨åˆ†ç®¡é¢†å¯¼å®¡æ ¸\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"é›†å›¢æ€»ç»ç†å®¡æ‰¹\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"è–ªé…¬æ¡£çº§å…‘çŽ°\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"æ˜¯\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"æ˜¯\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"å¦\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"æ˜¯\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"æ˜¯\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"å¦\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"å¦\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"å¦\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"é”€æ¯\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('644a7ab245a54272baf2d6ec9035cad9',1,'test_audit.png','06a1cda066cb4ec18d545bf849a3cfd8','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ü\0\0|\0\0\0=Ó³Ú\0\0SâIDATxÚíÝ|TõÿÿS Š·¿h©Ë²ülêeÕ®Z1†‹4–X â­K]Š¬RVV©\"ÔZ/À\"\Z1…c\nÄ€‘†šD.IácŒ1f¥˜EÄÒcã÷>ß9ç03™I2I˜ÌL^ÏÇãóÈ\\Î\\2çû>s>sÎœ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€î§/\0\0\0\0\0+Á,eý\0\0\0\0\0 Þ¬/ÌJ²þŽá%\0\0\0\0 sšm»É–-ÜŸÑt\0\0\0\0ÐyÍvk—\0\0\0\0€V$´ÒTÛ×ón\0\0\0\0\0‚l¶[k¦ÙÒ\r\0\0\0\0@ÅÁm¹vz\0\0\0\0\0ºm³=¦·«£é\0\0\0\0 óšíÎº=\0\0\0\0\0Q§µ¤…ú~\0\0\0\0\0ˆšf»³vgK7\0\0\0\0 Ûó=àÙ÷ÌºÓúßÛq 5\0\0\0\0@·o¶Çx4ÍËÌRÖß¶6ÝnGÓ\r\0\0\0\0èöÍ¶¸ÓjšUM·g³m×DëùN7\0\0\0\0 ÛÔûkž[jºýMŸêgz¾Ó\r\0\0\0\0è6ÍvBM´¿¦»­Í¶oÓÍîå\0\0\0\0€¨ÓÖ¦·µ¦;ØfÛóñ?3ØÒ\r\0\0\0\0ˆÂf»­Ín ¦»G;›mßé\0\0\0\0tÛf»¥¦»ªÍvGŸ\0\0\0\0\0a££[”ý5Ýi¶}›n¾Ó\r\0\0\0\0],Î¬ÇÍÊ6k§Õ¬)ªM•ÔÁ×^v#÷Ý²]e]ÞIÌŠ¢(Š¢(*ÊªÎ¬j³rÍzÆpohêE;‡pÔ×\Z¤ŸšUdÖ³Æ™u±Y}xyÚ¤µ£’·¦¥-Ümùî@ØÂ\r\0\0€h$}Ê Ã½‡©ô2[Í:h¸76õãåA¸˜l5Ú‹Íº€—£C¤¹­3NÌw¸ÛÓtón\0\0\0t\'ÌJ¶Ögòr +Éîo˜•o¸·d£óšî`¶(úé/G)¦éæ(å\0\0\0è®dËw¹áþšìé¼è\nÒlg|ÏáD6Ý­5»­ýÎvk¿ÓÈƒßá\0\0@÷ÖÇêw²éyj²y>ï„jmskÍ¶ÑÎ¦ÛÞ­}³\0\0\0\04ÝzK÷#¼9@š|g›ÝÈO¼@[ºÛÚlÛtÛG³\r\0\0\0¸Éîå²÷\'RCHÈü’yB&Áh¾{÷Fð¿³í¯éžèó8|g\0\0\0hNúŸ$^„‚lÝæhä¡oº=¤æÙ<·¥Ù6Z¹?ý\0\0\0&G/—Ÿã+µ8¡â÷ïl#ô|w/—fy¢üO}ùÞ®£¿ÿ\r\0\0\0t[YgÆ‰ö”YsxÂ¦éî(»«\0\0\0hNú gxp\"É!ñ9 Vt4ÝÝ¼\0\0\0ÑLÖ›syp\"í48:y8èènàìF\0\0\0GŽV^ÍË€Iš´>¼aÕt»…š¤\0\0\0Á“>¨Ž—\'’â%+ÁîÎnä\0\0\0\0ý`èä&zˆáþDŽïà\0\0\0ôC`€¡¬f:¡…ë?£Ù\0\0\0è‡À\0Cðméf7r\0\0\0€~0trÓM³\r\0\0\0Ð†Nnº“h¶\0\0\0ú!0ÀÐ¹¦YóŠŸþ\0\0\0è‡À\0C\'Ê²æU/^\n\0\0\0€~0tŽ8³\\[¸\0\0\0ú!0ÀÐ©2­ù$µ“—\0\0\0 7Ä8¾uÛ.š\0\0\0Ð†Êòi¶í­Ü|—\0\0\0 íäoë¶]ãxy\0\0\0\0ú!0ÀÐ>Ùšm©\"^\0\0\0€~0¯¥­Û|—\0\0\0 í”ÕJ³ÍË\0\0\0ú!0ÀÀ¼\0\0\0XÇÌ+\0\0\0€ul€Æ¼\0\0\0À:6``^\0\0\0¬cƒæ\0\0\0À:6À\0c^\0\0\0`00¯\0\0\0\0Ö±Á\0ó\n\0\0\0``€1¯\0\0\0\0°Ž\r˜W\0\0\0\0ëØ`€y\0\0\0°Ž\r0À˜W\0\0\0\0XÇÌ+\0\0\0€ul0ÀÀ¼\0\0\0XÇ`Ì+\0\0\0\0¬cƒæ\0\0\0À:6``^\0\0\0¬c0æ\0\0\0\0Ö±Á\0ó\n\0\0\0`00¯\0\0\0\0Ö±ó\n\0\0\0\0ëØ`€y\0\0\0°Ž\r˜W\0\0\0\0ëØ\0Œy\0\0\0°Ž\r0À˜W¼\0\0\0\0ëØ`€y\0\0\0°Ž\r˜W\0\0\0\0ëØ\0Œy\0\0\0€ul0ÀÀ¼\0\0\0XÇÌ+\0\0\0€ul€Æ¼\0\0\0À:6``^\0\0\0¬cƒæ\0\0\0À:6À\0c^\0\0\0`00¯\0\0\0\0Ö±Á\0ó\n\0\0\0``€1¯\0\0\0\0°Ž\r˜W\0\0\0\0ëØ`€y\0\0\0°Ž\r0À˜W\0\0\0\0XÇ,¤ÿ°R½SRRfNœ8qolllCïÞ½•õ:PP={öüîüóÏÿløðáÍ¿#‰\0\0\0è‡À\0ë–-[vÏÈ‘#ëcbbÔœ9³U~~žjhøÊìÁ¿£:©äõ,**T‰‰Ï©6öïß¯ùÒ_LÔ\0\0\0@?X”JM}e}¿~ýTRÒÊåj4›Ã&*•œ¼HõéÓç«SO=õ&â\0\0\0ú!0À¢°Ù¾à‚TQÑv³	ü–\nq•——©¾}ûþÃœcˆ\0\0\0è‡À\0‹Ë–-½G¶lm3›?—W-]ú’\Z3&A\Zu½ºþúkÔ\rñ#Uò¢¤fÓQ¯òò½ê”SNùÂ`÷r\0\0\0ÐÿœR½GŽ¼¦>)éyóä7^µbùR5úç£Ô­·ŒÕ5vÌ*>þZ5tèj‘nº¿¡:¹çÞ«W¯<b\0\0\0ú!0À\"\\JÊÂ™11?R.W½Ùð5zUÂ¨xÝhßpÃH§~ö³ëÔðaWšMwl³é©Î©³Ï>ûSsÖÄ=\0\0\0ÐÁ&Nœ°wÎœ\'ÍFïëf5bxœzaÁ|•õV†Jy1IoÙ¾jÄP}¹œv¹¾ô{;ªc5mÚ½;ÍY“Hô\0\0\0@?X‹ÒŸŸc6z\rÍêî»\'ªƒýTmÝòŽÊþÓµêÕTµ>sú¸úCõ?S\'«o¿ýÒïí¨ŽÕ»ïæ0gÍN¢\0\0\0ú!0À\"XïÞ½UCÃçf£Wß¬›õ*.Ú¢voU»w•è’Ó;vlW=ößÛP/™æ¬q=\0\0\0ÐáÿŸR_6+—ëïjÖ¬™jÊo&©’’BUþÞ]»víPÓîûo5ãÁûÔ×_î÷¶TÇ‹\0\0\0è‡À\0‹Š†»Î«\Z?WëÖ½¦bcªª?ªTN¿Ï«JK‹ÕË/U¯¯NU\r\rŸ5»=ÕñbÁ\0\0\0ú!0À¢¢áþ‡Sß}wL½µ!]\r\Z«jª«Ô{e»Uîæ*óÍ?ª´×WªÔW^2›ñ4½{ù•W^®ÒÓW¨o¿ýÂë>¨Ž6\0\0\0Ð\r÷1§¶nÙ¤k[šì¼¼ÍêÍŒtÝh¯X¾D½¼x‘JzáYõÌ¼§õÔ¿´P]{Íµñí5^÷Au¼X°\0\0€~°¨h¸ÿîÔc³~§D.õ²ÔÅº–¼œ¬’-PÏ\'ÎSÿ;÷IõÄïQ3güV=ùÄ£f³©~7ó~¯û :^,Ø\0\0\0@?XT4Ü_8%\r·üØí·Ý¬ÞH{U7ÚÒ|?;Žš;ç	õÜ³suÓ-Mø˜Ñ	jsÎÛVÃýÕ‰Å‚\r\0\0\0ôC`€EEÃ}Ô©½{·©G™¡~yû8ÝPË®äþ*.nˆúõ„ñzkwié»^÷Au¼X°\0\0€~°¨h¸?÷*×7S_~ù©J|îi•0ê:5bø•jèÐ+TÜ•CÔP³Ñ¾æêáêûïQÇŽýEOë{{ªãÅ‚\r\0\0\0ôC`€EEÃ}„\n³bÁ\0\0\0ú!0À¢¢áþŒ\n³bÁ\0\0\0ú!0À¢¢á>L…Y±`\0\0\0ý`QÑpÿ\n³bÁ\0\0\0ú!0À¢¢á>D…Y±`\0\0\0ý`QÑp¤Â¬X°\0\0€~°¨h¸PaVmwO˜Õ@<\0\0@?XX7Ü¥Â¬ZwÒhm]ÏÂ\0\0\0ôC`€…wÃ]ë·äº…g«ÄÄÇuíÛW¬/+)Ùð6Á–Ü_ffªs:\'çu}ººz[ÀÛ”—¿£öìÉñz¾ÏKÎÏš5­ÙcÍŸ?KŸ>th×uUU[ôõGŽ”7{¼ÚÚÒf—UVèékj\nõù\r–«3Î8½Ýÿ»¿ëZi´i¸\0\0@?Xø7ÜŸú­ã\r¡÷eYY+¼.»ùæ5yò¯Ì†¼H—œ¾÷Þ;ór›¹sr¦ïÙ³§JNžã\\çnæÝ§ËËÿl6Îo«3Ï<CO[]½U?žÝ`nÜøª\Z?þjÂ„[ôi¹¬¶v§þ+Óz>Ï•+_pNïß¿Cÿ­¬ÌWkõiyLÏégÏž©Ž}_ÿÏr~Ê”ÿtÃ¾/Ïéü·^ç/¿ü\'zúÑ£¯×ÏÏ¾îÆGªéÓ£ïÜsÿEÍ˜1ÅlðßÕ·©¨ÈøÚ[ógžáÞu\\(\0\0\0€~°ðm¸÷û-»©LL|L—ÝoÙ².àm¤.¼ðÇ*6öÒ§±ï_šÏÃ‡÷èó”ê¿yyéúºúú*}^[ÎŸrJoÝ|o6Ãw˜ÍíJ}ù±cX[¸³Ô¡C»Ë—,™¯ŸKFÆµ`Áïõeuu•úoAÁ\ZçyH.—55íÓ«ªÜ[¯åù¬Y³XmØ°ÌëyÛÓeg¯R¥¥Unnš~Îr^þû±ýýÏò?ÈëwÎ9?PÃ†]®Ÿ«ý|÷ï/özmÿ[´i¸\0\0@?Xä4ÜiVee›Ôž=Ùª±ñc¯ª­Ý¡D·±ëxÃíÿú‚‚?ªk¯S99¯©””9ê´ÓN5›æ\nuòÉ\'©;î¸Élbß6›ÚOœéíæR¦­«û@¥§¿¨<O-\\ø”¾\\¦w7ÓxÝF¦—Ó.W*/ß¬/KM}N?VEÅŸõu‡íÒ—§¥-Rƒ_ ›yûööýÊë §íû^µ*ÉÚú¿TÝ|ó(çqìç“›ûzÀÿ]¶ÜËõ2¼ÆöcÉ}yN×†F›¢(Š¢(wÕ™µÇ¬l³ž1+Þ¬^¬ÂôC`€…IÃ½¯Y-Y2O]tÑ¿ª-[Ö¨Õ«ÿ ®»n˜š=ûA}^nSXø¦ßÛI¹îK^/eè-Éî-Ëóæ=¤ŽÙcí^¬¯—óžÓ&%=¡øg³©®PÉÉOëË¦N`}Wû^½›º=}ccµó&\\]] ²²–©Wx•\\·mÛ:=}vö«ª¦f‹×ãz+øõmûö=[o–Ë-SkÖ¤è†úô»U|ü}ÙO~2H}¾oy.òá\\nß—L\'×ÅÄP—\\2ØlºW{=–\\çûúXóç³¾5Âsw³™5Æ¬ÇÍÊ5ë YIfõcÑ#i¶’#€÷#€~°¨j¸?iVrù]wýRŸNK[¨·B{^—™¹Äïí¤.¼0Æj¸›_W_ÿõ]çåú~d‹¶œ.+Ëvî÷¬³ÎÔ»\\ïß_è<ž4©éºÙ–¦UšÛU«^°¾‹½Íù+Ó§¦Î·¶Lo´\Zëµ~ÿ?û8zt¯õ}êÍú|mm‘óÜìiW¯NÒ§Þå\\&Íø7^«O.[¸ðIÝh74|¨ÿOÏÇÊÈXìœ—\rššjœýÝõœfÏÏg>½\Z ñ7¬¦AVtîañ´;GÉf}aÖL^€÷#€~°ˆn¸ÿ¯Y¹îÛÓÓ§ßåu]fæË~o\'u¼áö}qñ›úöv#+»rWW»·v»\\ÕÍî_Î/^,»“¿¯(Véé‹Ì¦ýbUSãnV*±¾Ã½Þld?V))³­¤åêÛoØ°T7õ“&Ý¦Ënöåú††J§y•é\n×©‹.ºP7éî&<Çjæ·6{}ÆŽ½^Ýzk‚Ù,oÒÿó‘#»Tvö\nëhë¯zMën¸½_‡ÄÄGõYY©~_ÿ\0óËw‹w¸’-\r²…a­Y§³Ú£rÃ½›,9x?è‡À\0‹Ì†»¦Yú\'ÁžPõõï[JK7›Ð5fC[m6¬ËüÞÆ®ã\r·ÿëkkÕòåÏZ?ÓõÙlç©óÎûjîÜÇv7ÜÇŸKrò“º¡Ý·o‹n¸å²ÆÆ­­ÄyÖ.àif½ÙlÚ?²šù>ÏÇ8v¬Ìy^rÿ†>`Z‘ÙHg[ßÚïí¥á¶ÿOy\\ù~öwüBßV®_°`–3­\\ôènuÙeÿ¦fÏž®/—×ÔÐßù^å÷þ[™oöïp&ßŸË²Vr\0´O+GÙßIx?è‡À\0‹Ä†ûc¿uäH©õ³]èó›œ­Á\r\rú²Ã‡KÔM7Åëš2e¼Ù<¾ª·Úž{n}Z*--É:Ùz}CWz»Õ,¿£ZC%ü#çúÌÌÅÎóóÃ†ýÔlôSUFFŠJM}F?†}Ü‡¡wñ^êu›òò?©ÂÂµº	–š4éV]r?î&8Çl‚ÝMë×ï‡ª¬Ì}´¼¼ÕÎó[¼x¶µõ{‰×kcè°=c6ý•ú¹Ý{ïuèP±š7o¦úþ÷{éûòœVjÕªçÿQCS^û1}ï?ŠVrdË»ókºeK÷#¼\0ïG\0ý`×pW{UNÎ\nÝ¼öïŽÙtïlv½ÜfÚ´‰Îù††÷›M¨\Z?ÐÓËýËý>¼Ãj8_óºwó|ü|II†>ír}há;KŸojªr¦)(xÝë6<ª§÷÷<äúââuúô¾}ú¯|w¼¦&OßÏàÁç;ÓÊc¹?0Èôºý…úºmÛÒÕèÑ×ª[oå÷ñä¹Û—WTd««¯¾B7ò¾÷¿zõ¯û¢1&»ó}jpà\Z £9úŒ¼ôC`€E\\ÃýQDUSÓ‡2M¨žK{¦Âq\'®IbqtH29x?è‡À\0‹¸†»Š\n³ŠÂq\'G‹•#ÅòT€ä ºSÃý!f¥ãN¾;—À\"è­äàý ,¢\ZîJ*Ì*JÇÝã†{W>\0í7‡¼ôC`€ETÃýf¥ãnŒáþi#\0ËQ./Àû@?XÄ4ÜT˜U”Ž;9:ì)@‡sTÍË\0ð~Ð1\r÷ûT˜U”Ž;ù-á:)\09È@?t£†»œ\n³ŠâqÇ G\09ÈÐ\Zî÷¨0+\Zn\0ä G\0y,*\Zî2*ÌŠ†\09È@^À\0‹Š†{/fEÃ\r€ä /`€EEÃ½‡\n³¢á@Ž\0r0À¢¢áÞM…YÑp G\09È`îä“Oú®¡¡ÈlòvQaR_}U¸Ïœ5.ò€ä /`€E°Áƒ|(?‰Ùè•RaRë×?ÿ¶9kv’\'\0ä G\0y,‚]uÕeëæÌ™J£F5vìUiæ¬I$O\0È@Ž\0òX0à±œóËµƒf7<ê“=zT˜³&Ž< G\09È`®ÿ–&%=H³5fÌUKÍY’Kž\0#€ä°è0èÌ3O«/*ZAÓÛ…•Ÿ¿t½9/šu1y@Ž\0r0À¢Gü9çœýwšî®k¶{ôèQcÎ‡1ä	\09È@^À\0‹Â¦û¤“¾lÞ¼û>ç;Ý¡ûÎ¶µùÁnÐl³ÀÈ@Ž\0òtë6¨gÏïåœ~ú©‡§L¹e÷¦M/lh(¤1îÄúê«íûä§¿ähäÖÒä;Û“\'\0ä G\0y¬{¸Ô¬9fm5«Áz¨Î)—áþmùé¯8ò€ä /`€!œeYóª/yÈ\0r0ÀÐ9d+±ËšW	¼ä	 G\0È@^À\0CçÈ4Žï®½“—ƒ<ä\09È`è¸!Æñ­Ûváe!O\09@Ž\0ò:&Ëh~P2ÙÊÍw¹É@Ž\0#€¼€†vò·uÛ®q¼<ä	 G\0È@^À\0Cûdz«ˆ—‡<ä\09È`^K[·ù.7yÈ\0r0ÀÐNY­4Û±œ<ä\09È``^1\0#€ä00¯À<È@Ž\0ò0À˜W`ä\09È``^1\0#€ä00¯À<È@Ž\0ò0À˜W`ä\09È``^1\0#€ä00¯À<È@Ž\0ò0À˜W`ä G\0È``^1\0#€ä00¯À<È@Ž\0ò0À˜W`ä G\0È``^1\0#€ä00¯À<È@Ž\0ò0À˜W`ä G\0È``^1\0r€ä00¯À<È@Ž\0ò0À˜W`ä G\0ÈNˆ,k@µT;y™X€y#€äÎ³\\­4Ücx™X€y#€ä^vÍv‘Y½x‰X€y#€äÞ\Zîq¼<,À<È@Ž\0ò´Ÿ¿ïrËw·ÙºÍÂ\0Ì#€ä /@øû.7ßÝfa\0æ@Ž\0r d\ZlÝfa\0æ@Ž\0r ÓÅy4Ü	¼,À<È@Ž\0òtû»ÜlÝfa\0æ@Ž\0r \ra€±0\0ó G\09È\"gŽ)Õ;%%eæÄ‰÷ÆÆÆ6ôîÝ;ÐÏpQ-TÏž=¿;ÿüó?>|øFóïHFæ@Ž\0#€¼tcË–-»gäÈ‘õ111jÎœÙ*??O54|eöàßQA–¼nEE…*1ñ95pàÀÆþýûï5_â‹Y€y#\0ä /ÝLjê+ëûõë§’’^P.W£Ù46QXÉÉ‹TŸ>}¾:õÔSoba\0æ@Ž\0#€¼t£fû‚.PEEÛÍæð[êUyy™êÛ·ï?Œîù»á,˜G\09@Ž\0òÒ½,[¶ôÙ²]T´Íl\n]^µtéKjÌ˜5jÔõêúë¯Q7ÄTÉ‹’šMGµ½ÊË÷ªSN9å£ûí^ÎÂ€y#\0ä /Ýhî(Õ{äÈkê“’ž7O~ãU+–/U£>JÝzËX]cÇÜ¨âã¯UC‡^¡é¦ûª•˜8ÿó^½zå±0\0ó G\0È@^¢TJÊÂ™11?R.W½Ù6zUÂ¨xÝhßpÃH§~ö³ëÔðaWšMwl³é©àêì³ÏþÔœq,À<È\0r—(4qâ„½sæ<i6€_7«ÃãÔæ«¬·2TÊ‹IzËöU#†êËå´Ëõ¥ßÛQm«iÓîÝiÎ‚D`ä\09ÈKŠÒŸŸc6€\rÍêî»\'ªƒýTmÝòŽÊþÓµêÕTµ>sú¸úCõ?S\'«o¿ýÒïí¨¶Õ»ïæ0gÁN`ä\09ÈKêÝ»·jhøÜl\0ë›Õc³RÅE[ÔŽâ­j÷®]rzÇŽíê±Çò{ªí%¯»9\\Ýd¨%XƒRÇ G\0È@^ºÍRêËfårý]Íš5SMùÍ$URR¨ÊßÛ£k×®jÚ}ÿ­f<xŸúúëÏýÞ–j{u“€Ä›%GeO²þŽ!v,°r€ä¥›4Üu^ÕØø¹Z·î5ûSUýQ¥zpú}^UZZ¬†\\~©z}uªjhø¬Ùí©¶W7H¼O“-[¸?£éf\r#\0ä /Ý¤áþ‡Sß}wL½µ!]\r\Z«jª«Ô{e»Uîæ*óÍ?ª´×WªÔW^2›ñ4½{ù•W^®ÒÓW¨o¿ýÂë>¨¶W”Ä·Ùnír°ÀÈ\0r—hk¸9µuË&ý[ÛÒdçåmVof¤ëF{Åò%êåÅ‹TÒÏªgæ=­ ¶ø¥…êÚkF¨o¯ñºªíÅIh¥©¶¯ç;Ý,°r€Qš—fÝgÖZ³ªÍª³žpƒYŸ˜•iÖLkº(n¸ÿîÔc³~§D.õ²ÔÅº–¼œ¬’-PÏ\'ÎSÿ;÷IõÄïQ3güV=ùÄ£f³©~7ó~¯û Ú^Qú†ÒÖfš-Ý,°r€Q˜—qfåZMö+fÝfÖ ³N·®—¿1V#dM—oÖ„èl¸¿pJ\Znù	°Ûo»Y½‘öªn´¥ù~vþ5wÎê¹gçê¦[šð1£Ôæœ·­†ûª…o(ñFp[®ƒ¬à\0ä G\0Â4/ÒDg›Un5Ó½‚¸­4ò›É[Íº º\Zî£NíÝ»M=úÈõËÛÇé†Zv%÷WqqCÔ¯\'Œ×[»KKßõºªíeo(íÝb-·«£éf\r#\0äˆÜ¼Œ7ë áÞE¼Wîç>ë~¢ek·Ùø}îU®oþ¦¾üòS•øÜÓ*aÔujÄð+ÕÐ¡W¨¸+‡¨¡f£}ÍÕÃÕ÷ß£Žû‹žÖ÷öTÛ+ŠÞP:º{8»—³ÀÈ\0rDh^d%^¾“×I÷w©u“££á>BuQEÉJkHõý€€ä /!2ÞjŽc:ù~c¬ûô-Ýfã÷ÕEo(}´q¶t³‚#\0äˆ¼HS,»Ç û¿ÔºÿA‘Ýp¦º¨\"ü\rÅ÷€gß3ëNëo0|oÇÔXÁÈ@Ž\0D@^äHä3OðcÈwº·FvÃý7ª‹*‚ßP|·DK³¼Ìú–ÑtºM7+8\09È€0Î‹üô—¼wk¹»–›ß!ª‹*BßPüíö}§õ¿¨ šnÏfÛ®‰×ónVp\0r#\0aš—Ü®¨K©[¹ÍÆï ÕEo(š`ÍsKM·¿éSýLÏwºYÁÈ@Ž\0„Y^îšõ\nácV`¶Ž~à0¢m\r÷ª‹ª‹ÒÖ±¨ÙN¢‰ö×t·µÙömºÙ½œ€ä@äE¾W½8Ä™hœøï‹ûÂ+«¹Šk¹áþk‡Jî#3s™s:\'\'MŸ®®Þð6ååï¨={6«’’^÷ãyÞ®}ûv¨“O>©MÏcüø›š]¶fÍ¿Ógg¯VgžyF»ÿç””yòÚ…ñØhOÓÛZÓl³íùøŸléf G\09ÐåyYkÖm!~Li²Â°á¶+Ûð¿UÓlüjƒ®ž={ªää9f3\\¬ï?1ñqç´4ÓÒ8»›ÙZ³ñÞ¦²²V:ÏeãÆUº1ž0á}Z.«­-ÕeZ\'×rJï€ÏçÐ¡=zšþYßgÿþÿ¤ÒÒ^4›âÿU]ô¯Îã;VÙì~+*òTMM¡žæÖ[®&Oþ•3}qq–ž®°pƒ¾lÒ¤_ê¿ò8qq?Õ§¥6lX®Î;ïÜ _Ç.n¸[¾Ív[›Ý@Mwv6Û6¾ÓÍ\n@Ž\0r ò\"»w_âÇŒ1ëÓ0n¸=·jŽðn¸?mwÉígÌ˜¢Þ«Ï8°KÿÍËû£¾®¾þ#}^\Zr»iÎÊZ¡ÆŽ½AM™òŸf³úªÓz÷Ûzúòò?ëæWJ¦‘æ¹_¿êÇ²o3qâmzZ—ëÝðÊii´×«k¯ªæÍ{ØyŽÒxÛÏùÈ‘÷Ô°aCôýØÏË~Þ†ÞZŸêœÎÈXêœ^³f±s²Å]nkŸÿþ÷{©Çÿm»^¿0íi¶[jº«:Ðlwôù€€ä /¤Î¬ÓCü˜òx\rÐp{nÕŒs7Üûƒ®‚‚5º©ÍÉYm6³sÕi§j6ÍèFôŽ;Æ©ÒÒª©iŸ3½ý¸2m]]¥JOOQž¯.|Z_.ÓË_¹Îßã]xáUlì¥Ÿ<îèÑ×©I“n7é•jñâyz´4èöerÿiiÉÎmäùÉe••ùª¬,ÇlÜÿOŸÏÎ^å<gyžrº¡¡Z•—çšÍz™.¹nåÊôéššmºÑoÏëf\r·ïØèèeMwGšmß¦›ït³‚#€ä¥…TEb)õ—v•Ü¶ª*_ÿ7ï!³ùÜkí¾C_/ç=§MJzBïŠ]W÷JNž­/›:õ×úï¬Y÷éÝÔ=Öñ†»ùuöãîß_¤ÿŽï4ÙYYËõ‡ûöªŠŠ?{Ýî‰\'î×[Üo¿}´Ú²e­ª®~WßþÐ¡]ÎsÎÈXâõ?¤¥-R[[Â—êÓÙÙ¯êÇhïkæ•ÔÁLÈnä¾[¶«¬Ë;\"Éº¯>,cYÁÈ@Ž\0òZláÜ@í4Ü[,í#¸›ß¾ ª¾¾R]~ùOÌ†v…¾Ï;î¸IŸ.+Ûä4¢gu¦:çœè&Xn#—_rÉ`UPðG³Ù~ZÅÄÐ[¤W­zA_·oßvç¯ý8Û¶­S“\'W¹¹«õîäRò8Ë—\'êi]®›=7ûñíóÕú2¹ßé**r×åèÑ2³¡¿DÅÇðš&#ãe¯ó#F\\áüßòÜä´lÝ¾ùæQA¿Žö}†ñØhí¨ä­iiw[~§;¶p³‚#€èÂ¼ðîÖ›)ãxÃýIÐU\\œi6¶Kô}¯^¤¾@UW8°»ñ]âL/ç/–ÝÉ+Ô;Tzz²nÚkjì­Ê;­ïpopnÓØø‘súÂctCÜÚó’ûé&MºÍl†—«¬¬eêŒ3Nóšfß¾mú¾¥}TõU*//Íjø·9mèÝËWzÝ·ý?úàoËõiiæÝˆþu“†;ÐØ°›Û:ãÄ|‡»=M7ßáf G\09ÐÅyá(åÇ›š\"³Æ“Ülüþ/èª­-TË—?§cþü‡Ìf;_¥{îÜúzwsú²3½œON~J9²Ëlj·š\r÷\"}Ycc•utr÷®éoø}¼ã\rwËÏKîãá‡ïÑa—»q^ÑlZû±kj\nÔáÃ¥ÎóëªªÞq®ó¼ïøøáºÑ6ôîÿÐ§ûö=KÍ˜1¹]¯c7Ü­\rß&·­[”ýô—¿£”Óts”rVp\0r#\0a~‡»å­–>\rwMÐeèïjZMjžJIqü¬©©Ú¹ÞÝpŸ~Ø0ù­e*#ã%•šúŒÞåÜ¾NîCþfe½â÷ñŽ7Üîó.×GÖ®à»›=/ÏÇµ/ów¿õõï[[µ·Xßß¦Ÿ‡\\.»¼Ëóméÿ—ÿ¥=¯ïý„ñØð×t·Öì¶ö;Û­ýNw C~‡›€ä@Xäe€YŸÙPt”ìÆ‰3H©ƒªÆÆJÕÐPa6±KuÃtøp‰þ›—·Ú™ÆÝä.õ:_Rò¦>ír¹·,—•½­Ï75}äLSPf6¼åêæ›¦æÎ}P%&>b6Äïª©SÿSM›6QŸ–*,\\«N;íuìØ^¯çf8»”ßªkãÆT«¡§ÙÿQW÷žuà¶ÿÔÏÉ~.òa€ïÿã[†Þj¾<è×ÎßýDÐXimskÍ¶ÑÎ¦ÛÞ­}ËSVp\0r#\0á‘—\\#t[Ã¤!Ø\Z©3H©êWSSUDÝï‰zœ|C	´¥»­Ív°M·ýx4Û¬à\0ä G\0Â(/²‚^n„f+·ì¢;!rî¨.ª}C‘-Ý¾»wßiÿ;Ûþšî‰>Ãw¶YÁÈ@Ž\0„i^òÿ½jù¾øV#´»¯wrÃ]EuQEðŠïO†y6Ïmi¶VnÇO±‚#€ó¼Ä˜uÐ¬¸tÿ—Z÷?(’gRR]Tþ†â»{¹4ËàêË÷výýo°‚#€ä%DÆî¨Åœ€f^îwB¤Ï ¥*©.ª(xCéìßÅö·»:XÁÈ@Ž\0„q^&YÍqgmé¾Ôº¿G¢a)õÕE%o(ÕtwvóVp\0r#€¼„ˆlé–-gòîŽ|ßZ¾³}Ðjâ£b)UAuQEÑJGwg7rØ\09@Ž€ÏKŒáþ¹°òv¬ØËÖ·\"Ã}€´AÑ4ƒ”zŸê¢Š²7”öUœ¤±ÀÈ\0rDQ^n³\ZoÙ-|±áþ	±Ì:Ýºþt«9— Ñ¬j«ÑždDîÑÈ[h¸Ë©.ª(|C	v·pv#g\r#\0äˆÒ¼0ë³ÖZÍwƒõ„åï§feî]Ðc¢y)õÕE¥o(mm¢‡˜Ug}àØ\09@Ž\0ò\rwÕEÅI°šé„®ÿŒf›6@Ž\0#€¼DyÃ½—ê¢Šò€ÚÒÍnä,°r€ä¥»4Ü{¨.ªnßæšf›6@Ž\0#€¼t\'Ÿ|Òw\r\rÅfó·›\nq}õUá>s¸ºÁ0³›ì$šmØ\09@Ž\0òÒmüãCùùKÍpâZ¿þ…·ÍY°³›µkaÀO±ÀÈ\0r—îáª«.[7gÎT³,¥B\\cÇ^•f¸vŽ…˜G\09@Ž\0òmøAì€ç|ãrí 	m}Ò£G\nsÄ±0\0ó G\0È@^¢Tÿþ?,MJz&8„5fÌUKÍ—>—…˜G\09@Ž\0òÝyæiõEE+h†CPùùK×›¯ùA³.fa\0æ@Ž\0#€¼D¿øsÎ9ûï4Ý\'¾ÙîÑ£GÑ=ÔÍÂ€y#\0ä /Ý·é>é¤ï›7ï¾ÏùNwçgÛÚü Ñ}‹…ó G\0È@^ºµA={~/çôÓO=<eÊ-»7mzñ`CC!\rs;ê«¯¶ï[¿þù·åhäÖÒä;Û³0\0ó G\0È@^º·KÍšcÖV³\Z¬IW.Ãý;ÛòÓ_q)Ì#€ G\0yÀÂ€y€ä /\0X€y#€ä\00\0r€ä\0æ\0r#€¼\0`a\0æ@Ž\0r\0,À<È\0r\0,˜G\0È@Ž\0ò€…˜G\09È@^\0°0\0ó G\0È@^\0°0` G\09È\0`ä G\0yÀÂ\0Ì#€ G\0yÀÂ€y€ä /\0X€y#€ä\00\0r#\0ä\0æ\0r#€¼\0`a\0æ@Ž\0r\0,À<È@Ž\0\0,˜G\0È@Ž\0ò€…˜G\09È@^\0°0\0ó G\09@^\0°0`ä\09È\0`ä G\0yÀÂ\0Ì#€ä\0yÀÂ€y#\0ä /\0X0x	\0r#€¼\0`a\0æ@Ž\0r\0`aÀ<È\0r\0,˜G\0È@Ž\0ò€…˜G\09È@^\0°0\0ó G\0È@^\0´[–þ–j\'/l€ G\0yœ!f¹Zi¸Çð2±ÀÈ\0r\0ÁËn¡Ù.2«/l€ G\0y¼!-4ÜãxyX`ä\09È€öó÷]nùî6[·Y`ä\09È€ð÷]n¾»Í G\0È@^\0t‚Lƒ­Û,°r€ä@§‹óh¸x9X`ä\09È€Îc—›­Û,°r€ä@\'\ZÂÂ€6@Ž\0#€¼\0áŸ*¥z§¤¤Ìœ8qâÞØØØ†Þ½{úù-*ˆêÙ³çwçŸþgÃ‡ßhþÉ›Qäˆ‘#rDŽÈ9\"/@7²lÙ²{FŽY£æÌ™­òóóTCÃWæ²ú;ªƒ%¯cQQ¡JL|N\r8°±ÿþ{Í—übVpÈEŽÈ9\"Gäˆ‘#òD¹ÔÔWÖ÷ë×O%%½ \\®FsaÒDÀJN^¤úôéóÕ©§žz+8äˆ\"Gäˆ‘#rDŽÈy¢x¡|Á¨¢¢íæBã[*DU^^¦úöíû£{ü~¸\"G9\"Gäˆ‘#rDŽÈÐ­,[¶ôù´¨h›¹°pyÕÒ¥/©1cÔ¨Q×«ë¯¿FÝ?R%/Jj6Õþ*/ß«N9å”/ŒèßO‘#rDŽÈ9\"Gäˆ‘#òtr ‘#¯©OJzÞ<ùW­X¾Tþù(uë-cus£Š¿V\rz…Z¤ÎßPT‰‰ó?ïÕ«W+8äˆ\"Gäˆ‘#rDŽÈy¢DJÊÂ™11?R.W½¹€hôª„Qñz|Ã\r#úÙÏ®SÃ‡]i.œc›MOu¬Î>ûìOÍYÇ\n9¢È9\"Gäˆ‘#rD^€(0qâ„½sæ<i.¾nV#†Ç©ÌWYoe¨”“ô\' Wª/—Ó.×—~oGµ¯¦M»w§9KYÁ!G9\"Gäˆ‘#rDŽÈbc‡4äçç˜††fu÷ÝÕÁ¿~ª¶nyGeÿiƒZõjªZŸ¹F}\\ý¡úŸ©“Õ·ß~é÷vTûêÝws˜³d\'+8äˆ\"Gäˆ‘#rDŽÈy¢@ïÞ½UCÃçæ‚¡¾Y=6ë!U\\´Eí(Þªvï*Ñ%§wìØ®{ì!¿·¡Ú_2ÌYâb‡Qäˆ‘#rDŽÈ9\"/@”¼é(õe³r¹þ®fÍš©¦üf’*))TåïíÑµk×5í¾ÿV3¼O}ýõç~oKµ¿¢|¡¦È9\"Gäˆ‘#rDŽÈyºYÃ]çUŸ«uë^S±±?UÕUª§ßçU¥¥ÅjÈå—ª×W§ª††ÏšÝžj±‚CŽ(rDŽÈ9\"Gäˆ‘ ªÌÿpê»ïŽ©·6¤«aCcUMu•z¯l·ÊÝ¼Qe¾ùG•öúJ•úÊKæB;Mï†tå•—«ôôêÛo¿ðºªýÅ\n9¢È9\"Gäˆ‘#rD^€¨Z0sjë–Mú7eaœ—·Y½™‘®È+–/Q//^¤’^xV=3ïi} Å/-T×^3Bm|{×}Pí/VpÈEŽÈ9\"Gäˆ‘#òDÕ‚ùïN=6ëwúˆ•²\0^–ºX×’—“Uò¢êùÄyêç>©žøý#jæŒßª\'ŸxÔ\\(gªßÍ¼ßë>¨ö+8äˆ\"Gäˆ‘#rDŽÈy¢jÁü…S²`–ŸŠ¸ý¶›Õi¯ê²,¤Ÿ?GÍó„zîÙ¹zá,ë1£Ôæœ·­óT\'+8äˆ\"Gäˆ‘#rDŽÈy¢jÁ|Ô©½{·©G™¡~yû8½à•]ŽüU\\Üõë	ãõ§¢¥¥ïzÝÕþb‡Qäˆ‘#rDŽÈ9ê\"YÖsn©v\Z\0‚]0îU®oþ¦¾üòS•øÜÓ*aÔujÄð+ÕÐ¡W¨¸+‡¨¡æùš«‡«î¿G;ö=­ïí©ö+8äˆ\"Gäˆ‘#rDŽÈQb¸;¼¥†{íô‚ù&Å\n9¢È9¢È9\"Gä¨e·Ðl™Õ‹ö	zÁü&Å\n9¢È9¢È9\"Gä¨\ri¡áGë´kÁ|˜\n“Šâ•€ëK G9\"Gäˆ‘#rDŽÂš¿ïrËw·Ùº\r´oÁü7*L*JWpâÍúÂ¬$ëïrD‘#rDŽÈ9\"Gä(lùû.7ßÝÚ¿`>D…IEá\nN¼ÏJlQø,\nÚŒ_rDŽÈ9\"GäˆŠ¦e\ZlÝ:kÁ|\n“Š²œø\0[â£pËã—‘#rDŽÈ9¢¢)Gq\rw´~Õ‚ù\0&E+8	­¬ÄØ×\'#Š‘#rDŽÈ9\"GaÉþ.7[·Ž-˜ÿJ…IEÉ\nN[W^¢iËã—‘#rDŽÈ9¢\"=GÌºÏ¬µfU›Uoý\rf}b¸w3ŸiM íæZ*L*\nVpâƒÜRìôäˆ\"Gäˆ\"Gäˆ‘£Î%?÷•k5Öª•oÖZ) MæO©0©_Áiï¹]]„¯ä0~É9\"Gäˆ‘#*ÒrcVvM¶¿ÚjÖ´T@‹æýT˜T¯àttw¼HßñKŽÈ9\"GäˆQ‘”£ñ†ûHýžÍ³ËjÀ\'›u±Y}­iû˜5Èºìnî»%\\>¨bk7xÁü*L*BWpZ; M¨ï‡‘#rDŽ(rDŽ(rØÃûw¶åt¢áÞâÝý¬é}«{2­àwÁ¼\n“ŠÀœÎ>ºk¤nY`ü’#rDŽÈ9\"GT$äh¼O£\\i¸·f·‡Ü®Ü§éfK7Ð|ÁüI›K¦ß¶m­ª¬ü³>}àÀ¿Óåå¥©#†¨É“ÿCMšt›WmÜ¸\\ee-S-=¶\\7mÚm~^«W\'©óÎ;7àõ55ïêû¬¯ÿ@×†\r¯¨Ïs®ß·o›×ô%%TYY¶>-?jVréÍž÷òåÏ9çëê*‚~}#hìø`æ{fÝiý\r†ïí\"ñÀ5äˆ‘£çˆ:±EŽÈ•9Š1¼w#—ï_÷íà}Êîæ¹†÷îåƒh±\0¯óÿµ©JKßÒAºùæQze_Nß{ï¯õé3Ï<C-\\ø„3­œ—é<oß¿ÿ?©k¯Ó§«TK-×ÝtÓ\rm~nýúýP]}ul‹ÓHc ÓTWçëûn6,©Îÿâ^Á÷~oè¿\'Þ¢¶lù£žFÎ?õÔýêŽ;~¡rs_ÓÓ–”¬××/Xð˜¾^.ÏÈX¬.ºèB}›}û¶êË/žÓâsŒ ßOþeåd™õü—±’èv‘¶’CŽÈ9\naŽ¨_äˆQQ™#ÏÆ¸²šmÏ¦»Ü§‘p|Á\\Ój;V¦tùå;—ÉùÌÌ—õé={²¼¦w7\n?óº,=}‘¹R¾Ì\\iÞb6\nª–[®“Æ\"ÐõMMÕú>ì:ãŒÓÔèÑ#óGîV……ëœéKJ2u3Q\\œ¡.»ìßôí{öì©WäåùÔ×¿ïLër}¤ÿÊe2½<—Ã‡wªÔÔgÔi§ªÿ‡5k’ULÌ\0ç6r½¼öãËmöïß¦ÿÊôöëçû:ùû¿#påÆ°¶xîNÔ–•Ï•»&z\\Iß¡#Gäˆ…(GThŠ‘#*êr4ÎðþÎöÅ|ÿÞ»ª³k9p|Áüq‹UW÷ž\Z0 ŸÊÊZªN9¥·züñ{Unî«:L“&ÝªOŸ{n¯Ûôí{–ÊÎ^®FºJM™2Þ\\YNÕÓŸvÚ)fÃ°PUW¿£=vS“{7Si6ZzN²«íØ±×9ÏeÂ„›ôi©yófzÝiézkå}«>Ÿ“³RŸ·#GJi+*6éËjk·«¼¼ÕÎõîÆh±žFÃ÷ùÉõwÝu»ª¬ÌÑ§+õß}ûÜ»áÊshíµŽ€œ@+þVVZZÉñ7}ªŸé#å;täˆ‘£äˆ\n]‘#rDE]Ž<·n\'ž ÇxÆ`+7àoÁ\\ÝbÕÕ•é¿7¾¢‚œœæÊoSaá\ZU^¾QwÞÿóºÍñ-sîóyy¯Y»·Æëó¨@½gÏ[Ö–¹sÌ¦¡ªÕç\'%Ó§§ÿÁ9¿aÃË*&æ_œó)jàÀ«ªªÍê’K©Ù³p®+.^§o/[ì<ïïw¿›l64¶š÷V¶Y³¦êÿ=--É¹y}bcÿ]M›6Ñl2õãÈ4©©óÔYgi6;õmí×±µÿ#DÜX¹Ib¥ÅßJN[Wn|Wrºbw¾¶¾Väˆ‘£äˆ\n]‘#rDEUŽÇ·>»¬ó\'‚½Üó\'Ãbhµ\0½`þ¨M•™ù’:ùä“tÃ°jÕszWÒ‡ž¢Ïÿû½ô_{Zw£pƒ>½o_¾Ó$ØÓ46V¨@-—}­¹¿VŸnjú°Åçeßeå&ç2Ù’8bÄå^Óee-Ñ»ÌNŸþ_jÒ¤[tÉó‘Ûfd¼è÷y:TèÜ·ü•†@n#MŒýÿI¹\\•êÀíÎùÒÒ7õó¶ïûÈ‘ëàXÛ[ü_B´`¶GÐqm¼M[W2Z[É	våÆóñ?ë‚-m}­È9\"G!Ìuâ‹‘#*ªrtŸÇtY\'øù¬õx¬™´Z€^0WµXlS¹¹+Ôµ×Æªo¼ZŸž;÷¤yóTS¦ü‡¾LÎ—”¬Ó·±…ÊÊlke¿RoÉ’ûëßWþ[¦“ËÓÒèórzÁ‚GZ|~2Íüù3›]vûí	^—mÜ¸T×Ô¾þê«¯pNoØ°Ø™nÿþ=­\\ÞÐðžþ[U•£òòV9Ï;1ñ!³‰ØîÜ¦¾~¯¾Ü~}ìÛÈßììTçq23SZý_B¸`¶+»•OFƒÝ.ÐJNv®ÜønÑåJN[_+rDŽÈQrä9·m{ÃÉ†äËßt2ÞäC£É“ow> :þAÑR••õ²ßÕÖnÑ·õ|<É©¿Ç(/[_ïr} êêö8U]½YhÔÒÿ!ãy^2PSóçÿï””\'[}m~ø7ÎiÏììÙ³>¨×˜EwŽÚ2ìå­œÎÉY¦OËØtÉƒŒ3û}Ì¾­ïùY³î	øäù¾ e¿9²£ÕÙ%ÏÕóyÊíåëSž·¼O=ºS¦«-[^WÓ¦ýZÿ•=ÏZËq„äÈ³	žt‚ŸÏø6÷@¤4Ü¶XMM˜+ÎyYé-t7Ýt½µðm~i\n.ºè½°;z´Ä\\`¿hí^z·¾¾±±\\ù{l¹lêÔ_9ç«ª6y4ÍGv;•Çñw?«V=ëu™¬Xýä\'ÿÚìz÷\nÉ+Ín?lØeæB6C_·¾µòï~>ýúõÕ×ÙÓÛÿOnîrçö••Ò·lY­/—Óyy¯¶øZwÑ‚Ùó“Ñ\\¹ii%§ª+7}>\'úµ\"Gäˆ… GR2f}¤ÿÌ¦y‰u¤ÿÿÔ§ÝGúÌ™öø^\"Ço/{V¸?´\nœ!{ÉcÕÕí¶šÕÌ€Ó=þøT}º¤d­:v¬Ô¹Íøñ£éŽ)Véé/èLH—/Ÿ§§±›þ)S~édÜ^VÈÊ¿ü_“&Ý¬ÿÊ^\'qq—èÓR6¼d}Åûù¬\\9ß9½fÍšnK‘£èÎQ ’½®’“¯öíËs>µO——gé1î>öÆ‡ú½É¿†>¸å=æ\'Lø…“ÍÚZ÷ñ7ÜÍ¯ÿ1j¿7Èò¾ à5ë¸y^ÓÏžý[¯÷AÉ‹ýö}Ê°ÜÎý!]š×õ’Ó²²\rúº\'ž¸Wÿo†þšWº^6ØËÉm{_Ï0ÊQµÇåŸàç3Èã±>¥Õô‚¹²MU]íþ„±¢âm½“ÝBí…¤¬45U8ÓºWrâó‡m³Öoéóï)ßÇ6ô›~Ñìq7lH±Žì|‘ª¯ßã\\.Ïá¬³þ?çü‘#Eæ‚±¹°^e­”¯ôºy.×ûæ\nG’ntÊÊÖëï¡Ž}ª©ÙÜì¹¤¥=¯ZuìØNëËÛõãËi™^þ&%=ª§ohØkmíâñ&S`½i¼c¾<c6U©­¾Æ]¼`öüd4®>Á÷·’Ó‘•ß•œ„0z­È9\"G!È‘=Žd{ÎoY	—Óî¦¸2`†¤dåYÆ—Œ)’1½zõsz\\ËtrBù{î¹ÿ¬æÍ›î5­dÑ¾½¡·>?¡OŸsÎ¬¯cøŸröiYÈ_yÌ¶X[òŠœë%köm%s‰‰¿sÎË×PÜÍ~¥^ŽØ¹¹îº8•‘±Èjtrœûª¬Ü¨ÿ¿¶,«ÈQô¿µ6ÿgÌø/½Ì–ó26å¯¼\'ÈuöûˆŒG9/•÷Ž±cGz5ÃvfKJÖè÷ûò%KžV^ø#=N,xØ:FÇ.ë§$W9ÏCÆ¬¡÷ðª°>°µ÷jÙ¢³!ïm¾Ï]Þ[är¹ûƒÚìì¥:Ër{ÿ«½±sb¿ïØ·íÈë&cã+ó}OðóéãñX\r´Z€^0ÐbÕÖæë–©SÇ;—mÜø²¹22Ð9/+\nö\nƒ}^Vˆ¦O¿S7ž%·µWþeÚÃ‡·é•†ÂÂ´€ÏA®s¯|ç›ùÝzËßSOÝÛlºÒÒµÎ\'Ÿž———oPÛ¶­Ö[æ,xÈëº={ÞtÞX<§—µººRsee“¾ìÀw­ïÐ^§ÏÛ—K54Ø\rDŽ>Ÿ›»Lÿ5ôwO¶ú\ZÛÕ†…f¨+©ƒã«‡Ÿ-	UÖå‘n¯9\"GäèÄæHÆÑ€ÿd®Ô¿déÿ=Fì«ä´4Åž·qé©\Z5j„Õ¼ìq¤ÿzüù>®ÜdÉ÷ñ7ïîóû÷ç9\r±ì!?T_ž––¨OË_yœC‡¶6Ÿò<\ZË¬­g<¶p\'ë-ðž™9R¨Ë½5ož>-9ñœÖóþe\Zû´| f/+ì×ËÝ¤£îú~ÔR¼ª÷\0ÉÉyE¥¤ü^ácÇJô‡=wÜ1F¿?45½ßlœÈ´’QÏ²×ÔÂ…³¬-Ìk­fºÔë62½œv¹Êõ—ËRSçèÇª¨ÈÒ×IvÜÜ&ªÁƒÏÓÍ¼}{û~å½GN{þò~èÞRÖlLËóó7Ö/~Òy²—ò<‚}ÿ‰€…ê¨é¡~< ÜîŠ «©©¼]·£Z®.þ$t§µõ —5]kGíÈ…¶ü.j8oQð}­È9\"G\'8Guu;õßëÆZ\Z‚}ûr­ë×Í•öõê¼óxÝæx“ì>Ÿ—·ÂãŸ\n³éÝ«|777Õj¸+Z¼¯\nôtösØ¿ÿk—öGiÊÊ2­-v+õcefº·:/_>×l8·\Z‘Vãþ‚ÙHo·4¸Åk<KÃa?W¹9íÞúîoüKÃc?vié\ZçòË.LŽx?jÓ¼¯ªÚh»àg\\ÖÖæéëå¼ç´IIëÃd,\'\'?f}­i¼õ]í)z7u{z{»ÛlýšdÚ³½û÷j=½ŒsùpÉóñíLÉmåCµaÃ.õzþöóµïÃó¹º›çãË”ôôçõå·Þzƒ^†¸·ž»÷¬²3äy›~?ªc7Ð¥\r÷ûT˜T-˜}ß¬}W&êŒó¹ö¬ätõwæ½VŒ_rDŽB”£ÌÌ…Ö‘þ_R«V=c®Ì÷P?|·>ï>ÒÿKÎ´gžyºÙ$_¯OïÛ·Ùi¶íi\Z÷(ßÇÍÍ}ÅÚ\nœ¬î¸c´ºë®›õô†>ÙÝ^Ó=Zhí6[l®äË×-Êô}Ú•“³Ô\\yÏo6>íÇw7Ð­­ôãôémÛ^k6ýˆ?užÃäÉ·êÓî£ü_ïLW\\œ¦&Lã4#ž÷oŸÎÈø9\"G«¾¾T]~ù¿9cMÆ¿œ.+{ÓK²ÇÄ9çœ­öïÿ³3NdO-sÉÉ³ôžS£G_­³ièÝ²7;eúÔÔÙÖ–éuVSüšß±g[;côyiºíçfO»zõ|¯Û×Ô¸·PË‡\0Ë—ÏÑ_SZ²äIçq[z<CïRžåÜ¯¡¿Æ•\rïG|‡èÚ†»<äåþ„Žs¾®nG«Ó¯Y³À9ßØ¸Û:Ò«­Þ.%å±V§‘*ßûÎÉYÒ%¯KÌEf°bÓ‘OðýÔŠ¿£Â³’Ó•G…míµêÔ1½XgBN=º=àtãÇßØbN<ëÀ<çþÊÊ2ôJÔ†\r‹ô§úöÊUFF’3ýµ×^¡n¼q„¹’”£gè’Ó¾Ù\rÇÜ‘£èÌ‘Œai†í±)§çÎfm…»_M™r›Ó,—”¼¡oc7Ü••oYß-3‚þú><ÇçãÔÖ¾£W°÷ïÏÕÍ¼3ÉÎáÃ[œéä¾ä¶Òü§§\'š+ùÙjÖ¬ß8%+ëGŽl5›˜ÍÆ§Ü·ü?ržÙ=v¬H_î;½»(÷hÖËõÿ*ÿŸ=Ëµ×YnØËßÛÊs³“ñ~ä¯Š‹_w>’1,»rWWo´æ·×kLÙãdñâßë±\'cW² M»äÁÐ{k8™”±\'ï\röX”ÛËûŒéI“nÒe¿Éõ\r\r¥Îü‘é\nWë¯olÛ¶ÊjÂ×[Í|Ž×ÿ`çÎÐ[Ñ7êïrÇÇÇ9c_î×w¬ËãÉs–½Fä¹ÎŸ?ÝÚÍýéhy?â(å@×6Üï…¬JJÒÌ&y¥Z°`¦õ}²¥æJþæô|s%~¶¹ÐÜd-¼÷º\\–œü¨>ír¹·HÈ›€ïý¾f.¬S¬…vŠþt3.îßõi)Y`»w9ô¾oYñ¯«+ÖÏMÊÐ»CýÒ9-×…âõ	Ñ‚¹¥-ý$¿µß5míwQbtÍïž¶õµê”ù_U•e5/;ã¡´4½Ùt‡å;ŸÞË¸îßÿ‡*-íY½\"#Y’ËÜ[Ý\nÛ$&>¨?»¦æOÎe2)Üßs‘-²‚âoŒ¦§?Ö¹#GÑ™£¦¦½zùoŸŸ7ï·Ö‘þG:™ñ-i®%ÕÕo›\ró6³Qøƒu¤ÿIúúÆÆ]Êóq÷ìY£?ð’†A¦‘Çt7\rùfþ¦¹þ€~L{zÏŒUTdêéí1(ïm¾ÏGòlè­ì#õs’Ç²ó*ù‘¬HÃã;ž%‹öt“\'ß¢O÷íÛGÍ˜q§ßñ¿rå\\ç´üOòÞkè]eß±vÎ\"G¼ù­ÚÚ?ëõ1CÿL×zœÊò[>Ü²Ç…äÈwýìÈ‘-zNÞä2;[r{Cïu±Ülj78ëp«W?ÓâØ³ÃÎ˜</{QÆ±äñø‡»ïGóø‡lÇß³ìõIÉ ûì¯üÚ™±SþFøû¿Ã\rtmÃ]²:|¸@¿ù76–êrÒŸc}jÿ¢^°Ú+ž·³~GŽ¼kýLÅƒ~ïßýÉ~¢sÞ}D×ãÓºè:EŸnh(QYYÉú6sçÞg­à™ñçñìçÙÔ´\'$¯Þ—híýÖVnŒv®äØ»Ž‹ö¹·ÔýÖ9/[¯¤õœÆåÚm®”/Ô§¥Ñ.,\\e®Hqnç^™åu›úú^+™™Iú;°\'ŽÕ—Ù—KÃ`ßFVšd×Ai:ŽoyxÑZÊ²Žlž¹#GÑ#öx•1{±ó>\"ãÔsÜ¸·p_çœ?tÈþy£}Þ~’ÓGnuÞäÃ©ÛoÿY³qe?¶œ¯­uw[²$yq7Ç§u7ÜeÖÑùœÇÞ²eE‹ï]öôÆ¶üÏþ®“Ç·jÉ¸¼†s­2çÿ6ô®ñw‘#ÞÎw{lËx—÷Cï²Ç¹^Æ—çôòj—2æSSŸÒØúfF–ûž·‘±(ï_wÜñs]¾ï3••ëLÊÃeek­_ÎHužŸlœ1ôÖï…~ÿ;ÃÆ¨Ë.äuÝüù÷{ýŸr¹™»î\ZçL\'ÏÃÐ»¾¿\ZéïGÌrYÏÇe?úîïmÛÿ{­ Ì{CZöÂ¬²2Óút§Õd[[ôÒüÞfõêyÖbßwCÃs!¾N7ævs¾rå}º¦æmÝ ø»ï±c¯ñ:/÷!oîŸü¾6a>^mYhëÊM°+9öã‹öú;i7ú½|ÄˆË¼.“†vôè«Ì•“_è•“Å‹Ó[”gÌ˜è\\fè-=ãÜGYÙ\ZsEåsf‹ÙüþÆúY—b=Îíi²²9![4|Wª©i·“-¹¯pÌ9ŠÎÕÖnÖÍ³ûC(÷e2Ö/¹ä_óò>a¿_Øçekõôét6<Kn»aÃ”¿Ç•÷£iÓ~¥)w~ƒßçdŸ–ÇqïÙá¾_ù+uõÕ—7{_“ìH 9–i$ûò¾(§‡\r»Dåæ.	8¶³³S¾Frçû¨»9?~Ý¨QÃôc¶%_ä¨û½Éú˜,Ïå½À^»›ÜW¼Æ…ç{…ûƒÒ×õi—k—ó~c¿_ØÓ,óºÍ‚3ôôÆ^qñkNå¯|È+ï\'r?ƒÿØ™VËór’i°=s\"ÿÇÃÿ—Þ+Dê©§îqÞ¿ìª¨xÓyÏç±páCÎß(x?Êõã‰\'è1žñxŒ­´Y€³`Þ’ª«Û®·DL›6^/e¸oßŸTjê“z!wäHµµk»ž^Îßzëõz\ZCïfû’^IZ²äq•˜8]_ž—·ÔZñ×y»Ñhl,±>‰}AŸ–…¯»a?þœ\\®ãß’ÛÈŠ•l-,.^e½©,Ùëc?÷3²eÁwwº;à×ÔßJÎÄ ¶`DMŽrs_6WÊªÇÛªUsu³;cÆ¯Í•e÷–`iì±lçdÿþl§iu7Éúö2Æ%ú¾eºr½²aŸ¶?ô*/_Ûl¼WU­wš}YI—œÆÅýDÿ•Ú½`OXæŽuŸ55í\né2º«+”ÿ/9êžïG¡£á˜ÛõœÂ,Gã<Æ·låîìƒ§]lßŠ.56pÌ»CV.×Nså³s¾´ôus!Wjí~÷¼ÙLä[ßÏÙìu;÷\'¨¯™ÄFkW¥Àánd÷¦EÖ÷ÝnÖ§¥I¸ùæ‘^Ó®^=×úäõ³1xQß¿}{ö¼á±Õ14¯9¿Wèû-ž++mY¹1Z¹](j¥KsTW·M{ûü†\rIÎ·³QU•i6¯;üŽ—ÌÌÎy™ÆÐÇFXì5]mí&³_§ª«7èû–ñîÞzñŽÕx¿éÑè¶<>§L¹EßnË–ea›;rÔýrDñ~DŽÈ9j“|†¸Òè¼Ÿ“Ÿ+7¼·n÷2\0Øæ]!«úz÷o#Þxãp³)xÉj&Þ´v“KÖÓo\"ŽßÎÐåxÈ9=uêmÃóö†þ¾Û\"}ZÏ}D×ãÓ._þ¤Þ}oÞ¼ûôù††\"ëû<ëÍæãÖÁrrCöúDÐ\nŽçJÈ••‰Fð?­â{»ŽþÞjDçÈÐßmþ}º®n«Õ@¿pÚØØ‹Ô¤Icõ8—1{Æ§¼ï¦&ûëo[ß]ëŒwCN¶J«Ë/¬ï¯_¿¨ûïÿ•sÿ2ÍèÑ#t¾~ò“Â6wäˆQ¼‘#Šùc¸÷\nñlŒ;ÚtK³í¹»ºç`-àµ`.\rY56y4¥ÖÖµuÖd^qšð¼¼—½nw¼á.UGº<sÊ)\'›\rÉ–faè#ºÆš+ü­-mãôi÷]\'8ÓÕÖþI¹\\;ôÏ¾È455¬£Ï–êÆÃÐß!ZÒ×\'ÂVpü­ätÆ–Š®8úkXäèÈ‘wœ,ÈùmÛ–YÍçæ€ãåá‡ï4è,§Ü^-jv¿«VÍV+W>¥êë·éË\n\n–š\ròóºA—LUWg6»yžoè²=ð¹„KîÈQ÷ÎÅû9bü’£ÉÏvyîú-[ºÛ»{¹ÜÎsË6»’]½`nhp…\\¾¯j¯˜Ë\n¸{«[–nrr^ô»À’ïÊÁqìf$#ã9\'Ül\n¸ “Çima8aÂÏç\'GT¾ýöxç:÷î°¬à„`%§³W–\"*Gv6ÒÓç©¦¦}™Û`Ø°oq¼HÓì{YVVR³iÎõØz^ª›h;;’;CïÎæ÷1,˜®uCÿ&éïÛ4Ž»2wä¨ûæˆâýˆ‘#rÔ&“|šn9-Rë×ÆÛËtÏøÜ‡Ô#´V@˜4Ü²UKÎ{né–Úßm¤ùë§Mû¿×ûÛÊí¹ óÝÚço\Zy²Åï¼óþEo}óÝ\"ª-Ýº‚co	èÈnw‘¸Û^§å¨´ô5ýÝj{ìÉßY³îr>ˆji¼Ø»”»wû^híšéwzù°JKþø#¯ë$2þå6)éAë\0klÓ8îÊÜ‘£î™#Š÷#rDŽÈQPÆ[c]ù4ÞYVC.[¯íÝÍe·ñAÖmÞ0Ü»{Þ®Îº\r€î¶`¶·vt\ZÌA­¤»E ÒH69\n§±N¹#Gäˆ\"Gäˆ\"Gmcxÿº=µÕà;Û\0fÌ!ìnx‘¼Û9\"Gäˆ‘#rDŽ¨hÈÑmVãí\n²Ñždp4r€3æ°]Éb¸wA\ZGŽ(rDŽÈ9\"Gäˆu¹f=`ÖZ³>1«Áúäï§†{wó™†{Ë8\0Ì,˜»P‚µò’ÐÂõŸEÉÊ\r9\"Gäˆ‘#rDŽ¨hÎ\0Ì,˜#hËB´ì¶GŽÈ9\"Gäˆ‘#Š†\0fÌa³’+7äˆ‘#rDŽÈ9¢h¸°`fÁÜ¥+9IQºrCŽÈ9\"Gäˆ‘#Š†\0fÌ]&ÁúßÈEŽÈ9\"Gäˆ‘#\04ÜæÎÕ‡Qäˆ‘#rDŽÈ9@ÃM±`9\"G Gääˆ\"G\0X0³`9¢È9¢ÈÈ9À‚™bÁLŽ(rrDŽ@ŽÈ\0Ìf#rrDŽ@Ž(r€3f#rDŽÈEŽÈEŽ\0°`¦X0“#Š‘##r€3Å‚äˆ‘##Š`ÁÌ‚äˆQäˆQä\0fŠ39¢È¿ääˆˆ.\'Ÿ|Òw\r\r…,Ã ¾újû>s–¸•äˆ\"Gäˆ\"G Gä@<øÇ‡òó—°`ƒZ¿þù·ÍY²“QIŽ(rDŽ(rrDŽ\0D«®ºlÝœ9SY0†A{Uš9K•äˆ\"Gäˆ\"G Gä@0à±œóËµƒ…c×Ö\'=zô¨0gI£’Qäˆ1žÉÈ9%ú÷ÿaiRÒƒ,»°ÆŒ¹j©9+räˆ\"Gäˆ‘##r º:óÌÓê‹ŠV°ì‚ÊÏ_ºÞœÍº˜¡HŽ(rDŽÈ99\"G\0¢Oü9çœýwÎ¡_(÷èÑ£Æ|ýÇ0ÉEŽ@ŽÈÈ9Åç“Núþ±yóîûœïþœøïöX»d¡LŽ(rrDŽ@ŽÈ€îaPÏžßË9ýôSO™rËîM›^<Èï9vÞï1ÊODÈQ+­iÈw{ØÝˆQääˆ‘#\0ÝÌ¥fÍ1k«Y\rf)ªÃå2Ü¿Ç(?ÁQ+ÉEŽ@ŽÈÈ9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¢ßÿð9‹­æ6BX\0\0\0\0IEND®B`‚',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','1',1),('schema.history','create(5.21.0.0)',1),('schema.version','5.21.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('06a1cda066cb4ec18d545bf849a3cfd8','SpringAutoDeployment',NULL,'','2017-07-24 00:59:01.536');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('test_audit:1:5941cc917f6a4638821c450f92e51fff',1,'http://www.activiti.org/test','æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹','test_audit',1,'06a1cda066cb4ec18d545bf849a3cfd8','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æŽ’åº',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'åŒºåŸŸç±»åž‹',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='åŒºåŸŸè¡¨';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','ä¸­å›½','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'æ•°æ®å€¼',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'æ ‡ç­¾å',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'ç±»åž‹',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'æè¿°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æŽ’åºï¼ˆå‡åºï¼‰',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT 'çˆ¶çº§ç¼–å·',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='å­—å…¸è¡¨';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','æ­£å¸¸','del_flag','åˆ é™¤æ ‡è®°','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','yellow','é»„è‰²','color','é¢œè‰²å€¼','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('100','java.util.Date','Date','gen_java_type','Javaç±»åž‹\0\0','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Javaç±»åž‹\0\0','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Javaç±»åž‹\0\0','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Javaç±»åž‹\0\0','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('104','Custom','Custom','gen_java_type','Javaç±»åž‹\0\0','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('105','1','ä¼šè®®é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»åž‹','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('106','2','å¥–æƒ©é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»åž‹','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('107','3','æ´»åŠ¨é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»åž‹','30','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('108','0','è‰ç¨¿','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('109','1','å‘å¸ƒ','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('11','orange','æ©™è‰²','color','é¢œè‰²å€¼','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('110','0','æœªè¯»','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('111','1','å·²è¯»','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('12','default','é»˜è®¤ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','cerulean','å¤©è“ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','readable','æ©™è‰²ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','united','çº¢è‰²ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','flat','Flatä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','1','å›½å®¶','sys_area_type','åŒºåŸŸç±»åž‹','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','2','çœä»½ã€ç›´è¾–å¸‚','sys_area_type','åŒºåŸŸç±»åž‹','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','3','åœ°å¸‚','sys_area_type','åŒºåŸŸç±»åž‹','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','åˆ é™¤','del_flag','åˆ é™¤æ ‡è®°','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','4','åŒºåŽ¿','sys_area_type','åŒºåŸŸç±»åž‹','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','1','å…¬å¸','sys_office_type','æœºæž„ç±»åž‹','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','2','éƒ¨é—¨','sys_office_type','æœºæž„ç±»åž‹','70','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','3','å°ç»„','sys_office_type','æœºæž„ç±»åž‹','80','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','4','å…¶å®ƒ','sys_office_type','æœºæž„ç±»åž‹','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','ç»¼åˆéƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','2','å¼€å‘éƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','3','äººåŠ›éƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','1','ä¸€çº§','sys_office_grade','æœºæž„ç­‰çº§','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','2','äºŒçº§','sys_office_grade','æœºæž„ç­‰çº§','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','æ˜¾ç¤º','show_hide','æ˜¾ç¤º/éšè—','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','3','ä¸‰çº§','sys_office_grade','æœºæž„ç­‰çº§','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','4','å››çº§','sys_office_grade','æœºæž„ç­‰çº§','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','1','æ‰€æœ‰æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','2','æ‰€åœ¨å…¬å¸åŠä»¥ä¸‹æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','3','æ‰€åœ¨å…¬å¸æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','4','æ‰€åœ¨éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','5','æ‰€åœ¨éƒ¨é—¨æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','8','ä»…æœ¬äººæ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','9','æŒ‰æ˜Žç»†è®¾ç½®','sys_data_scope','æ•°æ®èŒƒå›´','100','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','1','ç³»ç»Ÿç®¡ç†','sys_user_type','ç”¨æˆ·ç±»åž‹','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','0','éšè—','show_hide','æ˜¾ç¤º/éšè—','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','2','éƒ¨é—¨ç»ç†','sys_user_type','ç”¨æˆ·ç±»åž‹','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','3','æ™®é€šç”¨æˆ·','sys_user_type','ç”¨æˆ·ç±»åž‹','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','basic','åŸºç¡€ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','blue','è“è‰²ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44','red','çº¢è‰²ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','article','æ–‡ç« æ¨¡åž‹','cms_module','æ ç›®æ¨¡åž‹','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','picture','å›¾ç‰‡æ¨¡åž‹','cms_module','æ ç›®æ¨¡åž‹','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','download','ä¸‹è½½æ¨¡åž‹','cms_module','æ ç›®æ¨¡åž‹','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','link','é“¾æŽ¥æ¨¡åž‹','cms_module','æ ç›®æ¨¡åž‹','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','special','ä¸“é¢˜æ¨¡åž‹','cms_module','æ ç›®æ¨¡åž‹','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','æ˜¯','yes_no','æ˜¯/å¦','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','0','é»˜è®¤å±•çŽ°æ–¹å¼','cms_show_modes','å±•çŽ°æ–¹å¼','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','1','é¦–æ ç›®å†…å®¹åˆ—è¡¨','cms_show_modes','å±•çŽ°æ–¹å¼','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','2','æ ç›®ç¬¬ä¸€æ¡å†…å®¹','cms_show_modes','å±•çŽ°æ–¹å¼','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','0','å‘å¸ƒ','cms_del_flag','å†…å®¹çŠ¶æ€','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','1','åˆ é™¤','cms_del_flag','å†…å®¹çŠ¶æ€','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','2','å®¡æ ¸','cms_del_flag','å†…å®¹çŠ¶æ€','15','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','1','é¦–é¡µç„¦ç‚¹å›¾','cms_posid','æŽ¨èä½','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','2','æ ç›®é¡µæ–‡ç« æŽ¨è','cms_posid','æŽ¨èä½','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','1','å’¨è¯¢','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','2','å»ºè®®','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','0','å¦','yes_no','æ˜¯/å¦','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','3','æŠ•è¯‰','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','4','å…¶å®ƒ','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','å…¬ä¼‘','oa_leave_type','è¯·å‡ç±»åž‹','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','2','ç—…å‡','oa_leave_type','è¯·å‡ç±»åž‹','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','3','äº‹å‡','oa_leave_type','è¯·å‡ç±»åž‹','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','4','è°ƒä¼‘','oa_leave_type','è¯·å‡ç±»åž‹','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','5','å©šå‡','oa_leave_type','è¯·å‡ç±»åž‹','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','1','æŽ¥å…¥æ—¥å¿—','sys_log_type','æ—¥å¿—ç±»åž‹','30','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','2','å¼‚å¸¸æ—¥å¿—','sys_log_type','æ—¥å¿—ç±»åž‹','40','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','leave','è¯·å‡æµç¨‹','act_type','æµç¨‹ç±»åž‹','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','red','çº¢è‰²','color','é¢œè‰²å€¼','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','test_audit','å®¡æ‰¹æµ‹è¯•æµç¨‹','act_type','æµç¨‹ç±»åž‹','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('71','1','åˆ†ç±»1','act_category','æµç¨‹åˆ†ç±»','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('72','2','åˆ†ç±»2','act_category','æµç¨‹åˆ†ç±»','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('73','crud','å¢žåˆ æ”¹æŸ¥','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('74','crud_many','å¢žåˆ æ”¹æŸ¥ï¼ˆåŒ…å«ä»Žè¡¨ï¼‰','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75','tree','æ ‘ç»“æž„','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('76','=','=','gen_query_type','æŸ¥è¯¢æ–¹å¼','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('77','!=','!=','gen_query_type','æŸ¥è¯¢æ–¹å¼','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('78','&gt;','&gt;','gen_query_type','æŸ¥è¯¢æ–¹å¼','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('79','&lt;','&lt;','gen_query_type','æŸ¥è¯¢æ–¹å¼','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8','green','ç»¿è‰²','color','é¢œè‰²å€¼','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','between','Between','gen_query_type','æŸ¥è¯¢æ–¹å¼','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('81','like','Like','gen_query_type','æŸ¥è¯¢æ–¹å¼','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('82','left_like','Left Like','gen_query_type','æŸ¥è¯¢æ–¹å¼','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('83','right_like','Right Like','gen_query_type','æŸ¥è¯¢æ–¹å¼','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('84','input','æ–‡æœ¬æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('85','textarea','æ–‡æœ¬åŸŸ','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('86','select','ä¸‹æ‹‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('87','checkbox','å¤é€‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('88','radiobox','å•é€‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89','dateselect','æ—¥æœŸé€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('9','blue','è“è‰²','color','é¢œè‰²å€¼','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','userselect','äººå‘˜é€‰æ‹©\0','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('91','officeselect','éƒ¨é—¨é€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('92','areaselect','åŒºåŸŸé€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('93','String','String','gen_java_type','Javaç±»åž‹','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('94','Long','Long','gen_java_type','Javaç±»åž‹','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('95','dao','ä»…æŒä¹…å±‚','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»\0\0\0\0\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('96','1','ç”·','sex','æ€§åˆ«','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('97','2','å¥³','sex','æ€§åˆ«','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('98','Integer','Integer','gen_java_type','Javaç±»åž‹\0\0','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('99','Double','Double','gen_java_type','Javaç±»åž‹\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT 'æ—¥å¿—ç±»åž‹',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT 'æ—¥å¿—æ ‡é¢˜',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ“ä½œIPåœ°å€',
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç”¨æˆ·ä»£ç†',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'è¯·æ±‚URI',
  `method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ“ä½œæ–¹å¼',
  `params` text COLLATE utf8_bin COMMENT 'æ“ä½œæäº¤çš„æ•°æ®',
  `exception` text COLLATE utf8_bin COMMENT 'å¼‚å¸¸ä¿¡æ¯',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='æ—¥å¿—è¡¨';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`title`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) values ('00f739d5f9d747b6a3654750927cd69d','1','ç³»ç»Ÿç™»å½•','1','2017-07-24 01:04:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a','GET','login=',''),('06bac683094842609c92221c939c57e8','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:00:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('09b53638e77a487fb115e38d76430b7f','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2017-07-24 00:59:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('0f39e2db7d614b298c8079b331844104','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 01:04:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('12278ef451ab4bc0a7db4fbb8a0e8aa1','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:04:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('14f986c136854d368013e2c6a0a99cf7','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:04:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('157704f884aa4b88a97eba77d9400132','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 00:59:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('1a017c23f3034c57bb8b32ddc8e434e6','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 00:59:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('1e4b9302c0f547128ffb1a34e20071fc','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 01:04:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('1ea5ba648aa746c79dc572770eb79874','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:00:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('209f08ef98be42868dc95241c79e01f0','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 01:03:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('20f5d07be0b1405c85434367b5838b55','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','1','2017-07-24 00:59:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/log','GET','',''),('24406a312ad14b29a0972857b15c9791','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:00:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('24cd55a534ce41239ccfd2a6a1764ea9','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:00:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('263ebb68e40f4e79a0ca4e19731c30cb','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:03:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('26feea0fe6d94022b449a073a448b8e1','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:03:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('31773aa7e1854e8bb4c612a34818bea1','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:03:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('34bf34dd4c6b4e91bb9fa274fb9125eb','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:04:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('37248805d88f4b7bb49cff76ed6af72f','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:04:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('3876bcf7d69d4c848461e48536a54181','1','ç³»ç»Ÿç™»å½•','1','2017-07-24 01:00:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a','GET','login=',''),('3bdd39a8e2264a408f737a7a8731c824','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 00:59:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('3ced82541a4441068b5432f379680648','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 01:00:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('3e74f5e3e27140119d7b6c6e6c37ef7d','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2017-07-24 01:04:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/role/','GET','',''),('3ec9ff89c9bb4fcb8f0dbde101830e4a','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:00:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('457ca1e7b7ef41d6ae14dd329731cda9','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 01:00:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('459f0a741a6d4889ac649a25a65c5cff','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:00:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('47a97a9a6ec4426893628e24690d5189','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:03:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('4a6406e2e2e7423dacd437f9491083a3','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2017-07-24 01:04:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('4af86928074e44d9bd7852fdf01fc3de','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:03:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('4c3aea5d516147239755153eefe9117b','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 01:04:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('50efba3a2c3a4330aaaf5470135cc5b5','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 00:59:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('543fae74f35e44de94d1d9c88f66f031','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-åŒºåŸŸç®¡ç†','1','2017-07-24 01:00:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/area/','GET','',''),('5507d97c15c44c3880bcfce1ab2902ae','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2017-07-24 00:59:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('568c4bcac8364a1f9d1e9d6f5f28f70d','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:00:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('5f21217383d540d691cf0921952a9d79','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:04:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('60600db9d25b46ad8cc642c09c07e4ef','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 00:59:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('60daa6a4723f4ad89e8884c6c2a0d0bc','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¿®æ”¹å¯†ç ','1','2017-07-24 00:59:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/modifyPwd','GET','',''),('6220d726ee3547169230ad6b87de32bd','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†','1','2017-07-24 00:59:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/cms/none','GET','',''),('6b304b75fb3c4189b88f25a1587c4b2b','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-ä¿®æ”¹','1','2017-07-24 01:00:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/delete','GET','id=79',''),('6c1d5dfda4384281acefe2343618ce08','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 00:59:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('6d1a0826fccf4f56a901beba6d942fad','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:03:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('717e3d0ef00f4ab89b060ee08fd22799','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:03:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('72783fbc991d441fa98087574bc5388e','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2017-07-24 01:02:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('761f51c3995d45a196682831c6e8b09e','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:03:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('7d56a6c6d8bb405c8dfbf8fdf7cfe787','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 01:00:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('7e2ad2fcdb634c9a931558a937639d80','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-åŒºåŸŸç®¡ç†','1','2017-07-24 01:04:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/area/','GET','',''),('7f48620c4a064004a382564dddae5fb6','1','ç³»ç»Ÿç™»å½•','1','2017-07-24 01:02:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a','GET','login=',''),('8020bc09653a4232a9e72f7e06ca44e3','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2017-07-24 00:59:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/role/','GET','',''),('827ba0ff665a436ba7c647a28208aa6b','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-ä¿®æ”¹','1','2017-07-24 01:00:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/delete','GET','id=31',''),('85e1479bdd3043349dc8901af0ce14a2','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†','1','2017-07-24 00:59:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/cms/tree','GET','',''),('85ff94b08449422dbdd656e5edeccc26','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2017-07-24 01:00:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('8696cedab87b495dafffa784b8327a56','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:03:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('92b08b2cb9a84d2cb095fe67ce992ec2','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:03:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('938929bb62814fecaa429bb5b66f6fe8','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2017-07-24 01:00:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('9435cb4bb8d043158aeb1ea27e02ab58','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:00:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('98e5df0f2fa1426192a62cf9b4995d01','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:04:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('9c4e0655edea4a74b4c33dc1ccb689ce','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:04:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('9ccfd94e0c4046baaf44b3b8e7811925','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:03:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('9e40e606d6b54d89862978725ff54906','1','åœ¨çº¿åŠžå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','1','2017-07-24 00:59:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/oa/oaNotify/self','GET','',''),('a14b6866e8194fca9e8ff5aad410ef1b','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-åŒºåŸŸç®¡ç†','1','2017-07-24 00:59:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/area/','GET','',''),('a7f00638455145fb874384dc58f10fca','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2017-07-24 01:00:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('b163de98a90e4d38b3ec1cee0d412494','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-ä¿®æ”¹','1','2017-07-24 01:00:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/delete','GET','id=62',''),('b547495047f94e6780aa88875bbf1cce','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2017-07-24 01:02:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('b57fffadf92747d3900e2798c468f39b','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:03:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('b5f1da8583d4455fadef56db2f0b1edd','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-å­—å…¸ç®¡ç†','1','2017-07-24 00:59:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/dict/','GET','',''),('b74c1010c5ed43628647deb3ea150c36','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:03:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('b81fc49ffb3e46f38e0cc6feab96cabf','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:03:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('cb167a2899ce4738a2a112ae7a615260','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2017-07-24 01:00:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('d015404b0f9b45b39738f5a9acff4ccc','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:00:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('d077a78a6fec4624b75ef1ed44c84497','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:04:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('d4afc0ffe45542e7ac35f692779a34f3','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-ä¿®æ”¹','1','2017-07-24 01:04:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/delete','GET','id=23',''),('d529a739f3b542d8bfe891b3266ff164','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-åŒºåŸŸç®¡ç†','1','2017-07-24 01:03:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/area/','GET','',''),('d641a3b65b074abd89bf41f4748ffa6e','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-åŒºåŸŸç®¡ç†','1','2017-07-24 01:04:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/area/','GET','',''),('e81045bd60b44ad881d177c6a7afa5c8','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 00:59:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('e88199ecb1c14258bd0fc36135e9af8e','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2017-07-24 01:00:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/user/index','GET','',''),('e8c6f80f69214790b1a376db51a763d2','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-å­—å…¸ç®¡ç†','1','2017-07-24 01:03:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/dict/','GET','',''),('e9e8ff9b747a436092f1a6cfa7f1d866','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:03:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('ea3a27a9b7574cbb82d4543c285b8905','1','ç³»ç»Ÿç™»å½•','1','2017-07-24 01:02:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a','GET','login=',''),('ec96d1e893d34eedb108a23097c012d8','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','1','2017-07-24 01:03:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/log','GET','',''),('edd983854c964ffe8697b0d056b682f3','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:04:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','',''),('ef320111f40f44f9aec71536ec7092c2','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-åŒºåŸŸç®¡ç†','1','2017-07-24 01:03:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/area/','GET','',''),('efea34de20964018b67d313877fcc09f','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','1','2017-07-24 01:03:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/log','GET','',''),('f0a058431cd6459fbd59e0e503a73281','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†-å†…å®¹å‘å¸ƒ','1','2017-07-24 00:59:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/cms/','GET','',''),('f0e791d6eba64eb9851eb5de2d6df75d','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:04:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/menu/form','GET','id=2',''),('f8d33d81e8ef4afc9b91e80678f484dd','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†-æŸ¥çœ‹','1','2017-07-24 01:04:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/list','GET','id=&parentIds=',''),('fc984a9b60204a75b03c3c98229ef1f1','1','ç³»ç»Ÿç™»å½•','1','2017-07-24 00:59:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a','GET','login=',''),('fe9342ef6e884dec8a1a7aee963fea23','1','ç³»ç»Ÿè®¾ç½®-æœºæž„ç”¨æˆ·-æœºæž„ç®¡ç†','1','2017-07-24 01:03:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','/jeesite/a/sys/office/','GET','','');

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æŽ’åº',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'æè¿°',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='å¤šçº§å­—å…¸è¡¨';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æŽ’åº',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'é“¾æŽ¥',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç›®æ ‡',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'å›¾æ ‡',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT 'æ˜¯å¦åœ¨èœå•ä¸­æ˜¾ç¤º',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'æƒé™æ ‡è¯†',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='èœå•è¡¨';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','åŠŸèƒ½èœå•','0',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','å­—å…¸ç®¡ç†','60','/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','æœºæž„ç”¨æˆ·','970',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','åŒºåŸŸç®¡ç†','50','/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','æœºæž„ç®¡ç†','40','/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','ç³»ç»Ÿè®¾ç½®','900',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','ç”¨æˆ·ç®¡ç†','30','/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','å…³äºŽå¸®åŠ©','990',NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('24','23','0,1,2,23','å®˜æ–¹é¦–é¡µ','30','http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','23','0,1,2,23','é¡¹ç›®æ”¯æŒ','50','http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','23','0,1,2,23','è®ºå›äº¤æµ','80','http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('27','1','0,1,','æˆ‘çš„é¢æ¿','100',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','ä¸ªäººä¿¡æ¯','30',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','ä¸ªäººä¿¡æ¯','30','/sys/user/info',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','ç³»ç»Ÿè®¾ç½®','980',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','ä¿®æ”¹å¯†ç ','40','/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','å†…å®¹ç®¡ç†','500',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('32','31','0,1,31,','æ ç›®è®¾ç½®','990',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('33','32','0,1,31,32','æ ç›®ç®¡ç†','30','/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('34','33','0,1,31,32,33,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('35','33','0,1,31,32,33,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('36','32','0,1,31,32','ç«™ç‚¹è®¾ç½®','40','/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('37','36','0,1,31,32,36,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('38','36','0,1,31,32,36,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('39','32','0,1,31,32','åˆ‡æ¢ç«™ç‚¹','50','/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','3','0,1,2,3,','èœå•ç®¡ç†','30','/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','å†…å®¹ç®¡ç†','500',NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('41','40','0,1,31,40,','å†…å®¹å‘å¸ƒ','30','/cms/',NULL,'briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('42','41','0,1,31,40,41,','æ–‡ç« æ¨¡åž‹','40','/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('43','42','0,1,31,40,41,42,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44','42','0,1,31,40,41,42,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','42','0,1,31,40,41,42,','å®¡æ ¸','50',NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('46','41','0,1,31,40,41,','é“¾æŽ¥æ¨¡åž‹','60','/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','46','0,1,31,40,41,46,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','46','0,1,31,40,41,46,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('49','46','0,1,31,40,41,46,','å®¡æ ¸','50',NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','4','0,1,2,3,4,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','è¯„è®ºç®¡ç†','40','/cms/comment/?status=2',NULL,'comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('51','50','0,1,31,40,50,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('52','50','0,1,31,40,50,','å®¡æ ¸','40',NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('53','40','0,1,31,40,','å…¬å…±ç•™è¨€','80','/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('54','53','0,1,31,40,53,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('55','53','0,1,31,40,53,','å®¡æ ¸','40',NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('56','71','0,1,27,71,','æ–‡ä»¶ç®¡ç†','90','/../static/ckfinder/ckfinder.html',NULL,'folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','56','0,1,27,40,56,','ä¸Šä¼ ','40',NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','56','0,1,27,40,56,','ä¿®æ”¹','50',NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','4','0,1,2,3,4,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','ç»Ÿè®¡åˆ†æž','600',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('61','60','0,1,31,60,','ä¿¡æ¯é‡ç»Ÿè®¡','30','/cms/stats/article',NULL,'tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('62','1','0,1,','åœ¨çº¿åŠžå…¬','200',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('63','62','0,1,62,','ä¸ªäººåŠžå…¬','30',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('64','63','0,1,62,63,','è¯·å‡åŠžç†','300','/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('65','64','0,1,62,63,64,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('66','64','0,1,62,63,64,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('67','2','0,1,2,','æ—¥å¿—æŸ¥è¯¢','985',NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','67','0,1,2,67,','æ—¥å¿—æŸ¥è¯¢','30','/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','62','0,1,62,','æµç¨‹ç®¡ç†','300',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('7','3','0,1,2,3,','è§’è‰²ç®¡ç†','50','/sys/role/',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','æµç¨‹ç®¡ç†','50','/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('71','27','0,1,27,','æ–‡ä»¶ç®¡ç†','90',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('72','69','0,1,62,69,','æ¨¡åž‹ç®¡ç†','100','/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'1'),('73','63','0,1,62,63,','æˆ‘çš„ä»»åŠ¡','50','/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'1'),('74','63','0,1,62,63,','å®¡æ‰¹æµ‹è¯•','100','/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'1'),('75','1','0,1,','åœ¨çº¿æ¼”ç¤º','3000',NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),('79','1','0,1,','ä»£ç ç”Ÿæˆ','5000',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('8','7','0,1,2,3,7,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','ä»£ç ç”Ÿæˆ','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('81','80','0,1,79,80,','ç”Ÿæˆæ–¹æ¡ˆé…ç½®','30','/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('82','80','0,1,79,80,','ä¸šåŠ¡è¡¨é…ç½®','20','/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('83','80','0,1,79,80,','ä»£ç æ¨¡æ¿ç®¡ç†','90','/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('84','67','0,1,2,67,','è¿žæŽ¥æ± ç›‘è§†','40','/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('85','76','0,1,75,76,','è¡Œæ”¿åŒºåŸŸ','80','/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),('86','75','0,1,75,','ç»„ä»¶æ¼”ç¤º','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('87','86','0,1,75,86,','ç»„ä»¶æ¼”ç¤º','30','/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('88','62','0,1,62,','é€šçŸ¥é€šå‘Š','20','','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('89','88','0,1,62,88,','æˆ‘çš„é€šå‘Š','30','/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('9','7','0,1,2,3,7,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','é€šå‘Šç®¡ç†','50','/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æŽ’åº',
  `area_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'å½’å±žåŒºåŸŸ',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT 'æœºæž„ç±»åž‹',
  `grade` char(1) COLLATE utf8_bin NOT NULL COMMENT 'æœºæž„ç­‰çº§',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'è”ç³»åœ°å€',
  `zip_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'é‚®æ”¿ç¼–ç ',
  `master` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'è´Ÿè´£äºº',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç”µè¯',
  `fax` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'ä¼ çœŸ',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'é‚®ç®±',
  `USEABLE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç”¨',
  `PRIMARY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'ä¸»è´Ÿè´£äºº',
  `DEPUTY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'å‰¯è´Ÿè´£äºº',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='æœºæž„è¡¨';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','æ€»å…¬å¸','10','2','100000','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'å½’å±žæœºæž„',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'è§’è‰²åç§°',
  `enname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'è‹±æ–‡åç§°',
  `role_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'è§’è‰²ç±»åž‹',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ•°æ®èŒƒå›´',
  `is_sys` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ˜¯å¦ç³»ç»Ÿæ•°æ®',
  `useable` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç”¨',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='è§’è‰²è¡¨';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','1','ç³»ç»Ÿç®¡ç†å‘˜','dept','assignment','1',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','æ™®é€šç”¨æˆ·','d','assignment','8',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `menu_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'èœå•ç¼–å·',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='è§’è‰²-èœå•';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values ('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','25'),('1','26'),('1','27'),('1','28'),('1','29'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','68'),('1','69'),('1','7'),('1','70'),('1','71'),('1','72'),('1','73'),('1','74'),('1','75'),('1','76'),('1','77'),('1','78'),('1','79'),('1','8'),('1','80'),('1','81'),('1','82'),('1','83'),('1','84'),('1','85'),('1','86'),('1','87'),('1','88'),('1','89'),('1','9'),('1','90'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','25'),('2','26'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','71'),('2','72'),('2','73'),('2','74'),('2','75'),('2','76'),('2','77'),('2','78'),('2','79'),('2','8'),('2','80'),('2','81'),('2','82'),('2','83'),('2','84'),('2','85'),('2','86'),('2','87'),('2','88'),('2','89'),('2','9'),('2','90'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','71'),('3','72'),('3','73'),('3','74'),('3','75'),('3','76'),('3','77'),('3','78'),('3','79'),('3','8'),('3','80'),('3','81'),('3','82'),('3','83'),('3','84'),('3','85'),('3','86'),('3','87'),('3','88'),('3','89'),('3','9'),('3','90');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æœºæž„ç¼–å·',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='è§’è‰²-æœºæž„';

/*Data for the table `sys_role_office` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `company_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'å½’å±žå…¬å¸',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'å½’å±žéƒ¨é—¨',
  `login_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'ç™»å½•å',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'å¯†ç ',
  `no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'å·¥å·',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'å§“å',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç”µè¯',
  `mobile` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ‰‹æœº',
  `user_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç”¨æˆ·ç±»åž‹',
  `photo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç”¨æˆ·å¤´åƒ',
  `login_ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'æœ€åŽç™»é™†IP',
  `login_date` datetime DEFAULT NULL COMMENT 'æœ€åŽç™»é™†æ—¶é—´',
  `login_flag` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç™»å½•',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='ç”¨æˆ·è¡¨';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','1','2','pmadmin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','ç³»ç»Ÿç®¡ç†å‘˜','thinkgem@163.com','8675','8675',NULL,NULL,'0:0:0:0:0:0:0:1','2017-07-24 01:04:22','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','æœ€é«˜ç®¡ç†å‘˜','0');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç”¨æˆ·ç¼–å·',
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='ç”¨æˆ·-è§’è‰²';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
