/*
MySQL Data Transfer
Source Host: localhost
Source Database: onlinedebug
Target Host: localhost
Target Database: onlinedebug
Date: 2009-7-25 14:14:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for fbrules
-- ----------------------------
CREATE TABLE `fbrules` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `category` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pmdrules
-- ----------------------------
CREATE TABLE `pmdrules` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `ruleSet` varchar(255) default NULL,
  `rulePath` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project
-- ----------------------------
CREATE TABLE `project` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `name` varchar(255) default NULL,
  `create_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `Project_FI_1` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rulesstat
-- ----------------------------
CREATE TABLE `rulesstat` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `category` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `tool` varchar(255) default NULL,
  `count` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `school` varchar(255) default NULL,
  `sex` int(11) default NULL,
  `email` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userconfig
-- ----------------------------
CREATE TABLE `userconfig` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `PMDConfig` varchar(255) default NULL,
  `FBConfig` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `UserConfig_FI_1` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `fbrules` VALUES ('1', 'AM_CREATES_EMPTY_JAR_FILE_ENTRY', 'Bad practice');
INSERT INTO `fbrules` VALUES ('2', 'AM_CREATES_EMPTY_ZIP_FILE_ENTRY', 'Bad practice');
INSERT INTO `fbrules` VALUES ('3', 'BC_EQUALS_METHOD_SHOULD_WORK_FOR_ALL_OBJECTS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('4', 'DMI_RANDOM_USED_ONLY_ONCE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('5', 'BIT_SIGNED_CHECK', 'Bad practice');
INSERT INTO `fbrules` VALUES ('6', 'CN_IDIOM', 'Bad practice');
INSERT INTO `fbrules` VALUES ('7', 'CN_IDIOM_NO_SUPER_CALL', 'Bad practice');
INSERT INTO `fbrules` VALUES ('8', 'CN_IMPLEMENTS_CLONE_BUT_NOT_CLONEABLE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('9', 'CO_ABSTRACT_SELF', 'Bad practice');
INSERT INTO `fbrules` VALUES ('10', 'CO_SELF_NO_OBJECT', 'Bad practice');
INSERT INTO `fbrules` VALUES ('11', 'DE_MIGHT_DROP', 'Bad practice');
INSERT INTO `fbrules` VALUES ('12', 'DE_MIGHT_IGNORE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('13', 'DMI_USING_REMOVEALL_TO_CLEAR_COLLECTION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('14', 'DP_CREATE_CLASSLOADER_INSIDE_DO_PRIVILEGED', 'Bad practice');
INSERT INTO `fbrules` VALUES ('15', 'DP_DO_INSIDE_DO_PRIVILEGED', 'Bad practice');
INSERT INTO `fbrules` VALUES ('16', 'DM_EXIT', 'Bad practice');
INSERT INTO `fbrules` VALUES ('17', 'DM_RUN_FINALIZERS_ON_EXIT', 'Bad practice');
INSERT INTO `fbrules` VALUES ('18', 'ES_COMPARING_PARAMETER_STRING_WITH_EQ', 'Bad practice');
INSERT INTO `fbrules` VALUES ('19', 'ES_COMPARING_STRINGS_WITH_EQ', 'Bad practice');
INSERT INTO `fbrules` VALUES ('20', 'EQ_ABSTRACT_SELF', 'Bad practice');
INSERT INTO `fbrules` VALUES ('21', 'EQ_CHECK_FOR_OPERAND_NOT_COMPATIBLE_WITH_THIS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('22', 'EQ_COMPARETO_USE_OBJECT_EQUALS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('23', 'EQ_GETCLASS_AND_CLASS_CONSTANT', 'Bad practice');
INSERT INTO `fbrules` VALUES ('24', 'EQ_SELF_NO_OBJECT', 'Bad practice');
INSERT INTO `fbrules` VALUES ('25', 'FI_EMPTY', 'Bad practice');
INSERT INTO `fbrules` VALUES ('26', 'FI_EXPLICIT_INVOCATION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('27', 'FI_FINALIZER_NULLS_FIELDS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('28', 'FI_FINALIZER_ONLY_NULLS_FIELDS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('29', 'FI_MISSING_SUPER_CALL', 'Bad practice');
INSERT INTO `fbrules` VALUES ('30', 'FI_NULLIFY_SUPER', 'Bad practice');
INSERT INTO `fbrules` VALUES ('31', 'FI_USELESS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('32', 'GC_UNCHECKED_TYPE_IN_GENERIC_CALL', 'Bad practice');
INSERT INTO `fbrules` VALUES ('33', 'HE_EQUALS_NO_HASHCODE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('34', 'HE_EQUALS_USE_HASHCODE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('35', 'HE_HASHCODE_NO_EQUALS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('36', 'HE_HASHCODE_USE_OBJECT_EQUALS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('37', 'HE_INHERITS_EQUALS_USE_HASHCODE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('38', 'IC_SUPERCLASS_USES_SUBCLASS_DURING_INITIALIZATION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('39', 'IMSE_DONT_CATCH_IMSE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('40', 'ISC_INSTANTIATE_STATIC_CLASS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('41', 'IT_NO_SUCH_ELEMENT', 'Bad practice');
INSERT INTO `fbrules` VALUES ('42', 'J2EE_STORE_OF_NON_SERIALIZABLE_OBJECT_INTO_SESSION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('43', 'JCIP_FIELD_ISNT_FINAL_IN_IMMUTABLE_CLASS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('44', 'NP_BOOLEAN_RETURN_NULL', 'Bad practice');
INSERT INTO `fbrules` VALUES ('45', 'NP_CLONE_COULD_RETURN_NULL', 'Bad practice');
INSERT INTO `fbrules` VALUES ('46', 'NP_EQUALS_SHOULD_HANDLE_NULL_ARGUMENT', 'Bad practice');
INSERT INTO `fbrules` VALUES ('47', 'NP_TOSTRING_COULD_RETURN_NULL', 'Bad practice');
INSERT INTO `fbrules` VALUES ('48', 'NM_CLASS_NAMING_CONVENTION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('49', 'NM_CLASS_NOT_EXCEPTION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('50', 'NM_CONFUSING', 'Bad practice');
INSERT INTO `fbrules` VALUES ('51', 'NM_FIELD_NAMING_CONVENTION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('52', 'NM_FUTURE_KEYWORD_USED_AS_IDENTIFIER', 'Bad practice');
INSERT INTO `fbrules` VALUES ('53', 'NM_FUTURE_KEYWORD_USED_AS_MEMBER_IDENTIFIER', 'Bad practice');
INSERT INTO `fbrules` VALUES ('54', 'NM_METHOD_NAMING_CONVENTION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('55', 'NM_SAME_SIMPLE_NAME_AS_INTERFACE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('56', 'NM_SAME_SIMPLE_NAME_AS_SUPERCLASS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('57', 'NM_VERY_CONFUSING_INTENTIONAL', 'Bad practice');
INSERT INTO `fbrules` VALUES ('58', 'NM_WRONG_PACKAGE_INTENTIONAL', 'Bad practice');
INSERT INTO `fbrules` VALUES ('59', 'ODR_OPEN_DATABASE_RESOURCE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('60', 'ODR_OPEN_DATABASE_RESOURCE_EXCEPTION_PATH', 'Bad practice');
INSERT INTO `fbrules` VALUES ('61', 'OS_OPEN_STREAM', 'Bad practice');
INSERT INTO `fbrules` VALUES ('62', 'OS_OPEN_STREAM_EXCEPTION_PATH', 'Bad practice');
INSERT INTO `fbrules` VALUES ('63', 'RC_REF_COMPARISON_BAD_PRACTICE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('64', 'RC_REF_COMPARISON_BAD_PRACTICE_BOOLEAN', 'Bad practice');
INSERT INTO `fbrules` VALUES ('65', 'RR_NOT_CHECKED', 'Bad practice');
INSERT INTO `fbrules` VALUES ('66', 'SR_NOT_CHECKED', 'Bad practice');
INSERT INTO `fbrules` VALUES ('67', 'RV_RETURN_VALUE_IGNORED_BAD_PRACTICE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('68', 'SI_INSTANCE_BEFORE_FINALS_ASSIGNED', 'Bad practice');
INSERT INTO `fbrules` VALUES ('69', 'SW_SWING_METHODS_INVOKED_IN_SWING_THREAD', 'Bad practice');
INSERT INTO `fbrules` VALUES ('70', 'SE_BAD_FIELD', 'Bad practice');
INSERT INTO `fbrules` VALUES ('71', 'SE_BAD_FIELD_INNER_CLASS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('72', 'SE_BAD_FIELD_STORE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('73', 'SE_COMPARATOR_SHOULD_BE_SERIALIZABLE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('74', 'SE_INNER_CLASS', 'Bad practice');
INSERT INTO `fbrules` VALUES ('75', 'SE_NONFINAL_SERIALVERSIONID', 'Bad practice');
INSERT INTO `fbrules` VALUES ('76', 'SE_NONLONG_SERIALVERSIONID', 'Bad practice');
INSERT INTO `fbrules` VALUES ('77', 'SE_NONSTATIC_SERIALVERSIONID', 'Bad practice');
INSERT INTO `fbrules` VALUES ('78', 'SE_NO_SUITABLE_CONSTRUCTOR', 'Bad practice');
INSERT INTO `fbrules` VALUES ('79', 'SE_NO_SUITABLE_CONSTRUCTOR_FOR_EXTERNALIZATION', 'Bad practice');
INSERT INTO `fbrules` VALUES ('80', 'SE_READ_RESOLVE_MUST_RETURN_OBJECT', 'Bad practice');
INSERT INTO `fbrules` VALUES ('81', 'SE_TRANSIENT_FIELD_NOT_RESTORED', 'Bad practice');
INSERT INTO `fbrules` VALUES ('82', 'SE_NO_SERIALVERSIONID', 'Bad practice');
INSERT INTO `fbrules` VALUES ('83', 'UI_INHERITANCE_UNSAFE_GETRESOURCE', 'Bad practice');
INSERT INTO `fbrules` VALUES ('84', 'BC_IMPOSSIBLE_CAST', 'Correctness');
INSERT INTO `fbrules` VALUES ('85', 'BC_IMPOSSIBLE_DOWNCAST', 'Correctness');
INSERT INTO `fbrules` VALUES ('86', 'BC_IMPOSSIBLE_DOWNCAST_OF_TOARRAY', 'Correctness');
INSERT INTO `fbrules` VALUES ('87', 'BC_IMPOSSIBLE_INSTANCEOF', 'Correctness');
INSERT INTO `fbrules` VALUES ('88', 'BIT_ADD_OF_SIGNED_BYTE', 'Correctness');
INSERT INTO `fbrules` VALUES ('89', 'BIT_AND', 'Correctness');
INSERT INTO `fbrules` VALUES ('90', 'BIT_AND_ZZ', 'Correctness');
INSERT INTO `fbrules` VALUES ('91', 'BIT_IOR', 'Correctness');
INSERT INTO `fbrules` VALUES ('92', 'BIT_IOR_OF_SIGNED_BYTE', 'Correctness');
INSERT INTO `fbrules` VALUES ('93', 'BIT_SIGNED_CHECK_HIGH_BIT', 'Correctness');
INSERT INTO `fbrules` VALUES ('94', 'BOA_BADLY_OVERRIDDEN_ADAPTER', 'Correctness');
INSERT INTO `fbrules` VALUES ('95', 'ICAST_BAD_SHIFT_AMOUNT', 'Correctness');
INSERT INTO `fbrules` VALUES ('96', 'BX_UNBOXED_AND_COERCED_FOR_TERNARY_OPERATOR', 'Correctness');
INSERT INTO `fbrules` VALUES ('97', 'DLS_DEAD_STORE_OF_CLASS_LITERAL', 'Correctness');
INSERT INTO `fbrules` VALUES ('98', 'DLS_OVERWRITTEN_INCREMENT', 'Correctness');
INSERT INTO `fbrules` VALUES ('99', 'DMI_BAD_MONTH', 'Correctness');
INSERT INTO `fbrules` VALUES ('100', 'DMI_CALLING_NEXT_FROM_HASNEXT', 'Correctness');
INSERT INTO `fbrules` VALUES ('101', 'DMI_COLLECTIONS_SHOULD_NOT_CONTAIN_THEMSELVES', 'Correctness');
INSERT INTO `fbrules` VALUES ('102', 'DMI_INVOKING_HASHCODE_ON_ARRAY', 'Correctness');
INSERT INTO `fbrules` VALUES ('103', 'DMI_LONG_BITS_TO_DOUBLE_INVOKED_ON_INT', 'Correctness');
INSERT INTO `fbrules` VALUES ('104', 'DMI_VACUOUS_SELF_COLLECTION_CALL', 'Correctness');
INSERT INTO `fbrules` VALUES ('105', 'DMI_ANNOTATION_IS_NOT_VISIBLE_TO_REFLECTION', 'Correctness');
INSERT INTO `fbrules` VALUES ('106', 'DMI_FUTILE_ATTEMPT_TO_CHANGE_MAXPOOL_SIZE_OF_SCHEDULED_THREAD_POOL_EXECUTOR', 'Correctness');
INSERT INTO `fbrules` VALUES ('107', 'DMI_SCHEDULED_THREAD_POOL_EXECUTOR_WITH_ZERO_CORE_THREADS', 'Correctness');
INSERT INTO `fbrules` VALUES ('108', 'DMI_VACUOUS_CALL_TO_EASYMOCK_METHOD', 'Correctness');
INSERT INTO `fbrules` VALUES ('109', 'EC_ARRAY_AND_NONARRAY', 'Correctness');
INSERT INTO `fbrules` VALUES ('110', 'EC_BAD_ARRAY_COMPARE', 'Correctness');
INSERT INTO `fbrules` VALUES ('111', 'EC_NULL_ARG', 'Correctness');
INSERT INTO `fbrules` VALUES ('112', 'EC_UNRELATED_CLASS_AND_INTERFACE', 'Correctness');
INSERT INTO `fbrules` VALUES ('113', 'EC_UNRELATED_INTERFACES', 'Correctness');
INSERT INTO `fbrules` VALUES ('114', 'EC_UNRELATED_TYPES', 'Correctness');
INSERT INTO `fbrules` VALUES ('115', 'EC_UNRELATED_TYPES_USING_POINTER_EQUALITY', 'Correctness');
INSERT INTO `fbrules` VALUES ('116', 'EQ_ALWAYS_FALSE', 'Correctness');
INSERT INTO `fbrules` VALUES ('117', 'EQ_ALWAYS_TRUE', 'Correctness');
INSERT INTO `fbrules` VALUES ('118', 'EQ_COMPARING_CLASS_NAMES', 'Correctness');
INSERT INTO `fbrules` VALUES ('119', 'EQ_DONT_DEFINE_EQUALS_FOR_ENUM', 'Correctness');
INSERT INTO `fbrules` VALUES ('120', 'EQ_OTHER_NO_OBJECT', 'Correctness');
INSERT INTO `fbrules` VALUES ('121', 'EQ_OTHER_USE_OBJECT', 'Correctness');
INSERT INTO `fbrules` VALUES ('122', 'EQ_OVERRIDING_EQUALS_NOT_SYMMETRIC', 'Correctness');
INSERT INTO `fbrules` VALUES ('123', 'EQ_SELF_USE_OBJECT', 'Correctness');
INSERT INTO `fbrules` VALUES ('124', 'FE_TEST_IF_EQUAL_TO_NOT_A_NUMBER', 'Correctness');
INSERT INTO `fbrules` VALUES ('125', 'VA_FORMAT_STRING_BAD_ARGUMENT', 'Correctness');
INSERT INTO `fbrules` VALUES ('126', 'VA_FORMAT_STRING_BAD_CONVERSION', 'Correctness');
INSERT INTO `fbrules` VALUES ('127', 'VA_FORMAT_STRING_EXPECTED_MESSAGE_FORMAT_SUPPLIED', 'Correctness');
INSERT INTO `fbrules` VALUES ('128', 'VA_FORMAT_STRING_EXTRA_ARGUMENTS_PASSED', 'Correctness');
INSERT INTO `fbrules` VALUES ('129', 'VA_FORMAT_STRING_ILLEGAL', 'Correctness');
INSERT INTO `fbrules` VALUES ('130', 'VA_FORMAT_STRING_MISSING_ARGUMENT', 'Correctness');
INSERT INTO `fbrules` VALUES ('131', 'VA_FORMAT_STRING_NO_PREVIOUS_ARGUMENT', 'Correctness');
INSERT INTO `fbrules` VALUES ('132', 'GC_UNRELATED_TYPES', 'Correctness');
INSERT INTO `fbrules` VALUES ('133', 'HE_SIGNATURE_DECLARES_HASHING_OF_UNHASHABLE_CLASS', 'Correctness');
INSERT INTO `fbrules` VALUES ('134', 'HE_USE_OF_UNHASHABLE_CLASS', 'Correctness');
INSERT INTO `fbrules` VALUES ('135', 'ICAST_INT_CAST_TO_DOUBLE_PASSED_TO_CEIL', 'Correctness');
INSERT INTO `fbrules` VALUES ('136', 'ICAST_INT_CAST_TO_FLOAT_PASSED_TO_ROUND', 'Correctness');
INSERT INTO `fbrules` VALUES ('137', 'IJU_ASSERT_METHOD_INVOKED_FROM_RUN_METHOD', 'Correctness');
INSERT INTO `fbrules` VALUES ('138', 'IJU_BAD_SUITE_METHOD', 'Correctness');
INSERT INTO `fbrules` VALUES ('139', 'IJU_NO_TESTS', 'Correctness');
INSERT INTO `fbrules` VALUES ('140', 'IJU_SETUP_NO_SUPER', 'Correctness');
INSERT INTO `fbrules` VALUES ('141', 'IJU_SUITE_NOT_STATIC', 'Correctness');
INSERT INTO `fbrules` VALUES ('142', 'IJU_TEARDOWN_NO_SUPER', 'Correctness');
INSERT INTO `fbrules` VALUES ('143', 'IL_CONTAINER_ADDED_TO_ITSELF', 'Correctness');
INSERT INTO `fbrules` VALUES ('144', 'IL_INFINITE_LOOP', 'Correctness');
INSERT INTO `fbrules` VALUES ('145', 'IL_INFINITE_RECURSIVE_LOOP', 'Correctness');
INSERT INTO `fbrules` VALUES ('146', 'IM_MULTIPLYING_RESULT_OF_IREM', 'Correctness');
INSERT INTO `fbrules` VALUES ('147', 'INT_BAD_COMPARISON_WITH_NONNEGATIVE_VALUE', 'Correctness');
INSERT INTO `fbrules` VALUES ('148', 'INT_BAD_COMPARISON_WITH_SIGNED_BYTE', 'Correctness');
INSERT INTO `fbrules` VALUES ('149', 'IO_APPENDING_TO_OBJECT_OUTPUT_STREAM', 'Correctness');
INSERT INTO `fbrules` VALUES ('150', 'IP_PARAMETER_IS_DEAD_BUT_OVERWRITTEN', 'Correctness');
INSERT INTO `fbrules` VALUES ('151', 'MF_CLASS_MASKS_FIELD', 'Correctness');
INSERT INTO `fbrules` VALUES ('152', 'MF_METHOD_MASKS_FIELD', 'Correctness');
INSERT INTO `fbrules` VALUES ('153', 'NP_ALWAYS_NULL', 'Correctness');
INSERT INTO `fbrules` VALUES ('154', 'NP_ALWAYS_NULL_EXCEPTION', 'Correctness');
INSERT INTO `fbrules` VALUES ('155', 'NP_ARGUMENT_MIGHT_BE_NULL', 'Correctness');
INSERT INTO `fbrules` VALUES ('156', 'NP_CLOSING_NULL', 'Correctness');
INSERT INTO `fbrules` VALUES ('157', 'NP_GUARANTEED_DEREF', 'Correctness');
INSERT INTO `fbrules` VALUES ('158', 'NP_GUARANTEED_DEREF_ON_EXCEPTION_PATH', 'Correctness');
INSERT INTO `fbrules` VALUES ('159', 'NP_NONNULL_PARAM_VIOLATION', 'Correctness');
INSERT INTO `fbrules` VALUES ('160', 'NP_NONNULL_RETURN_VIOLATION', 'Correctness');
INSERT INTO `fbrules` VALUES ('161', 'NP_NULL_INSTANCEOF', 'Correctness');
INSERT INTO `fbrules` VALUES ('162', 'NP_NULL_ON_SOME_PATH', 'Correctness');
INSERT INTO `fbrules` VALUES ('163', 'NP_NULL_ON_SOME_PATH_EXCEPTION', 'Correctness');
INSERT INTO `fbrules` VALUES ('164', 'NP_NULL_PARAM_DEREF', 'Correctness');
INSERT INTO `fbrules` VALUES ('165', 'NP_NULL_PARAM_DEREF_ALL_TARGETS_DANGEROUS', 'Correctness');
INSERT INTO `fbrules` VALUES ('166', 'NP_NULL_PARAM_DEREF_NONVIRTUAL', 'Correctness');
INSERT INTO `fbrules` VALUES ('167', 'NP_STORE_INTO_NONNULL_FIELD', 'Correctness');
INSERT INTO `fbrules` VALUES ('168', 'NP_UNWRITTEN_FIELD', 'Correctness');
INSERT INTO `fbrules` VALUES ('169', 'NM_BAD_EQUAL', 'Correctness');
INSERT INTO `fbrules` VALUES ('170', 'NM_LCASE_HASHCODE', 'Correctness');
INSERT INTO `fbrules` VALUES ('171', 'NM_LCASE_TOSTRING', 'Correctness');
INSERT INTO `fbrules` VALUES ('172', 'NM_METHOD_CONSTRUCTOR_CONFUSION', 'Correctness');
INSERT INTO `fbrules` VALUES ('173', 'NM_VERY_CONFUSING', 'Correctness');
INSERT INTO `fbrules` VALUES ('174', 'NM_WRONG_PACKAGE', 'Correctness');
INSERT INTO `fbrules` VALUES ('175', 'QBA_QUESTIONABLE_BOOLEAN_ASSIGNMENT', 'Correctness');
INSERT INTO `fbrules` VALUES ('176', 'RC_REF_COMPARISON', 'Correctness');
INSERT INTO `fbrules` VALUES ('177', 'RCN_REDUNDANT_NULLCHECK_WOULD_HAVE_BEEN_A_NPE', 'Correctness');
INSERT INTO `fbrules` VALUES ('178', 'RE_BAD_SYNTAX_FOR_REGULAR_EXPRESSION', 'Correctness');
INSERT INTO `fbrules` VALUES ('179', 'RE_CANT_USE_FILE_SEPARATOR_AS_REGULAR_EXPRESSION', 'Correctness');
INSERT INTO `fbrules` VALUES ('180', 'RE_POSSIBLE_UNINTENDED_PATTERN', 'Correctness');
INSERT INTO `fbrules` VALUES ('181', 'RV_01_TO_INT', 'Correctness');
INSERT INTO `fbrules` VALUES ('182', 'RV_ABSOLUTE_VALUE_OF_HASHCODE', 'Correctness');
INSERT INTO `fbrules` VALUES ('183', 'RV_ABSOLUTE_VALUE_OF_RANDOM_INT', 'Correctness');
INSERT INTO `fbrules` VALUES ('184', 'RV_EXCEPTION_NOT_THROWN', 'Correctness');
INSERT INTO `fbrules` VALUES ('185', 'RV_RETURN_VALUE_IGNORED', 'Correctness');
INSERT INTO `fbrules` VALUES ('186', 'RpC_REPEATED_CONDITIONAL_TEST', 'Correctness');
INSERT INTO `fbrules` VALUES ('187', 'SA_FIELD_DOUBLE_ASSIGNMENT', 'Correctness');
INSERT INTO `fbrules` VALUES ('188', 'SA_FIELD_SELF_ASSIGNMENT', 'Correctness');
INSERT INTO `fbrules` VALUES ('189', 'SA_FIELD_SELF_COMPARISON', 'Correctness');
INSERT INTO `fbrules` VALUES ('190', 'SA_FIELD_SELF_COMPUTATION', 'Correctness');
INSERT INTO `fbrules` VALUES ('191', 'SA_LOCAL_SELF_COMPARISON', 'Correctness');
INSERT INTO `fbrules` VALUES ('192', 'SA_LOCAL_SELF_COMPUTATION', 'Correctness');
INSERT INTO `fbrules` VALUES ('193', 'SF_DEAD_STORE_DUE_TO_SWITCH_FALLTHROUGH', 'Correctness');
INSERT INTO `fbrules` VALUES ('194', 'SF_DEAD_STORE_DUE_TO_SWITCH_FALLTHROUGH_TO_THROW', 'Correctness');
INSERT INTO `fbrules` VALUES ('195', 'SIC_THREADLOCAL_DEADLY_EMBRACE', 'Correctness');
INSERT INTO `fbrules` VALUES ('196', 'SIO_SUPERFLUOUS_INSTANCEOF', 'Correctness');
INSERT INTO `fbrules` VALUES ('197', 'SQL_BAD_PREPARED_STATEMENT_ACCESS', 'Correctness');
INSERT INTO `fbrules` VALUES ('198', 'SQL_BAD_RESULTSET_ACCESS', 'Correctness');
INSERT INTO `fbrules` VALUES ('199', 'STI_INTERRUPTED_ON_CURRENTTHREAD', 'Correctness');
INSERT INTO `fbrules` VALUES ('200', 'STI_INTERRUPTED_ON_UNKNOWNTHREAD', 'Correctness');
INSERT INTO `fbrules` VALUES ('201', 'SE_METHOD_MUST_BE_PRIVATE', 'Correctness');
INSERT INTO `fbrules` VALUES ('202', 'SE_READ_RESOLVE_IS_STATIC', 'Correctness');
INSERT INTO `fbrules` VALUES ('203', 'TQ_ALWAYS_VALUE_USED_WHERE_NEVER_REQUIRED', 'Correctness');
INSERT INTO `fbrules` VALUES ('204', 'TQ_MAYBE_SOURCE_VALUE_REACHES_ALWAYS_SINK', 'Correctness');
INSERT INTO `fbrules` VALUES ('205', 'TQ_MAYBE_SOURCE_VALUE_REACHES_NEVER_SINK', 'Correctness');
INSERT INTO `fbrules` VALUES ('206', 'TQ_NEVER_VALUE_USED_WHERE_ALWAYS_REQUIRED', 'Correctness');
INSERT INTO `fbrules` VALUES ('207', 'UMAC_UNCALLABLE_METHOD_OF_ANONYMOUS_CLASS', 'Correctness');
INSERT INTO `fbrules` VALUES ('208', 'UR_UNINIT_READ', 'Correctness');
INSERT INTO `fbrules` VALUES ('209', 'UR_UNINIT_READ_CALLED_FROM_SUPER_CONSTRUCTOR', 'Correctness');
INSERT INTO `fbrules` VALUES ('210', 'DMI_INVOKING_TOSTRING_ON_ANONYMOUS_ARRAY', 'Correctness');
INSERT INTO `fbrules` VALUES ('211', 'DMI_INVOKING_TOSTRING_ON_ARRAY', 'Correctness');
INSERT INTO `fbrules` VALUES ('212', 'VA_FORMAT_STRING_BAD_CONVERSION_FROM_ARRAY', 'Correctness');
INSERT INTO `fbrules` VALUES ('213', 'UWF_NULL_FIELD', 'Correctness');
INSERT INTO `fbrules` VALUES ('214', 'UWF_UNWRITTEN_FIELD', 'Correctness');
INSERT INTO `fbrules` VALUES ('215', 'VA_PRIMITIVE_ARRAY_PASSED_TO_OBJECT_VARARG', 'Correctness');
INSERT INTO `fbrules` VALUES ('216', 'LG_LOST_LOGGER_DUE_TO_WEAK_REFERENCE', 'Experimental');
INSERT INTO `fbrules` VALUES ('217', 'OBL_UNSATISFIED_OBLIGATION', 'Experimental');
INSERT INTO `fbrules` VALUES ('218', 'DM_CONVERT_CASE', 'Internationalization');
INSERT INTO `fbrules` VALUES ('219', 'EI_EXPOSE_REP', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('220', 'EI_EXPOSE_REP2', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('221', 'FI_PUBLIC_SHOULD_BE_PROTECTED', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('222', 'EI_EXPOSE_STATIC_REP2', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('223', 'MS_CANNOT_BE_FINAL', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('224', 'MS_EXPOSE_REP', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('225', 'MS_FINAL_PKGPROTECT', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('226', 'MS_MUTABLE_ARRAY', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('227', 'MS_MUTABLE_HASHTABLE', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('228', 'MS_OOI_PKGPROTECT', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('229', 'MS_PKGPROTECT', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('230', 'MS_SHOULD_BE_FINAL', 'Malicious code vulnerability');
INSERT INTO `fbrules` VALUES ('231', 'DC_DOUBLECHECK', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('232', 'DL_SYNCHRONIZATION_ON_BOOLEAN', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('233', 'DL_SYNCHRONIZATION_ON_BOXED_PRIMITIVE', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('234', 'DL_SYNCHRONIZATION_ON_SHARED_CONSTANT', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('235', 'DL_SYNCHRONIZATION_ON_UNSHARED_BOXED_PRIMITIVE', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('236', 'DM_MONITOR_WAIT_ON_CONDITION', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('237', 'DM_USELESS_THREAD', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('238', 'ESync_EMPTY_SYNC', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('239', 'IS2_INCONSISTENT_SYNC', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('240', 'IS_FIELD_NOT_GUARDED', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('241', 'JLM_JSR166_LOCK_MONITORENTER', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('242', 'LI_LAZY_INIT_STATIC', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('243', 'LI_LAZY_INIT_UPDATE_STATIC', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('244', 'ML_SYNC_ON_FIELD_TO_GUARD_CHANGING_THAT_FIELD', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('245', 'ML_SYNC_ON_UPDATED_FIELD', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('246', 'MSF_MUTABLE_SERVLET_FIELD', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('247', 'MWN_MISMATCHED_NOTIFY', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('248', 'MWN_MISMATCHED_WAIT', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('249', 'NN_NAKED_NOTIFY', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('250', 'NP_SYNC_AND_NULL_CHECK_FIELD', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('251', 'NO_NOTIFY_NOT_NOTIFYALL', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('252', 'RS_READOBJECT_SYNC', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('253', 'RV_RETURN_VALUE_OF_PUTIFABSENT_IGNORED', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('254', 'RU_INVOKE_RUN', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('255', 'SC_START_IN_CTOR', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('256', 'SP_SPIN_ON_FIELD', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('257', 'STCAL_INVOKE_ON_STATIC_CALENDAR_INSTANCE', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('258', 'STCAL_INVOKE_ON_STATIC_DATE_FORMAT_INSTANCE', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('259', 'STCAL_STATIC_CALENDAR_INSTANCE', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('260', 'STCAL_STATIC_SIMPLE_DATE_FORMAT_INSTANCE', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('261', 'SWL_SLEEP_WITH_LOCK_HELD', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('262', 'TLW_TWO_LOCK_WAIT', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('263', 'UG_SYNC_SET_UNSYNC_GET', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('264', 'UL_UNRELEASED_LOCK', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('265', 'UL_UNRELEASED_LOCK_EXCEPTION_PATH', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('266', 'UW_UNCOND_WAIT', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('267', 'VO_VOLATILE_REFERENCE_TO_ARRAY', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('268', 'WL_USING_GETCLASS_RATHER_THAN_CLASS_LITERAL', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('269', 'WS_WRITEOBJECT_SYNC', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('270', 'WA_AWAIT_NOT_IN_LOOP', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('271', 'WA_NOT_IN_LOOP', 'Multithreaded correctness');
INSERT INTO `fbrules` VALUES ('272', 'BX_BOXING_IMMEDIATELY_UNBOXED', 'Performance');
INSERT INTO `fbrules` VALUES ('273', 'BX_BOXING_IMMEDIATELY_UNBOXED_TO_PERFORM_COERCION', 'Performance');
INSERT INTO `fbrules` VALUES ('274', 'DM_BOXED_PRIMITIVE_TOSTRING', 'Performance');
INSERT INTO `fbrules` VALUES ('275', 'DM_FP_NUMBER_CTOR', 'Performance');
INSERT INTO `fbrules` VALUES ('276', 'DM_NUMBER_CTOR', 'Performance');
INSERT INTO `fbrules` VALUES ('277', 'DMI_BLOCKING_METHODS_ON_URL', 'Performance');
INSERT INTO `fbrules` VALUES ('278', 'DMI_COLLECTION_OF_URLS', 'Performance');
INSERT INTO `fbrules` VALUES ('279', 'DM_BOOLEAN_CTOR', 'Performance');
INSERT INTO `fbrules` VALUES ('280', 'DM_GC', 'Performance');
INSERT INTO `fbrules` VALUES ('281', 'DM_NEW_FOR_GETCLASS', 'Performance');
INSERT INTO `fbrules` VALUES ('282', 'DM_NEXTINT_VIA_NEXTDOUBLE', 'Performance');
INSERT INTO `fbrules` VALUES ('283', 'DM_STRING_CTOR', 'Performance');
INSERT INTO `fbrules` VALUES ('284', 'DM_STRING_TOSTRING', 'Performance');
INSERT INTO `fbrules` VALUES ('285', 'DM_STRING_VOID_CTOR', 'Performance');
INSERT INTO `fbrules` VALUES ('286', 'HSC_HUGE_SHARED_STRING_CONSTANT', 'Performance');
INSERT INTO `fbrules` VALUES ('287', 'ITA_INEFFICIENT_TO_ARRAY', 'Performance');
INSERT INTO `fbrules` VALUES ('288', 'SBSC_USE_STRINGBUFFER_CONCATENATION', 'Performance');
INSERT INTO `fbrules` VALUES ('289', 'SIC_INNER_SHOULD_BE_STATIC', 'Performance');
INSERT INTO `fbrules` VALUES ('290', 'SIC_INNER_SHOULD_BE_STATIC_ANON', 'Performance');
INSERT INTO `fbrules` VALUES ('291', 'SIC_INNER_SHOULD_BE_STATIC_NEEDS_THIS', 'Performance');
INSERT INTO `fbrules` VALUES ('292', 'SS_SHOULD_BE_STATIC', 'Performance');
INSERT INTO `fbrules` VALUES ('293', 'UM_UNNECESSARY_MATH', 'Performance');
INSERT INTO `fbrules` VALUES ('294', 'UPM_UNCALLED_PRIVATE_METHOD', 'Performance');
INSERT INTO `fbrules` VALUES ('295', 'URF_UNREAD_FIELD', 'Performance');
INSERT INTO `fbrules` VALUES ('296', 'UUF_UNUSED_FIELD', 'Performance');
INSERT INTO `fbrules` VALUES ('297', 'WMI_WRONG_MAP_ITERATOR', 'Performance');
INSERT INTO `fbrules` VALUES ('298', 'DMI_CONSTANT_DB_PASSWORD', 'Security');
INSERT INTO `fbrules` VALUES ('299', 'DMI_EMPTY_DB_PASSWORD', 'Security');
INSERT INTO `fbrules` VALUES ('300', 'HRS_REQUEST_PARAMETER_TO_COOKIE', 'Security');
INSERT INTO `fbrules` VALUES ('301', 'HRS_REQUEST_PARAMETER_TO_HTTP_HEADER', 'Security');
INSERT INTO `fbrules` VALUES ('302', 'SQL_NONCONSTANT_STRING_PASSED_TO_EXECUTE', 'Security');
INSERT INTO `fbrules` VALUES ('303', 'SQL_PREPARED_STATEMENT_GENERATED_FROM_NONCONSTANT_STRING', 'Security');
INSERT INTO `fbrules` VALUES ('304', 'XSS_REQUEST_PARAMETER_TO_JSP_WRITER', 'Security');
INSERT INTO `fbrules` VALUES ('305', 'XSS_REQUEST_PARAMETER_TO_SEND_ERROR', 'Security');
INSERT INTO `fbrules` VALUES ('306', 'XSS_REQUEST_PARAMETER_TO_SERVLET_WRITER', 'Security');
INSERT INTO `fbrules` VALUES ('307', 'BC_BAD_CAST_TO_ABSTRACT_COLLECTION', 'Dodgy');
INSERT INTO `fbrules` VALUES ('308', 'BC_BAD_CAST_TO_CONCRETE_COLLECTION', 'Dodgy');
INSERT INTO `fbrules` VALUES ('309', 'BC_UNCONFIRMED_CAST', 'Dodgy');
INSERT INTO `fbrules` VALUES ('310', 'BC_VACUOUS_INSTANCEOF', 'Dodgy');
INSERT INTO `fbrules` VALUES ('311', 'ICAST_QUESTIONABLE_UNSIGNED_RIGHT_SHIFT', 'Dodgy');
INSERT INTO `fbrules` VALUES ('312', 'CI_CONFUSED_INHERITANCE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('313', 'DB_DUPLICATE_BRANCHES', 'Dodgy');
INSERT INTO `fbrules` VALUES ('314', 'DB_DUPLICATE_SWITCH_CLAUSES', 'Dodgy');
INSERT INTO `fbrules` VALUES ('315', 'DLS_DEAD_LOCAL_STORE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('316', 'DLS_DEAD_LOCAL_STORE_IN_RETURN', 'Dodgy');
INSERT INTO `fbrules` VALUES ('317', 'DLS_DEAD_LOCAL_STORE_OF_NULL', 'Dodgy');
INSERT INTO `fbrules` VALUES ('318', 'DMI_HARDCODED_ABSOLUTE_FILENAME', 'Dodgy');
INSERT INTO `fbrules` VALUES ('319', 'DMI_NONSERIALIZABLE_OBJECT_WRITTEN', 'Dodgy');
INSERT INTO `fbrules` VALUES ('320', 'DMI_USELESS_SUBSTRING', 'Dodgy');
INSERT INTO `fbrules` VALUES ('321', 'DMI_THREAD_PASSED_WHERE_RUNNABLE_EXPECTED', 'Dodgy');
INSERT INTO `fbrules` VALUES ('322', 'EQ_DOESNT_OVERRIDE_EQUALS', 'Dodgy');
INSERT INTO `fbrules` VALUES ('323', 'EQ_UNUSUAL', 'Dodgy');
INSERT INTO `fbrules` VALUES ('324', 'FE_FLOATING_POINT_EQUALITY', 'Dodgy');
INSERT INTO `fbrules` VALUES ('325', 'VA_FORMAT_STRING_BAD_CONVERSION_TO_BOOLEAN', 'Dodgy');
INSERT INTO `fbrules` VALUES ('326', 'IA_AMBIGUOUS_INVOCATION_OF_INHERITED_OR_OUTER_METHOD', 'Dodgy');
INSERT INTO `fbrules` VALUES ('327', 'IC_INIT_CIRCULARITY', 'Dodgy');
INSERT INTO `fbrules` VALUES ('328', 'ICAST_IDIV_CAST_TO_DOUBLE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('329', 'ICAST_INTEGER_MULTIPLY_CAST_TO_LONG', 'Dodgy');
INSERT INTO `fbrules` VALUES ('330', 'IM_AVERAGE_COMPUTATION_COULD_OVERFLOW', 'Dodgy');
INSERT INTO `fbrules` VALUES ('331', 'IM_BAD_CHECK_FOR_ODD', 'Dodgy');
INSERT INTO `fbrules` VALUES ('332', 'INT_BAD_REM_BY_1', 'Dodgy');
INSERT INTO `fbrules` VALUES ('333', 'INT_VACUOUS_COMPARISON', 'Dodgy');
INSERT INTO `fbrules` VALUES ('334', 'MTIA_SUSPECT_SERVLET_INSTANCE_FIELD', 'Dodgy');
INSERT INTO `fbrules` VALUES ('335', 'MTIA_SUSPECT_STRUTS_INSTANCE_FIELD', 'Dodgy');
INSERT INTO `fbrules` VALUES ('336', 'NP_DEREFERENCE_OF_READLINE_VALUE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('337', 'NP_IMMEDIATE_DEREFERENCE_OF_READLINE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('338', 'NP_LOAD_OF_KNOWN_NULL_VALUE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('339', 'NP_NULL_ON_SOME_PATH_FROM_RETURN_VALUE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('340', 'NP_NULL_ON_SOME_PATH_MIGHT_BE_INFEASIBLE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('341', 'NP_PARAMETER_MUST_BE_NONNULL_BUT_MARKED_AS_NULLABLE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('342', 'NS_DANGEROUS_NON_SHORT_CIRCUIT', 'Dodgy');
INSERT INTO `fbrules` VALUES ('343', 'NS_NON_SHORT_CIRCUIT', 'Dodgy');
INSERT INTO `fbrules` VALUES ('344', 'PZLA_PREFER_ZERO_LENGTH_ARRAYS', 'Dodgy');
INSERT INTO `fbrules` VALUES ('345', 'QF_QUESTIONABLE_FOR_LOOP', 'Dodgy');
INSERT INTO `fbrules` VALUES ('346', 'RCN_REDUNDANT_COMPARISON_OF_NULL_AND_NONNULL_VALUE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('347', 'RCN_REDUNDANT_COMPARISON_TWO_NULL_VALUES', 'Dodgy');
INSERT INTO `fbrules` VALUES ('348', 'RCN_REDUNDANT_NULLCHECK_OF_NONNULL_VALUE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('349', 'RCN_REDUNDANT_NULLCHECK_OF_NULL_VALUE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('350', 'REC_CATCH_EXCEPTION', 'Dodgy');
INSERT INTO `fbrules` VALUES ('351', 'RI_REDUNDANT_INTERFACES', 'Dodgy');
INSERT INTO `fbrules` VALUES ('352', 'RV_CHECK_FOR_POSITIVE_INDEXOF', 'Dodgy');
INSERT INTO `fbrules` VALUES ('353', 'RV_DONT_JUST_NULL_CHECK_READLINE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('354', 'RV_REM_OF_HASHCODE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('355', 'RV_REM_OF_RANDOM_INT', 'Dodgy');
INSERT INTO `fbrules` VALUES ('356', 'SA_LOCAL_DOUBLE_ASSIGNMENT', 'Dodgy');
INSERT INTO `fbrules` VALUES ('357', 'SA_LOCAL_SELF_ASSIGNMENT', 'Dodgy');
INSERT INTO `fbrules` VALUES ('358', 'SF_SWITCH_FALLTHROUGH', 'Dodgy');
INSERT INTO `fbrules` VALUES ('359', 'SF_SWITCH_NO_DEFAULT', 'Dodgy');
INSERT INTO `fbrules` VALUES ('360', 'ST_WRITE_TO_STATIC_FROM_INSTANCE_METHOD', 'Dodgy');
INSERT INTO `fbrules` VALUES ('361', 'SE_PRIVATE_READ_RESOLVE_NOT_INHERITED', 'Dodgy');
INSERT INTO `fbrules` VALUES ('362', 'SE_TRANSIENT_FIELD_OF_NONSERIALIZABLE_CLASS', 'Dodgy');
INSERT INTO `fbrules` VALUES ('363', 'TQ_EXPLICIT_UNKNOWN_SOURCE_VALUE_REACHES_ALWAYS_SINK', 'Dodgy');
INSERT INTO `fbrules` VALUES ('364', 'TQ_EXPLICIT_UNKNOWN_SOURCE_VALUE_REACHES_NEVER_SINK', 'Dodgy');
INSERT INTO `fbrules` VALUES ('365', 'UCF_USELESS_CONTROL_FLOW', 'Dodgy');
INSERT INTO `fbrules` VALUES ('366', 'UCF_USELESS_CONTROL_FLOW_NEXT_LINE', 'Dodgy');
INSERT INTO `fbrules` VALUES ('367', 'UWF_FIELD_NOT_INITIALIZED_IN_CONSTRUCTOR', 'Dodgy');
INSERT INTO `fbrules` VALUES ('368', 'XFB_XML_FACTORY_BYPASS', 'Dodgy');
INSERT INTO `pmdrules` VALUES ('1', 'CallSuperFirst', 'Android Rules', 'android.xml');
INSERT INTO `pmdrules` VALUES ('2', 'CallSuperLast', 'Android Rules', 'android.xml');
INSERT INTO `pmdrules` VALUES ('3', 'ProtectLogD', 'Android Rules', 'android.xml');
INSERT INTO `pmdrules` VALUES ('4', 'ProtectLogV', 'Android Rules', 'android.xml');
INSERT INTO `pmdrules` VALUES ('5', 'DontNestJsfInJstlIteration', 'Basic JSF rules', 'basic-jsf.xml');
INSERT INTO `pmdrules` VALUES ('6', 'NoLongScripts', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('7', 'NoScriptlets', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('8', 'NoInlineStyleInformation', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('9', 'NoClassAttribute', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('10', 'NoJspForward', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('11', 'IframeMissingSrcAttribute', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('12', 'NoHtmlComments', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('13', 'DuplicateJspImports', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('14', 'JspEncoding', 'Basic JSP rules', 'basic-jsp.xml');
INSERT INTO `pmdrules` VALUES ('15', 'EmptyCatchBlock', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('16', 'EmptyIfStmt', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('17', 'EmptyWhileStmt', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('18', 'EmptyTryBlock', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('19', 'EmptyFinallyBlock', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('20', 'EmptySwitchStatements', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('21', 'JumbledIncrementer', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('22', 'ForLoopShouldBeWhileLoop', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('23', 'UnnecessaryConversionTemporary', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('24', 'OverrideBothEqualsAndHashcode', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('25', 'DoubleCheckedLocking', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('26', 'ReturnFromFinallyBlock', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('27', 'EmptySynchronizedBlock', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('28', 'UnnecessaryReturn', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('29', 'EmptyStaticInitializer', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('30', 'UnconditionalIfStatement', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('31', 'EmptyStatementNotInLoop', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('32', 'BooleanInstantiation', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('33', 'UnnecessaryFinalModifier', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('34', 'CollapsibleIfStatements', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('35', 'UselessOverridingMethod', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('36', 'ClassCastExceptionWithToArray', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('37', 'AvoidDecimalLiteralsInBigDecimalConstructor', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('38', 'UselessOperationOnImmutable', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('39', 'MisplacedNullCheck', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('40', 'UnusedNullCheckInEquals', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('41', 'AvoidThreadGroup', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('42', 'BrokenNullCheck', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('43', 'BigIntegerInstantiation', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('44', 'AvoidUsingOctalValues', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('45', 'AvoidUsingHardCodedIP', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('46', 'CheckResultSet', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('47', 'AvoidMultipleUnaryOperators', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('48', 'EmptyInitializer', 'Basic Rules', 'basic.xml');
INSERT INTO `pmdrules` VALUES ('49', 'IfStmtsMustUseBraces', 'Braces Rules', 'braces.xml');
INSERT INTO `pmdrules` VALUES ('50', 'WhileLoopsMustUseBraces', 'Braces Rules', 'braces.xml');
INSERT INTO `pmdrules` VALUES ('51', 'IfElseStmtsMustUseBraces', 'Braces Rules', 'braces.xml');
INSERT INTO `pmdrules` VALUES ('52', 'ForLoopsMustUseBraces', 'Braces Rules', 'braces.xml');
INSERT INTO `pmdrules` VALUES ('53', 'ProperCloneImplementation', 'Clone Implementation Rules', 'clone.xml');
INSERT INTO `pmdrules` VALUES ('54', 'CloneThrowsCloneNotSupportedException', 'Clone Implementation Rules', 'clone.xml');
INSERT INTO `pmdrules` VALUES ('55', 'CloneMethodMustImplementCloneable', 'Clone Implementation Rules', 'clone.xml');
INSERT INTO `pmdrules` VALUES ('56', 'NPathComplexity', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('57', 'ExcessiveMethodLength', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('58', 'ExcessiveParameterList', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('59', 'ExcessiveClassLength', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('60', 'CyclomaticComplexity', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('61', 'ExcessivePublicCount', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('62', 'TooManyFields', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('63', 'NcssMethodCount', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('64', 'NcssTypeCount', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('65', 'NcssConstructorCount', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('66', 'TooManyMethods', 'Code Size Rules', 'codesize.xml');
INSERT INTO `pmdrules` VALUES ('67', 'UnnecessaryConstructor', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('68', 'NullAssignment', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('69', 'OnlyOneReturn', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('70', 'UnusedModifier', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('71', 'AssignmentInOperand', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('72', 'AtLeastOneConstructor', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('73', 'DontImportSun', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('74', 'SuspiciousOctalEscape', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('75', 'CallSuperInConstructor', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('76', 'UnnecessaryParentheses', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('77', 'DefaultPackage', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('78', 'BooleanInversion', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('79', 'DataflowAnomalyAnalysis', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('80', 'AvoidFinalLocalVariable', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('81', 'AvoidUsingShortType', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('82', 'AvoidUsingVolatile', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('83', 'AvoidUsingNativeCode', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('84', 'AvoidAccessibilityAlteration', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('85', 'DoNotCallGarbageCollectionExplicitly', 'Controversial Rules', 'controversial.xml');
INSERT INTO `pmdrules` VALUES ('86', 'CouplingBetweenObjects', 'Coupling Rules', 'coupling.xml');
INSERT INTO `pmdrules` VALUES ('87', 'ExcessiveImports', 'Coupling Rules', 'coupling.xml');
INSERT INTO `pmdrules` VALUES ('88', 'LooseCoupling', 'Coupling Rules', 'coupling.xml');
INSERT INTO `pmdrules` VALUES ('89', 'UseSingleton', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('90', 'SimplifyBooleanReturns', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('91', 'SimplifyBooleanExpressions', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('92', 'SwitchStmtsShouldHaveDefault', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('93', 'AvoidDeeplyNestedIfStmts', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('94', 'AvoidReassigningParameters', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('95', 'SwitchDensity', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('96', 'ConstructorCallsOverridableMethod', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('97', 'AccessorClassGeneration', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('98', 'FinalFieldCouldBeStatic', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('99', 'CloseResource', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('100', 'NonStaticInitializer', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('101', 'DefaultLabelNotLastInSwitchStmt', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('102', 'NonCaseLabelInSwitchStatement', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('103', 'OptimizableToArrayCall', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('104', 'BadComparison', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('105', 'EqualsNull', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('106', 'ConfusingTernary', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('107', 'InstantiationToGetClass', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('108', 'IdempotentOperations', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('109', 'SimpleDateFormatNeedsLocale', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('110', 'ImmutableField', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('111', 'UseLocaleWithCaseConversions', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('112', 'AvoidProtectedFieldInFinalClass', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('113', 'AssignmentToNonFinalStatic', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('114', 'MissingStaticMethodInNonInstantiatableClass', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('115', 'AvoidSynchronizedAtMethodLevel', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('116', 'MissingBreakInSwitch', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('117', 'UseNotifyAllInsteadOfNotify', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('118', 'AvoidInstanceofChecksInCatchClause', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('119', 'AbstractClassWithoutAbstractMethod', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('120', 'SimplifyConditional', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('121', 'CompareObjectsWithEquals', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('122', 'PositionLiteralsFirstInComparisons', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('123', 'UnnecessaryLocalBeforeReturn', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('124', 'NonThreadSafeSingleton', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('125', 'UncommentedEmptyMethod', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('126', 'UncommentedEmptyConstructor', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('127', 'AvoidConstantsInterface', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('128', 'UnsynchronizedStaticDateFormatter', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('129', 'PreserveStackTrace', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('130', 'UseCollectionIsEmpty', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('131', 'ClassWithOnlyPrivateConstructorsShouldBeFinal', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('132', 'EmptyMethodInAbstractClassShouldBeAbstract', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('133', 'SingularField', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('134', 'ReturnEmptyArrayRatherThanNull', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('135', 'AbstractClassWithoutAnyMethod', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('136', 'TooFewBranchesForASwitchStatement', 'Design Rules', 'design.xml');
INSERT INTO `pmdrules` VALUES ('137', 'EmptyFinalizer', 'Finalizer Rules', 'finalizers.xml');
INSERT INTO `pmdrules` VALUES ('138', 'FinalizeOnlyCallsSuperFinalize', 'Finalizer Rules', 'finalizers.xml');
INSERT INTO `pmdrules` VALUES ('139', 'FinalizeOverloaded', 'Finalizer Rules', 'finalizers.xml');
INSERT INTO `pmdrules` VALUES ('140', 'FinalizeDoesNotCallSuperFinalize', 'Finalizer Rules', 'finalizers.xml');
INSERT INTO `pmdrules` VALUES ('141', 'FinalizeShouldBeProtected', 'Finalizer Rules', 'finalizers.xml');
INSERT INTO `pmdrules` VALUES ('142', 'AvoidCallingFinalize', 'Finalizer Rules', 'finalizers.xml');
INSERT INTO `pmdrules` VALUES ('143', 'DuplicateImports', 'Import Statement Rules', 'imports.xml');
INSERT INTO `pmdrules` VALUES ('144', 'DontImportJavaLang', 'Import Statement Rules', 'imports.xml');
INSERT INTO `pmdrules` VALUES ('145', 'UnusedImports', 'Import Statement Rules', 'imports.xml');
INSERT INTO `pmdrules` VALUES ('146', 'ImportFromSamePackage', 'Import Statement Rules', 'imports.xml');
INSERT INTO `pmdrules` VALUES ('147', 'TooManyStaticImports', 'Import Statement Rules', 'imports.xml');
INSERT INTO `pmdrules` VALUES ('148', 'UseProperClassLoader', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('149', 'MDBAndSessionBeanNamingConvention', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('150', 'RemoteSessionInterfaceNamingConvention', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('151', 'LocalInterfaceSessionNamingConvention', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('152', 'LocalHomeNamingConvention', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('153', 'RemoteInterfaceNamingConvention', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('154', 'DoNotCallSystemExit', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('155', 'StaticEJBFieldShouldBeFinal', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('156', 'DoNotUseThreads', 'J2EE Rules', 'je22.xml');
INSERT INTO `pmdrules` VALUES ('157', 'BeanMembersShouldSerialize', 'JavaBean Rules', 'javaneans.xml');
INSERT INTO `pmdrules` VALUES ('158', 'MissingSerialVersionUID', 'JavaBean Rules', 'javaneans.xml');
INSERT INTO `pmdrules` VALUES ('159', 'JUnitStaticSuite', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('160', 'JUnitSpelling', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('161', 'JUnitAssertionsShouldIncludeMessage', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('162', 'JUnitTestsShouldIncludeAssert', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('163', 'TestClassWithoutTestCases', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('164', 'UnnecessaryBooleanAssertion', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('165', 'UseAssertEqualsInsteadOfAssertTrue', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('166', 'UseAssertSameInsteadOfAssertTrue', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('167', 'UseAssertNullInsteadOfAssertTrue', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('168', 'SimplifyBooleanAssertion', 'JUnit Rules', 'junit.xml');
INSERT INTO `pmdrules` VALUES ('169', 'UseCorrectExceptionLogging', 'Jakarta Commons Logging Rules', 'looging-jakarta-commons.xml');
INSERT INTO `pmdrules` VALUES ('170', 'ProperLogger', 'Jakarta Commons Logging Rules', 'looging-jakarta-commons.xml');
INSERT INTO `pmdrules` VALUES ('171', 'MoreThanOneLogger', 'Java Logging Rules', 'logging-java.xml');
INSERT INTO `pmdrules` VALUES ('172', 'LoggerIsNotStaticFinal', 'Java Logging Rules', 'logging-java.xml');
INSERT INTO `pmdrules` VALUES ('173', 'SystemPrintln', 'Java Logging Rules', 'logging-java.xml');
INSERT INTO `pmdrules` VALUES ('174', 'AvoidPrintStackTrace', 'Java Logging Rules', 'logging-java.xml');
INSERT INTO `pmdrules` VALUES ('175', 'ReplaceVectorWithList', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('176', 'ReplaceHashtableWithMap', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('177', 'ReplaceEnumerationWithIterator', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('178', 'AvoidEnumAsIdentifier', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('179', 'AvoidAssertAsIdentifier', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('180', 'IntegerInstantiation', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('181', 'ByteInstantiation', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('182', 'ShortInstantiation', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('183', 'LongInstantiation', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('184', 'JUnit4TestShouldUseBeforeAnnotation', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('185', 'JUnit4TestShouldUseAfterAnnotation', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('186', 'JUnit4TestShouldUseTestAnnotation', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('187', 'JUnit4SuitesShouldUseSuiteAnnotation', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('188', 'JUnitUseExpected', 'Migration Rules', 'migrating.xml');
INSERT INTO `pmdrules` VALUES ('189', 'ShortVariable', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('190', 'LongVariable', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('191', 'ShortMethodName', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('192', 'VariableNamingConventions', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('193', 'MethodNamingConventions', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('194', 'ClassNamingConventions', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('195', 'AbstractNaming', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('196', 'AvoidDollarSigns', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('197', 'MethodWithSameNameAsEnclosingClass', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('198', 'SuspiciousHashcodeMethodName', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('199', 'SuspiciousConstantFieldName', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('200', 'SuspiciousEqualsMethodName', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('201', 'AvoidFieldNameMatchingTypeName', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('202', 'AvoidFieldNameMatchingMethodName', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('203', 'NoPackage', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('204', 'PackageCase', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('205', 'MisleadingVariableName', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('206', 'BooleanGetMethodName', 'Naming Rules', 'naming.xml');
INSERT INTO `pmdrules` VALUES ('207', 'LocalVariableCouldBeFinal', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('208', 'MethodArgumentCouldBeFinal', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('209', 'AvoidInstantiatingObjectsInLoops', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('210', 'UseArrayListInsteadOfVector', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('211', 'SimplifyStartsWith', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('212', 'UseStringBufferForStringAppends', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('213', 'UseArraysAsList', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('214', 'AvoidArrayLoops', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('215', 'UnnecessaryWrapperObjectCreation', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('216', 'AddEmptyString', 'Optimization Rules', 'optimizations.xml');
INSERT INTO `pmdrules` VALUES ('217', 'AvoidCatchingThrowable', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('218', 'SignatureDeclareThrowsException', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('219', 'ExceptionAsFlowControl', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('220', 'AvoidCatchingNPE', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('221', 'AvoidThrowingRawExceptionTypes', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('222', 'AvoidThrowingNullPointerException', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('223', 'AvoidRethrowingException', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('224', 'DoNotExtendJavaLangError', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('225', 'DoNotThrowExceptionInFinally', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('226', 'AvoidThrowingNewInstanceOfSameException', 'Strict Exception Rules', 'scratchpad.xml');
INSERT INTO `pmdrules` VALUES ('227', 'AvoidDuplicateLiterals', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('228', 'StringInstantiation', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('229', 'StringToString', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('230', 'InefficientStringBuffering', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('231', 'UnnecessaryCaseChange', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('232', 'UseStringBufferLength', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('233', 'AppendCharacterWithChar', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('234', 'ConsecutiveLiteralAppends', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('235', 'UseIndexOfChar', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('236', 'InefficientEmptyStringCheck', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('237', 'InsufficientStringBufferDeclaration', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('238', 'UselessStringValueOf', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('239', 'StringBufferInstantiationWithChar', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('240', 'UseEqualsToCompareStrings', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('241', 'AvoidStringBufferField', 'String and StringBuffer Rules', 'strings.xml');
INSERT INTO `pmdrules` VALUES ('242', 'MethodReturnsInternalArray', 'Security Code Guidelines', 'sunsecure.xml');
INSERT INTO `pmdrules` VALUES ('243', 'ArrayIsStoredDirectly', 'Security Code Guidelines', 'sunsecure.xml');
INSERT INTO `pmdrules` VALUES ('244', 'LooseCoupling', 'Type Resolution Rules', 'typersolution.xml');
INSERT INTO `pmdrules` VALUES ('245', 'CloneMethodMustImplementCloneable', 'Type Resolution Rules', 'typersolution.xml');
INSERT INTO `pmdrules` VALUES ('246', 'UnusedImports', 'Type Resolution Rules', 'typersolution.xml');
INSERT INTO `pmdrules` VALUES ('247', 'SignatureDeclareThrowsException', 'Type Resolution Rules', 'typersolution.xml');
INSERT INTO `pmdrules` VALUES ('248', 'UnusedPrivateField', 'Unused Code Rules', 'unusedcode.xml');
INSERT INTO `pmdrules` VALUES ('249', 'UnusedLocalVariable', 'Unused Code Rules', 'unusedcode.xml');
INSERT INTO `pmdrules` VALUES ('250', 'UnusedPrivateMethod', 'Unused Code Rules', 'unusedcode.xml');
INSERT INTO `pmdrules` VALUES ('251', 'UnusedFormalParameter', 'Unused Code Rules', 'unusedcode.xml');
