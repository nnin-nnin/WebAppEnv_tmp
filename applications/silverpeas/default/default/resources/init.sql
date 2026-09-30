--
-- PostgreSQL database dump
--

\restrict tEVNcOTeG0eHduBl5KDkehJLEaGeU6imXl8jp43MOzDtCl5dWG0jw5bUsNvjbC5

-- Dumped from database version 15.19
-- Dumped by pg_dump version 15.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.qrtz_triggers DROP CONSTRAINT IF EXISTS qrtz_triggers_sched_name_job_name_job_group_fkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_simprop_triggers DROP CONSTRAINT IF EXISTS qrtz_simprop_triggers_sched_name_trigger_name_trigger_grou_fkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_simple_triggers DROP CONSTRAINT IF EXISTS qrtz_simple_triggers_sched_name_trigger_name_trigger_group_fkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_cron_triggers DROP CONSTRAINT IF EXISTS qrtz_cron_triggers_sched_name_trigger_name_trigger_group_fkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_blob_triggers DROP CONSTRAINT IF EXISTS qrtz_blob_triggers_sched_name_trigger_name_trigger_group_fkey;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_attachment DROP CONSTRAINT IF EXISTS fkce814959db1c14ee;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_workinguser DROP CONSTRAINT IF EXISTS fk_workflow_workinguser;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_userinfo DROP CONSTRAINT IF EXISTS fk_workflow_userinfo;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_question DROP CONSTRAINT IF EXISTS fk_workflow_question;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_lockinguser DROP CONSTRAINT IF EXISTS fk_workflow_lockinguser;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_interesteduser DROP CONSTRAINT IF EXISTS fk_workflow_interesteduser;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_historystep DROP CONSTRAINT IF EXISTS fk_workflow_historystep;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_activestate DROP CONSTRAINT IF EXISTS fk_workflow_activestate;
ALTER TABLE IF EXISTS ONLY public.sb_variables_value DROP CONSTRAINT IF EXISTS fk_variables_value;
ALTER TABLE IF EXISTS ONLY public.st_userrole_user_rel DROP CONSTRAINT IF EXISTS fk_userrole_user_rel_2;
ALTER TABLE IF EXISTS ONLY public.st_userrole_user_rel DROP CONSTRAINT IF EXISTS fk_userrole_user_rel_1;
ALTER TABLE IF EXISTS ONLY public.st_userrole_group_rel DROP CONSTRAINT IF EXISTS fk_userrole_group_rel_2;
ALTER TABLE IF EXISTS ONLY public.st_userrole_group_rel DROP CONSTRAINT IF EXISTS fk_userrole_group_rel_1;
ALTER TABLE IF EXISTS ONLY public.st_userrole DROP CONSTRAINT IF EXISTS fk_userrole_1;
ALTER TABLE IF EXISTS ONLY public.sc_formsonline_userrights DROP CONSTRAINT IF EXISTS fk_userrights;
ALTER TABLE IF EXISTS ONLY public.st_userfavoritespaces DROP CONSTRAINT IF EXISTS fk_userfavoritespaces_2;
ALTER TABLE IF EXISTS ONLY public.st_userfavoritespaces DROP CONSTRAINT IF EXISTS fk_userfavoritespaces_1;
ALTER TABLE IF EXISTS ONLY public.st_user DROP CONSTRAINT IF EXISTS fk_user_1;
ALTER TABLE IF EXISTS ONLY public.sc_community_membership DROP CONSTRAINT IF EXISTS fk_user;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_internal_sub DROP CONSTRAINT IF EXISTS fk_subscriber_mailinglist_id;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole_user_rel DROP CONSTRAINT IF EXISTS fk_spaceuserrole_user_rel_2;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole_user_rel DROP CONSTRAINT IF EXISTS fk_spaceuserrole_user_rel_1;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole_group_rel DROP CONSTRAINT IF EXISTS fk_spaceuserrole_group_rel_2;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole_group_rel DROP CONSTRAINT IF EXISTS fk_spaceuserrole_group_rel_1;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole DROP CONSTRAINT IF EXISTS fk_spaceuserrole_1;
ALTER TABLE IF EXISTS ONLY public.st_space DROP CONSTRAINT IF EXISTS fk_space_2;
ALTER TABLE IF EXISTS ONLY public.st_space DROP CONSTRAINT IF EXISTS fk_space_1;
ALTER TABLE IF EXISTS ONLY public.sc_formsonline_forminstvali DROP CONSTRAINT IF EXISTS fk_sc_formsonline_forminstances_id;
ALTER TABLE IF EXISTS ONLY public.sc_scheduleevent_response DROP CONSTRAINT IF EXISTS fk_response_scheduleeventid;
ALTER TABLE IF EXISTS ONLY public.sc_scheduleevent_response DROP CONSTRAINT IF EXISTS fk_response_optionid;
ALTER TABLE IF EXISTS ONLY public.sb_cal_recurrence_exception DROP CONSTRAINT IF EXISTS fk_recurrence_exception;
ALTER TABLE IF EXISTS ONLY public.sb_cal_recurrence_dayofweek DROP CONSTRAINT IF EXISTS fk_recurrence_dayofweek;
ALTER TABLE IF EXISTS ONLY public.pdcposition_pdcaxisvalue DROP CONSTRAINT IF EXISTS fk_pdcposition_pdcaxisvalue_pdcpositionid;
ALTER TABLE IF EXISTS ONLY public.pdcposition_pdcaxisvalue DROP CONSTRAINT IF EXISTS fk_pdcposition_pdcaxisvalue_pdcaxisvalueid;
ALTER TABLE IF EXISTS ONLY public.pdcclassification_pdcposition DROP CONSTRAINT IF EXISTS fk_pdcclassification_pdcposition_positionid_pdcclassificationid;
ALTER TABLE IF EXISTS ONLY public.pdcclassification_pdcposition DROP CONSTRAINT IF EXISTS fk_pdcclassification_pdcposition_positionid;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_user_rights DROP CONSTRAINT IF EXISTS fk_pdc_user_rights_2;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_user_rights DROP CONSTRAINT IF EXISTS fk_pdc_user_rights_1;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_group_rights DROP CONSTRAINT IF EXISTS fk_pdc_group_rights_2;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_group_rights DROP CONSTRAINT IF EXISTS fk_pdc_group_rights_1;
ALTER TABLE IF EXISTS ONLY public.sc_scheduleevent_options DROP CONSTRAINT IF EXISTS fk_options_eventid;
ALTER TABLE IF EXISTS ONLY public.sb_cal_occurrences DROP CONSTRAINT IF EXISTS fk_occurrence_event;
ALTER TABLE IF EXISTS ONLY public.sb_cal_occurrences DROP CONSTRAINT IF EXISTS fk_occurrence_component;
ALTER TABLE IF EXISTS ONLY public.st_notifpreference DROP CONSTRAINT IF EXISTS fk_notifpreference_2;
ALTER TABLE IF EXISTS ONLY public.st_notifpreference DROP CONSTRAINT IF EXISTS fk_notifpreference_1;
ALTER TABLE IF EXISTS ONLY public.st_notifdefaultaddress DROP CONSTRAINT IF EXISTS fk_notifdefaultaddress_1;
ALTER TABLE IF EXISTS ONLY public.st_notifaddress DROP CONSTRAINT IF EXISTS fk_notifaddress_2;
ALTER TABLE IF EXISTS ONLY public.st_notifaddress DROP CONSTRAINT IF EXISTS fk_notifaddress_1;
ALTER TABLE IF EXISTS ONLY public.sb_mylinks_linkcat DROP CONSTRAINT IF EXISTS fk_mylinks_link_id;
ALTER TABLE IF EXISTS ONLY public.sb_mylinks_linkcat DROP CONSTRAINT IF EXISTS fk_mylinks_cat_id;
ALTER TABLE IF EXISTS ONLY public.st_instance_data DROP CONSTRAINT IF EXISTS fk_instance_data_1;
ALTER TABLE IF EXISTS ONLY public.sc_formsonline_grouprights DROP CONSTRAINT IF EXISTS fk_grouprights;
ALTER TABLE IF EXISTS ONLY public.st_group_user_rel DROP CONSTRAINT IF EXISTS fk_group_user_rel_2;
ALTER TABLE IF EXISTS ONLY public.st_group_user_rel DROP CONSTRAINT IF EXISTS fk_group_user_rel_1;
ALTER TABLE IF EXISTS ONLY public.st_group DROP CONSTRAINT IF EXISTS fk_group_1;
ALTER TABLE IF EXISTS ONLY public.sc_community DROP CONSTRAINT IF EXISTS fk_group;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_textfield DROP CONSTRAINT IF EXISTS fk_formtemplate_textfield;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_templatefield DROP CONSTRAINT IF EXISTS fk_formtemplate_templatefield;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_record DROP CONSTRAINT IF EXISTS fk_formtemplate_record;
ALTER TABLE IF EXISTS ONLY public.sc_formsonline_forminstances DROP CONSTRAINT IF EXISTS fk_forminstance;
ALTER TABLE IF EXISTS ONLY public.sb_cal_event DROP CONSTRAINT IF EXISTS fk_event_recurrence;
ALTER TABLE IF EXISTS ONLY public.sb_cal_event DROP CONSTRAINT IF EXISTS fk_event_component;
ALTER TABLE IF EXISTS ONLY public.domainsp_group_user_rel DROP CONSTRAINT IF EXISTS fk_domainsp_group_user_rel_2;
ALTER TABLE IF EXISTS ONLY public.domainsp_group_user_rel DROP CONSTRAINT IF EXISTS fk_domainsp_group_user_rel_1;
ALTER TABLE IF EXISTS ONLY public.domainsp_group DROP CONSTRAINT IF EXISTS fk_domainsp_group_1;
ALTER TABLE IF EXISTS ONLY public.sb_cal_attendees DROP CONSTRAINT IF EXISTS fk_delegate;
ALTER TABLE IF EXISTS ONLY public.sc_scheduleevent_contributor DROP CONSTRAINT IF EXISTS fk_contributor_scheduleeventid;
ALTER TABLE IF EXISTS ONLY public.st_componentinstance DROP CONSTRAINT IF EXISTS fk_componentinstance_2;
ALTER TABLE IF EXISTS ONLY public.st_componentinstance DROP CONSTRAINT IF EXISTS fk_componentinstance_1;
ALTER TABLE IF EXISTS ONLY public.sc_community_membership DROP CONSTRAINT IF EXISTS fk_community;
ALTER TABLE IF EXISTS ONLY public.sb_cal_components DROP CONSTRAINT IF EXISTS fk_calendar;
ALTER TABLE IF EXISTS ONLY public.sb_cal_attendees DROP CONSTRAINT IF EXISTS fk_attendee_component;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_external_user DROP CONSTRAINT IF EXISTS fk9290f7c94b1a1b47;
ALTER TABLE IF EXISTS ONLY public.st_delayednotifusersetting DROP CONSTRAINT IF EXISTS const_st_dnus_fk_userid;
ALTER TABLE IF EXISTS ONLY public.st_delayednotification DROP CONSTRAINT IF EXISTS const_st_dn_fk_userid;
ALTER TABLE IF EXISTS ONLY public.st_delayednotification DROP CONSTRAINT IF EXISTS const_st_dn_fk_nrid;
DROP INDEX IF EXISTS public.whitepages_searchfieldsinstid;
DROP INDEX IF EXISTS public.whitepages_instid;
DROP INDEX IF EXISTS public.synonym_termvoca;
DROP INDEX IF EXISTS public.questionreply_userid;
DROP INDEX IF EXISTS public.questionreply_instanceid;
DROP INDEX IF EXISTS public.jargon_iduser;
DROP INDEX IF EXISTS public.index_sb_agenda_holidays;
DROP INDEX IF EXISTS public.ind_statistic_userid;
DROP INDEX IF EXISTS public.ind_statistic_resourceid;
DROP INDEX IF EXISTS public.ind_state_connectioncumul2;
DROP INDEX IF EXISTS public.ind_state_connectioncumul1;
DROP INDEX IF EXISTS public.ind_st_instance_modelused;
DROP INDEX IF EXISTS public.ind_sc_scheduleevent_response_1;
DROP INDEX IF EXISTS public.ind_sc_scheduleevent_contributor_2;
DROP INDEX IF EXISTS public.ind_sc_scheduleevent_contributor_1;
DROP INDEX IF EXISTS public.ind_path;
DROP INDEX IF EXISTS public.ind_order;
DROP INDEX IF EXISTS public.ind_contact_groupfather;
DROP INDEX IF EXISTS public.ind_classifieds_subscribes;
DROP INDEX IF EXISTS public.in_sb_tree_tree_1;
DROP INDEX IF EXISTS public.in_sb_pdc_utilization_2;
DROP INDEX IF EXISTS public.in_sb_pdc_utilization_1;
DROP INDEX IF EXISTS public.in_sb_pdc_axis_1;
DROP INDEX IF EXISTS public.in_publi_father;
DROP INDEX IF EXISTS public.in_notifsendedreceiver;
DROP INDEX IF EXISTS public.in_notifpreference_1;
DROP INDEX IF EXISTS public.in_notifaddress_1;
DROP INDEX IF EXISTS public.in_coordinates_leafid;
DROP INDEX IF EXISTS public.in_containermanager_links_dlb;
DROP INDEX IF EXISTS public.in_classifyengine_objectid;
DROP INDEX IF EXISTS public.in_classifyengine_axis9;
DROP INDEX IF EXISTS public.in_classifyengine_axis8;
DROP INDEX IF EXISTS public.in_classifyengine_axis7;
DROP INDEX IF EXISTS public.in_classifyengine_axis6;
DROP INDEX IF EXISTS public.in_classifyengine_axis5;
DROP INDEX IF EXISTS public.in_classifyengine_axis49;
DROP INDEX IF EXISTS public.in_classifyengine_axis48;
DROP INDEX IF EXISTS public.in_classifyengine_axis47;
DROP INDEX IF EXISTS public.in_classifyengine_axis46;
DROP INDEX IF EXISTS public.in_classifyengine_axis45;
DROP INDEX IF EXISTS public.in_classifyengine_axis44;
DROP INDEX IF EXISTS public.in_classifyengine_axis43;
DROP INDEX IF EXISTS public.in_classifyengine_axis42;
DROP INDEX IF EXISTS public.in_classifyengine_axis41;
DROP INDEX IF EXISTS public.in_classifyengine_axis40;
DROP INDEX IF EXISTS public.in_classifyengine_axis4;
DROP INDEX IF EXISTS public.in_classifyengine_axis39;
DROP INDEX IF EXISTS public.in_classifyengine_axis38;
DROP INDEX IF EXISTS public.in_classifyengine_axis37;
DROP INDEX IF EXISTS public.in_classifyengine_axis36;
DROP INDEX IF EXISTS public.in_classifyengine_axis35;
DROP INDEX IF EXISTS public.in_classifyengine_axis34;
DROP INDEX IF EXISTS public.in_classifyengine_axis33;
DROP INDEX IF EXISTS public.in_classifyengine_axis32;
DROP INDEX IF EXISTS public.in_classifyengine_axis31;
DROP INDEX IF EXISTS public.in_classifyengine_axis30;
DROP INDEX IF EXISTS public.in_classifyengine_axis3;
DROP INDEX IF EXISTS public.in_classifyengine_axis29;
DROP INDEX IF EXISTS public.in_classifyengine_axis28;
DROP INDEX IF EXISTS public.in_classifyengine_axis27;
DROP INDEX IF EXISTS public.in_classifyengine_axis26;
DROP INDEX IF EXISTS public.in_classifyengine_axis25;
DROP INDEX IF EXISTS public.in_classifyengine_axis24;
DROP INDEX IF EXISTS public.in_classifyengine_axis23;
DROP INDEX IF EXISTS public.in_classifyengine_axis22;
DROP INDEX IF EXISTS public.in_classifyengine_axis21;
DROP INDEX IF EXISTS public.in_classifyengine_axis20;
DROP INDEX IF EXISTS public.in_classifyengine_axis2;
DROP INDEX IF EXISTS public.in_classifyengine_axis19;
DROP INDEX IF EXISTS public.in_classifyengine_axis18;
DROP INDEX IF EXISTS public.in_classifyengine_axis17;
DROP INDEX IF EXISTS public.in_classifyengine_axis16;
DROP INDEX IF EXISTS public.in_classifyengine_axis15;
DROP INDEX IF EXISTS public.in_classifyengine_axis14;
DROP INDEX IF EXISTS public.in_classifyengine_axis13;
DROP INDEX IF EXISTS public.in_classifyengine_axis12;
DROP INDEX IF EXISTS public.in_classifyengine_axis11;
DROP INDEX IF EXISTS public.in_classifyengine_axis10;
DROP INDEX IF EXISTS public.in_classifyengine_axis1;
DROP INDEX IF EXISTS public.in_classifyengine_axis0;
DROP INDEX IF EXISTS public.idx_uc_st_token;
DROP INDEX IF EXISTS public.idx_uc_st_quota;
DROP INDEX IF EXISTS public.idx_suggestion_box;
DROP INDEX IF EXISTS public.idx_suggestion;
DROP INDEX IF EXISTS public.idx_substitute;
DROP INDEX IF EXISTS public.idx_st_nr_resourceid;
DROP INDEX IF EXISTS public.idx_st_dnus_userid;
DROP INDEX IF EXISTS public.idx_st_dnus_uc;
DROP INDEX IF EXISTS public.idx_st_dnus_channel;
DROP INDEX IF EXISTS public.idx_st_dn_userid;
DROP INDEX IF EXISTS public.idx_st_dn_channel;
DROP INDEX IF EXISTS public.idx_sb_formtemplate_textfield;
DROP INDEX IF EXISTS public.idx_sb_contribution_tracking_contribution;
DROP INDEX IF EXISTS public.idx_reminder_user;
DROP INDEX IF EXISTS public.idx_reminder_contrib_user;
DROP INDEX IF EXISTS public.idx_reminder_contrib;
DROP INDEX IF EXISTS public.idx_qrtz_t_state;
DROP INDEX IF EXISTS public.idx_qrtz_t_nft_st_misfire_grp;
DROP INDEX IF EXISTS public.idx_qrtz_t_nft_st_misfire;
DROP INDEX IF EXISTS public.idx_qrtz_t_nft_st;
DROP INDEX IF EXISTS public.idx_qrtz_t_nft_misfire;
DROP INDEX IF EXISTS public.idx_qrtz_t_next_fire_time;
DROP INDEX IF EXISTS public.idx_qrtz_t_n_state;
DROP INDEX IF EXISTS public.idx_qrtz_t_n_g_state;
DROP INDEX IF EXISTS public.idx_qrtz_t_jg;
DROP INDEX IF EXISTS public.idx_qrtz_t_j;
DROP INDEX IF EXISTS public.idx_qrtz_t_g;
DROP INDEX IF EXISTS public.idx_qrtz_t_c;
DROP INDEX IF EXISTS public.idx_qrtz_j_req_recovery;
DROP INDEX IF EXISTS public.idx_qrtz_j_grp;
DROP INDEX IF EXISTS public.idx_qrtz_ft_trig_inst_name;
DROP INDEX IF EXISTS public.idx_qrtz_ft_tg;
DROP INDEX IF EXISTS public.idx_qrtz_ft_t_g;
DROP INDEX IF EXISTS public.idx_qrtz_ft_jg;
DROP INDEX IF EXISTS public.idx_qrtz_ft_j_g;
DROP INDEX IF EXISTS public.idx_qrtz_ft_inst_job_req_rcvry;
DROP INDEX IF EXISTS public.idx_pdcclassification_instanceid;
DROP INDEX IF EXISTS public.idx_pdcclassification_contentid;
DROP INDEX IF EXISTS public.idx_news;
DROP INDEX IF EXISTS public.idx_incumbent;
DROP INDEX IF EXISTS public.idx_datereminder;
DROP INDEX IF EXISTS public.idx_community_space;
DROP INDEX IF EXISTS public.idx_community_membership;
DROP INDEX IF EXISTS public.idx_community_component;
ALTER TABLE IF EXISTS ONLY public.sb_contentmanager_content DROP CONSTRAINT IF EXISTS uqe_contentmanager_content;
ALTER TABLE IF EXISTS ONLY public.st_userrole DROP CONSTRAINT IF EXISTS un_userrole_1;
ALTER TABLE IF EXISTS ONLY public.st_user DROP CONSTRAINT IF EXISTS un_user_2;
ALTER TABLE IF EXISTS ONLY public.st_user DROP CONSTRAINT IF EXISTS un_user_1;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole DROP CONSTRAINT IF EXISTS un_spaceuserrole_1;
ALTER TABLE IF EXISTS ONLY public.st_space DROP CONSTRAINT IF EXISTS un_space_1;
ALTER TABLE IF EXISTS ONLY public.sb_notation_notation DROP CONSTRAINT IF EXISTS un_sb_notation_notation;
ALTER TABLE IF EXISTS ONLY public.sb_node_nodei18n DROP CONSTRAINT IF EXISTS un_node_nodei18n;
ALTER TABLE IF EXISTS ONLY public.st_instance_data DROP CONSTRAINT IF EXISTS un_instance_data_1;
ALTER TABLE IF EXISTS ONLY public.st_group DROP CONSTRAINT IF EXISTS un_group_2;
ALTER TABLE IF EXISTS ONLY public.st_group DROP CONSTRAINT IF EXISTS un_group_1;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_templatefield DROP CONSTRAINT IF EXISTS un_formtemplate_templatefield;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_template DROP CONSTRAINT IF EXISTS un_formtemplate_template;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_record DROP CONSTRAINT IF EXISTS un_formtemplate_record;
ALTER TABLE IF EXISTS ONLY public.domainsp_user DROP CONSTRAINT IF EXISTS un_domainsp_user_1;
ALTER TABLE IF EXISTS ONLY public.domainsp_group DROP CONSTRAINT IF EXISTS un_domainsp_group_1;
ALTER TABLE IF EXISTS ONLY public.st_componentinstance DROP CONSTRAINT IF EXISTS un_componentinstance_1;
ALTER TABLE IF EXISTS ONLY public.sc_community DROP CONSTRAINT IF EXISTS un_community;
ALTER TABLE IF EXISTS ONLY public.st_accesslevel DROP CONSTRAINT IF EXISTS un_accesslevel_1;
ALTER TABLE IF EXISTS ONLY public.sc_suggestion DROP CONSTRAINT IF EXISTS sc_suggestion_pkey;
ALTER TABLE IF EXISTS ONLY public.sc_suggestion_box DROP CONSTRAINT IF EXISTS sc_suggestion_box_pkey;
ALTER TABLE IF EXISTS ONLY public.sc_quickinfo_news DROP CONSTRAINT IF EXISTS sc_quickinfo_news_pkey;
ALTER TABLE IF EXISTS ONLY public.sc_community DROP CONSTRAINT IF EXISTS sc_community_pkey;
ALTER TABLE IF EXISTS ONLY public.sc_community_membership DROP CONSTRAINT IF EXISTS sc_community_membership_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_triggers DROP CONSTRAINT IF EXISTS qrtz_triggers_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_simprop_triggers DROP CONSTRAINT IF EXISTS qrtz_simprop_triggers_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_simple_triggers DROP CONSTRAINT IF EXISTS qrtz_simple_triggers_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_scheduler_state DROP CONSTRAINT IF EXISTS qrtz_scheduler_state_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_paused_trigger_grps DROP CONSTRAINT IF EXISTS qrtz_paused_trigger_grps_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_locks DROP CONSTRAINT IF EXISTS qrtz_locks_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_job_details DROP CONSTRAINT IF EXISTS qrtz_job_details_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_fired_triggers DROP CONSTRAINT IF EXISTS qrtz_fired_triggers_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_cron_triggers DROP CONSTRAINT IF EXISTS qrtz_cron_triggers_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_calendars DROP CONSTRAINT IF EXISTS qrtz_calendars_pkey;
ALTER TABLE IF EXISTS ONLY public.qrtz_blob_triggers DROP CONSTRAINT IF EXISTS qrtz_blob_triggers_pkey;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_workinguser DROP CONSTRAINT IF EXISTS pk_workflow_workinguser;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_usersettings DROP CONSTRAINT IF EXISTS pk_workflow_usersettings;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_userinfo DROP CONSTRAINT IF EXISTS pk_workflow_userinfo;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_undo_step DROP CONSTRAINT IF EXISTS pk_workflow_undo_step;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_question DROP CONSTRAINT IF EXISTS pk_workflow_question;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_processinstance DROP CONSTRAINT IF EXISTS pk_workflow_processinstance;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_lockinguser DROP CONSTRAINT IF EXISTS pk_workflow_lockinguser;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_interesteduser DROP CONSTRAINT IF EXISTS pk_workflow_interesteduser;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_historystep DROP CONSTRAINT IF EXISTS pk_workflow_historystep;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_error DROP CONSTRAINT IF EXISTS pk_workflow_error;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_activestate DROP CONSTRAINT IF EXISTS pk_workflow_activestate;
ALTER TABLE IF EXISTS ONLY public.sc_whitepages_searchfields DROP CONSTRAINT IF EXISTS pk_whitepages_searchfields;
ALTER TABLE IF EXISTS ONLY public.sc_whitepages_card DROP CONSTRAINT IF EXISTS pk_whitepages_card;
ALTER TABLE IF EXISTS ONLY public.sb_variables_variable DROP CONSTRAINT IF EXISTS pk_variables_variable;
ALTER TABLE IF EXISTS ONLY public.sb_variables_value DROP CONSTRAINT IF EXISTS pk_variables_value;
ALTER TABLE IF EXISTS ONLY public.st_userrole_user_rel DROP CONSTRAINT IF EXISTS pk_userrole_user_rel;
ALTER TABLE IF EXISTS ONLY public.st_userrole_group_rel DROP CONSTRAINT IF EXISTS pk_userrole_group_rel;
ALTER TABLE IF EXISTS ONLY public.st_userrole DROP CONSTRAINT IF EXISTS pk_userrole;
ALTER TABLE IF EXISTS ONLY public.st_userfavoritespaces DROP CONSTRAINT IF EXISTS pk_userfavoritespaces;
ALTER TABLE IF EXISTS ONLY public.st_user DROP CONSTRAINT IF EXISTS pk_user;
ALTER TABLE IF EXISTS ONLY public.uniqueid DROP CONSTRAINT IF EXISTS pk_uniqueid;
ALTER TABLE IF EXISTS ONLY public.sb_tree_treei18n DROP CONSTRAINT IF EXISTS pk_tree_treei18n;
ALTER TABLE IF EXISTS ONLY public.sb_tree_tree DROP CONSTRAINT IF EXISTS pk_tree_tree;
ALTER TABLE IF EXISTS ONLY public.sb_thumbnail_thumbnail DROP CONSTRAINT IF EXISTS pk_thumbnail_thumbnail;
ALTER TABLE IF EXISTS ONLY public.sb_thesaurus_vocabulary DROP CONSTRAINT IF EXISTS pk_thesaurus_vocabulary;
ALTER TABLE IF EXISTS ONLY public.sb_thesaurus_synonym DROP CONSTRAINT IF EXISTS pk_thesaurus_synonym;
ALTER TABLE IF EXISTS ONLY public.sb_thesaurus_jargon DROP CONSTRAINT IF EXISTS pk_thesaurus_jargon;
ALTER TABLE IF EXISTS ONLY public.st_notifdefaultaddress DROP CONSTRAINT IF EXISTS pk_st_notifdefaultaddress;
ALTER TABLE IF EXISTS ONLY public.st_longtext DROP CONSTRAINT IF EXISTS pk_st_longtext;
ALTER TABLE IF EXISTS ONLY public.st_instance_modelused DROP CONSTRAINT IF EXISTS pk_st_instance_modelused;
ALTER TABLE IF EXISTS ONLY public.st_formeditor_formedited DROP CONSTRAINT IF EXISTS pk_st_formeditor_formedited;
ALTER TABLE IF EXISTS ONLY public.st_formeditor_formediteddata DROP CONSTRAINT IF EXISTS pk_st_formeditor_fed;
ALTER TABLE IF EXISTS ONLY public.st_formdesigner_formdesign DROP CONSTRAINT IF EXISTS pk_st_formdesigner_formdesign;
ALTER TABLE IF EXISTS ONLY public.st_formdesigner_connectors DROP CONSTRAINT IF EXISTS pk_st_formdesigner_connectors;
ALTER TABLE IF EXISTS ONLY public.st_domain DROP CONSTRAINT IF EXISTS pk_st_domain;
ALTER TABLE IF EXISTS ONLY public.sr_packages DROP CONSTRAINT IF EXISTS pk_sr_packages;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole_user_rel DROP CONSTRAINT IF EXISTS pk_spaceuserrole_user_rel;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole_group_rel DROP CONSTRAINT IF EXISTS pk_spaceuserrole_group_rel;
ALTER TABLE IF EXISTS ONLY public.st_spaceuserrole DROP CONSTRAINT IF EXISTS pk_spaceuserrole;
ALTER TABLE IF EXISTS ONLY public.st_space DROP CONSTRAINT IF EXISTS pk_space;
ALTER TABLE IF EXISTS ONLY public.sb_seealso_link DROP CONSTRAINT IF EXISTS pk_seealso_link;
ALTER TABLE IF EXISTS ONLY public.sc_scheduleevent_response DROP CONSTRAINT IF EXISTS pk_scheduleevent_response;
ALTER TABLE IF EXISTS ONLY public.sc_scheduleevent_options DROP CONSTRAINT IF EXISTS pk_scheduleevent_options;
ALTER TABLE IF EXISTS ONLY public.sc_scheduleevent_list DROP CONSTRAINT IF EXISTS pk_scheduleevent_list;
ALTER TABLE IF EXISTS ONLY public.sc_scheduleevent_contributor DROP CONSTRAINT IF EXISTS pk_scheduleevent_contrib;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_video DROP CONSTRAINT IF EXISTS pk_sc_gallery_video;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_streaming DROP CONSTRAINT IF EXISTS pk_sc_gallery_streaming;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_sound DROP CONSTRAINT IF EXISTS pk_sc_gallery_sound;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_photo DROP CONSTRAINT IF EXISTS pk_sc_gallery_photo;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_path DROP CONSTRAINT IF EXISTS pk_sc_gallery_path;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_orderdetail DROP CONSTRAINT IF EXISTS pk_sc_gallery_orderdetail;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_order DROP CONSTRAINT IF EXISTS pk_sc_gallery_order;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_media DROP CONSTRAINT IF EXISTS pk_sc_gallery_media;
ALTER TABLE IF EXISTS ONLY public.sc_gallery_internal DROP CONSTRAINT IF EXISTS pk_sc_gallery_internal;
ALTER TABLE IF EXISTS ONLY public.sc_formsonline_forms DROP CONSTRAINT IF EXISTS pk_sc_formsonline_forms;
ALTER TABLE IF EXISTS ONLY public.sc_formsonline_forminstvali DROP CONSTRAINT IF EXISTS pk_sc_formsonline_forminstvali;
ALTER TABLE IF EXISTS ONLY public.sc_formsonline_forminstances DROP CONSTRAINT IF EXISTS pk_sc_formsonline_forminstances;
ALTER TABLE IF EXISTS ONLY public.sc_contact_groupfather DROP CONSTRAINT IF EXISTS pk_sc_contact_groupfather;
ALTER TABLE IF EXISTS ONLY public.sc_classifieds_subscribes DROP CONSTRAINT IF EXISTS pk_sc_classifieds_subscribes;
ALTER TABLE IF EXISTS ONLY public.sc_classifieds_classifieds DROP CONSTRAINT IF EXISTS pk_sc_classifieds_classifieds;
ALTER TABLE IF EXISTS ONLY public.sb_webconnections_info DROP CONSTRAINT IF EXISTS pk_sb_webconnections_info;
ALTER TABLE IF EXISTS ONLY public.sb_tagcloud_tagcloud DROP CONSTRAINT IF EXISTS pk_sb_tagcloud_tagcloud;
ALTER TABLE IF EXISTS ONLY public.sb_sn_typerelationship DROP CONSTRAINT IF EXISTS pk_sb_sn_typerelationship;
ALTER TABLE IF EXISTS ONLY public.sb_sn_status DROP CONSTRAINT IF EXISTS pk_sb_sn_status;
ALTER TABLE IF EXISTS ONLY public.sb_sn_relationship DROP CONSTRAINT IF EXISTS pk_sb_sn_relationship;
ALTER TABLE IF EXISTS ONLY public.sb_sn_invitation DROP CONSTRAINT IF EXISTS pk_sb_sn_invitation;
ALTER TABLE IF EXISTS ONLY public.sb_notation_notation DROP CONSTRAINT IF EXISTS pk_sb_notation_notation;
ALTER TABLE IF EXISTS ONLY public.sb_mylinks_link DROP CONSTRAINT IF EXISTS pk_sb_mylink_link;
ALTER TABLE IF EXISTS ONLY public.sb_mylinks_cat DROP CONSTRAINT IF EXISTS pk_sb_mylink_cat;
ALTER TABLE IF EXISTS ONLY public.sb_filesharing_ticket DROP CONSTRAINT IF EXISTS pk_sb_filesharing_ticket;
ALTER TABLE IF EXISTS ONLY public.sb_filesharing_history DROP CONSTRAINT IF EXISTS pk_sb_filesharing_history;
ALTER TABLE IF EXISTS ONLY public.sb_agenda_import_settings DROP CONSTRAINT IF EXISTS pk_sb_agenda_import_settings_set;
ALTER TABLE IF EXISTS ONLY public.sb_agenda_holidays DROP CONSTRAINT IF EXISTS pk_sb_agenda_holidays;
ALTER TABLE IF EXISTS ONLY public.sc_rss_channels DROP CONSTRAINT IF EXISTS pk_rss_channels;
ALTER TABLE IF EXISTS ONLY public.sc_resources_resource DROP CONSTRAINT IF EXISTS pk_resources_resource;
ALTER TABLE IF EXISTS ONLY public.sc_resources_reservedresource DROP CONSTRAINT IF EXISTS pk_resources_reservedresource;
ALTER TABLE IF EXISTS ONLY public.sc_resources_reservation DROP CONSTRAINT IF EXISTS pk_resources_reservation;
ALTER TABLE IF EXISTS ONLY public.sc_resources_managers DROP CONSTRAINT IF EXISTS pk_resources_managers;
ALTER TABLE IF EXISTS ONLY public.sc_resources_category DROP CONSTRAINT IF EXISTS pk_resources_category;
ALTER TABLE IF EXISTS ONLY public.sb_workflow_replacements DROP CONSTRAINT IF EXISTS pk_replacement;
ALTER TABLE IF EXISTS ONLY public.sb_reminder DROP CONSTRAINT IF EXISTS pk_reminder;
ALTER TABLE IF EXISTS ONLY public.sb_cal_recurrence DROP CONSTRAINT IF EXISTS pk_recurrence;
ALTER TABLE IF EXISTS ONLY public.readingcontrol DROP CONSTRAINT IF EXISTS pk_readingcontrol;
ALTER TABLE IF EXISTS ONLY public.sc_questionreply_reply DROP CONSTRAINT IF EXISTS pk_questionreply_reply;
ALTER TABLE IF EXISTS ONLY public.sc_questionreply_recipient DROP CONSTRAINT IF EXISTS pk_questionreply_recipient;
ALTER TABLE IF EXISTS ONLY public.sc_questionreply_question DROP CONSTRAINT IF EXISTS pk_questionreply_question;
ALTER TABLE IF EXISTS ONLY public.sb_questioncontainer_qc DROP CONSTRAINT IF EXISTS pk_questioncontainer_qc;
ALTER TABLE IF EXISTS ONLY public.sb_questioncontainer_comment DROP CONSTRAINT IF EXISTS pk_questioncontainer_comment;
ALTER TABLE IF EXISTS ONLY public.sb_question_score DROP CONSTRAINT IF EXISTS pk_question_score;
ALTER TABLE IF EXISTS ONLY public.sb_question_questionresult DROP CONSTRAINT IF EXISTS pk_question_questionresult;
ALTER TABLE IF EXISTS ONLY public.sb_question_question DROP CONSTRAINT IF EXISTS pk_question_question;
ALTER TABLE IF EXISTS ONLY public.sb_question_answer DROP CONSTRAINT IF EXISTS pk_question_answer;
ALTER TABLE IF EXISTS ONLY public.sb_publication_publii18n DROP CONSTRAINT IF EXISTS pk_publication_publii18n;
ALTER TABLE IF EXISTS ONLY public.sb_publication_publifather DROP CONSTRAINT IF EXISTS pk_publication_publifather;
ALTER TABLE IF EXISTS ONLY public.sb_publication_publi DROP CONSTRAINT IF EXISTS pk_publication_publi;
ALTER TABLE IF EXISTS ONLY public.sc_projectmanager_tasks DROP CONSTRAINT IF EXISTS pk_projectmanager_tasks;
ALTER TABLE IF EXISTS ONLY public.sc_projectmanager_resources DROP CONSTRAINT IF EXISTS pk_projectmanager_resource;
ALTER TABLE IF EXISTS ONLY public.sc_projectmanager_calendar DROP CONSTRAINT IF EXISTS pk_projectmanager_calendar;
ALTER TABLE IF EXISTS ONLY public.personalization DROP CONSTRAINT IF EXISTS pk_personalization;
ALTER TABLE IF EXISTS ONLY public.permalinks_version DROP CONSTRAINT IF EXISTS pk_permalinks_version;
ALTER TABLE IF EXISTS ONLY public.permalinks_document DROP CONSTRAINT IF EXISTS pk_permalinks_document;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_utilization DROP CONSTRAINT IF EXISTS pk_pdc_utilization;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_subscription_axis DROP CONSTRAINT IF EXISTS pk_pdc_subscription_axis;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_subscription DROP CONSTRAINT IF EXISTS pk_pdc_subscription;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_axisi18n DROP CONSTRAINT IF EXISTS pk_pdc_axisi18n;
ALTER TABLE IF EXISTS ONLY public.sb_pdc_axis DROP CONSTRAINT IF EXISTS pk_pdc_axis;
ALTER TABLE IF EXISTS ONLY public.sb_cal_occurrences DROP CONSTRAINT IF EXISTS pk_occurrence;
ALTER TABLE IF EXISTS ONLY public.st_notifsendedreceiver DROP CONSTRAINT IF EXISTS pk_notifsendedreceiver;
ALTER TABLE IF EXISTS ONLY public.st_notifsended DROP CONSTRAINT IF EXISTS pk_notifsended;
ALTER TABLE IF EXISTS ONLY public.st_notifchannel DROP CONSTRAINT IF EXISTS pk_notifchannel;
ALTER TABLE IF EXISTS ONLY public.st_notifaddress DROP CONSTRAINT IF EXISTS pk_notifaddress;
ALTER TABLE IF EXISTS ONLY public.st_notifpreference DROP CONSTRAINT IF EXISTS pk_notifaddr_component;
ALTER TABLE IF EXISTS ONLY public.sb_node_nodei18n DROP CONSTRAINT IF EXISTS pk_node_nodei18n;
ALTER TABLE IF EXISTS ONLY public.sb_node_node DROP CONSTRAINT IF EXISTS pk_node_node;
ALTER TABLE IF EXISTS ONLY public.sc_mydb_connectinfo DROP CONSTRAINT IF EXISTS pk_mydb_connectinfo;
ALTER TABLE IF EXISTS ONLY public.model_contact DROP CONSTRAINT IF EXISTS pk_model_contact;
ALTER TABLE IF EXISTS ONLY public.model DROP CONSTRAINT IF EXISTS pk_model;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_message DROP CONSTRAINT IF EXISTS pk_mailinglist_message;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_list DROP CONSTRAINT IF EXISTS pk_mailinglist_list;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_internal_sub DROP CONSTRAINT IF EXISTS pk_mailinglist_internal_sub;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_external_user DROP CONSTRAINT IF EXISTS pk_mailinglist_external_user;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_attachment DROP CONSTRAINT IF EXISTS pk_mailinglist_attachment;
ALTER TABLE IF EXISTS ONLY public.sc_kmelia_search DROP CONSTRAINT IF EXISTS pk_kmelia_search;
ALTER TABLE IF EXISTS ONLY public.sb_interests_axis DROP CONSTRAINT IF EXISTS pk_interests_axis;
ALTER TABLE IF EXISTS ONLY public.sb_interests DROP CONSTRAINT IF EXISTS pk_interests;
ALTER TABLE IF EXISTS ONLY public.st_instance_data DROP CONSTRAINT IF EXISTS pk_instance_data;
ALTER TABLE IF EXISTS ONLY public.sc_il_publication DROP CONSTRAINT IF EXISTS pk_infoletter_publication;
ALTER TABLE IF EXISTS ONLY public.sc_il_letter DROP CONSTRAINT IF EXISTS pk_infoletter_letter;
ALTER TABLE IF EXISTS ONLY public.st_group_user_rel DROP CONSTRAINT IF EXISTS pk_group_user_rel;
ALTER TABLE IF EXISTS ONLY public.st_group DROP CONSTRAINT IF EXISTS pk_group;
ALTER TABLE IF EXISTS ONLY public.sc_forums_rights DROP CONSTRAINT IF EXISTS pk_forums_rights;
ALTER TABLE IF EXISTS ONLY public.sc_forums_message DROP CONSTRAINT IF EXISTS pk_forums_message;
ALTER TABLE IF EXISTS ONLY public.sc_forums_historyuser DROP CONSTRAINT IF EXISTS pk_forums_historyuser;
ALTER TABLE IF EXISTS ONLY public.sc_forums_forum DROP CONSTRAINT IF EXISTS pk_forums_forum;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_templatefield DROP CONSTRAINT IF EXISTS pk_formtemplate_templatefield;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_template DROP CONSTRAINT IF EXISTS pk_formtemplate_template;
ALTER TABLE IF EXISTS ONLY public.sb_formtemplate_record DROP CONSTRAINT IF EXISTS pk_formtemplate_record;
ALTER TABLE IF EXISTS ONLY public.sb_sn_externalaccount DROP CONSTRAINT IF EXISTS pk_externalaccount;
ALTER TABLE IF EXISTS ONLY public.sb_cal_event DROP CONSTRAINT IF EXISTS pk_event;
ALTER TABLE IF EXISTS ONLY public.domainsp_user DROP CONSTRAINT IF EXISTS pk_domainsp_user;
ALTER TABLE IF EXISTS ONLY public.domainsp_group_user_rel DROP CONSTRAINT IF EXISTS pk_domainsp_group_user_rel;
ALTER TABLE IF EXISTS ONLY public.domainsp_group DROP CONSTRAINT IF EXISTS pk_domainsp_group;
ALTER TABLE IF EXISTS ONLY public.sc_delegatednews_news DROP CONSTRAINT IF EXISTS pk_delegatednews_news;
ALTER TABLE IF EXISTS ONLY public.sb_coordinates_coordinates DROP CONSTRAINT IF EXISTS pk_coordinates_coordinates;
ALTER TABLE IF EXISTS ONLY public.sb_contribution_tracking DROP CONSTRAINT IF EXISTS pk_contribution_tracking;
ALTER TABLE IF EXISTS ONLY public.sb_contentmanager_instance DROP CONSTRAINT IF EXISTS pk_contentmanager_instance;
ALTER TABLE IF EXISTS ONLY public.sb_contentmanager_content DROP CONSTRAINT IF EXISTS pk_contentmanager_content;
ALTER TABLE IF EXISTS ONLY public.sb_containermanager_instance DROP CONSTRAINT IF EXISTS pk_containermanager_instance;
ALTER TABLE IF EXISTS ONLY public.sb_contact_info DROP CONSTRAINT IF EXISTS pk_contact_info;
ALTER TABLE IF EXISTS ONLY public.sb_contact_contactfather DROP CONSTRAINT IF EXISTS pk_contact_contactfather;
ALTER TABLE IF EXISTS ONLY public.sb_contact_contact DROP CONSTRAINT IF EXISTS pk_contact_contact;
ALTER TABLE IF EXISTS ONLY public.sc_connecteurjdbc_connectinfo DROP CONSTRAINT IF EXISTS pk_connecteurjdbc_connectinfo;
ALTER TABLE IF EXISTS ONLY public.st_componentinstance DROP CONSTRAINT IF EXISTS pk_componentinstance;
ALTER TABLE IF EXISTS ONLY public.sb_comment_comment DROP CONSTRAINT IF EXISTS pk_comment_comment;
ALTER TABLE IF EXISTS ONLY public.sb_classifyengine_classify DROP CONSTRAINT IF EXISTS pk_classifyengine_classify;
ALTER TABLE IF EXISTS ONLY public.sb_cal_categories DROP CONSTRAINT IF EXISTS pk_categories;
ALTER TABLE IF EXISTS ONLY public.calendartodoattendee DROP CONSTRAINT IF EXISTS pk_calendartodoattendee;
ALTER TABLE IF EXISTS ONLY public.calendartodo DROP CONSTRAINT IF EXISTS pk_calendartodo;
ALTER TABLE IF EXISTS ONLY public.calendarjournalcategory DROP CONSTRAINT IF EXISTS pk_calendarjournalcategory;
ALTER TABLE IF EXISTS ONLY public.calendarjournalattendee DROP CONSTRAINT IF EXISTS pk_calendarjournalattendee;
ALTER TABLE IF EXISTS ONLY public.calendarjournal DROP CONSTRAINT IF EXISTS pk_calendarjournal;
ALTER TABLE IF EXISTS ONLY public.calendarcategory DROP CONSTRAINT IF EXISTS pk_calendarcategory;
ALTER TABLE IF EXISTS ONLY public.sb_cal_calendar DROP CONSTRAINT IF EXISTS pk_calendar;
ALTER TABLE IF EXISTS ONLY public.sb_cal_components DROP CONSTRAINT IF EXISTS pk_calcomponent;
ALTER TABLE IF EXISTS ONLY public.sc_blog_post DROP CONSTRAINT IF EXISTS pk_blog_post;
ALTER TABLE IF EXISTS ONLY public.sb_cal_attributes DROP CONSTRAINT IF EXISTS pk_attributes;
ALTER TABLE IF EXISTS ONLY public.sb_cal_attendees DROP CONSTRAINT IF EXISTS pk_attendee;
ALTER TABLE IF EXISTS ONLY public.st_accesslevel DROP CONSTRAINT IF EXISTS pk_accesslevel;
ALTER TABLE IF EXISTS ONLY public.pdcposition DROP CONSTRAINT IF EXISTS pdcposition_pkey;
ALTER TABLE IF EXISTS ONLY public.pdcposition_pdcaxisvalue DROP CONSTRAINT IF EXISTS pdcposition_pdcaxisvalue_pkey;
ALTER TABLE IF EXISTS ONLY public.pdcclassification DROP CONSTRAINT IF EXISTS pdcclassification_pkey;
ALTER TABLE IF EXISTS ONLY public.pdcclassification_pdcposition DROP CONSTRAINT IF EXISTS pdcclassification_pdcposition_positions_id_key;
ALTER TABLE IF EXISTS ONLY public.pdcclassification_pdcposition DROP CONSTRAINT IF EXISTS pdcclassification_pdcposition_pkey;
ALTER TABLE IF EXISTS ONLY public.pdcaxisvalue DROP CONSTRAINT IF EXISTS pdcaxisvalue_pkey;
ALTER TABLE IF EXISTS ONLY public.sc_mailinglist_message DROP CONSTRAINT IF EXISTS mailinglist_message_mailid_key;
ALTER TABLE IF EXISTS ONLY public.st_token DROP CONSTRAINT IF EXISTS const_st_token_pk;
ALTER TABLE IF EXISTS ONLY public.st_quota DROP CONSTRAINT IF EXISTS const_st_quota_pk;
ALTER TABLE IF EXISTS ONLY public.st_notificationresource DROP CONSTRAINT IF EXISTS const_st_nr_pk;
ALTER TABLE IF EXISTS ONLY public.st_delayednotifusersetting DROP CONSTRAINT IF EXISTS const_st_dnus_pk;
ALTER TABLE IF EXISTS ONLY public.st_delayednotification DROP CONSTRAINT IF EXISTS const_st_dn_pk;
ALTER TABLE IF EXISTS ONLY public.st_datereminder DROP CONSTRAINT IF EXISTS const_st_datereminder_pk;
DROP TABLE IF EXISTS public.uniqueid;
DROP TABLE IF EXISTS public.subscribe;
DROP TABLE IF EXISTS public.st_userrole_user_rel;
DROP TABLE IF EXISTS public.st_userrole_group_rel;
DROP TABLE IF EXISTS public.st_userrole;
DROP TABLE IF EXISTS public.st_userfavoritespaces;
DROP TABLE IF EXISTS public.st_user;
DROP TABLE IF EXISTS public.st_token;
DROP TABLE IF EXISTS public.st_spaceuserrole_user_rel;
DROP TABLE IF EXISTS public.st_spaceuserrole_group_rel;
DROP TABLE IF EXISTS public.st_spaceuserrole;
DROP TABLE IF EXISTS public.st_spacei18n;
DROP TABLE IF EXISTS public.st_space;
DROP TABLE IF EXISTS public.st_silvermailmessage;
DROP TABLE IF EXISTS public.st_servermessage;
DROP TABLE IF EXISTS public.st_quota;
DROP TABLE IF EXISTS public.st_popupmessage;
DROP TABLE IF EXISTS public.st_notifsendedreceiver;
DROP TABLE IF EXISTS public.st_notifsended;
DROP TABLE IF EXISTS public.st_notifpreference;
DROP TABLE IF EXISTS public.st_notificationresource;
DROP TABLE IF EXISTS public.st_notifdefaultaddress;
DROP TABLE IF EXISTS public.st_notifchannel;
DROP TABLE IF EXISTS public.st_notifaddress;
DROP TABLE IF EXISTS public.st_longtext;
DROP TABLE IF EXISTS public.st_keystore;
DROP TABLE IF EXISTS public.st_instance_modelused;
DROP TABLE IF EXISTS public.st_instance_data;
DROP TABLE IF EXISTS public.st_groupuserrole_user_rel;
DROP TABLE IF EXISTS public.st_groupuserrole_group_rel;
DROP TABLE IF EXISTS public.st_groupuserrole;
DROP TABLE IF EXISTS public.st_group_user_rel;
DROP TABLE IF EXISTS public.st_group;
DROP TABLE IF EXISTS public.st_formeditor_formediteddata;
DROP TABLE IF EXISTS public.st_formeditor_formedited;
DROP TABLE IF EXISTS public.st_formdesigner_formdesign;
DROP TABLE IF EXISTS public.st_formdesigner_connectors;
DROP TABLE IF EXISTS public.st_domain;
DROP TABLE IF EXISTS public.st_delayednotifusersetting;
DROP TABLE IF EXISTS public.st_delayednotification;
DROP TABLE IF EXISTS public.st_datereminder;
DROP TABLE IF EXISTS public.st_componentinstancei18n;
DROP TABLE IF EXISTS public.st_componentinstance;
DROP TABLE IF EXISTS public.st_accesslevel;
DROP TABLE IF EXISTS public.sr_packages;
DROP TABLE IF EXISTS public.sc_whitepages_searchfields;
DROP TABLE IF EXISTS public.sc_whitepages_card;
DROP TABLE IF EXISTS public.sc_suggestion_box;
DROP TABLE IF EXISTS public.sc_suggestion;
DROP TABLE IF EXISTS public.sc_silvercrawler_statistic;
DROP TABLE IF EXISTS public.sc_scheduleevent_response;
DROP TABLE IF EXISTS public.sc_scheduleevent_options;
DROP TABLE IF EXISTS public.sc_scheduleevent_list;
DROP TABLE IF EXISTS public.sc_scheduleevent_contributor;
DROP TABLE IF EXISTS public.sc_rss_channels;
DROP TABLE IF EXISTS public.sc_resources_resource;
DROP TABLE IF EXISTS public.sc_resources_reservedresource;
DROP TABLE IF EXISTS public.sc_resources_reservation;
DROP TABLE IF EXISTS public.sc_resources_managers;
DROP TABLE IF EXISTS public.sc_resources_category;
DROP TABLE IF EXISTS public.sc_quickinfo_news;
DROP TABLE IF EXISTS public.sc_questionreply_reply;
DROP TABLE IF EXISTS public.sc_questionreply_recipient;
DROP TABLE IF EXISTS public.sc_questionreply_question;
DROP TABLE IF EXISTS public.sc_projectmanager_tasks;
DROP TABLE IF EXISTS public.sc_projectmanager_resources;
DROP TABLE IF EXISTS public.sc_projectmanager_calendar;
DROP TABLE IF EXISTS public.sc_mydb_connectinfo;
DROP TABLE IF EXISTS public.sc_mailinglist_message;
DROP TABLE IF EXISTS public.sc_mailinglist_list;
DROP TABLE IF EXISTS public.sc_mailinglist_internal_sub;
DROP TABLE IF EXISTS public.sc_mailinglist_external_user;
DROP TABLE IF EXISTS public.sc_mailinglist_attachment;
DROP TABLE IF EXISTS public.sc_kmelia_search;
DROP TABLE IF EXISTS public.sc_il_publication;
DROP TABLE IF EXISTS public.sc_il_letter;
DROP TABLE IF EXISTS public.sc_il_extsus;
DROP TABLE IF EXISTS public.sc_gallery_video;
DROP TABLE IF EXISTS public.sc_gallery_streaming;
DROP TABLE IF EXISTS public.sc_gallery_sound;
DROP TABLE IF EXISTS public.sc_gallery_photo;
DROP TABLE IF EXISTS public.sc_gallery_path;
DROP TABLE IF EXISTS public.sc_gallery_orderdetail;
DROP TABLE IF EXISTS public.sc_gallery_order;
DROP TABLE IF EXISTS public.sc_gallery_media;
DROP TABLE IF EXISTS public.sc_gallery_internal;
DROP TABLE IF EXISTS public.sc_forums_rights;
DROP TABLE IF EXISTS public.sc_forums_message;
DROP TABLE IF EXISTS public.sc_forums_historyuser;
DROP TABLE IF EXISTS public.sc_forums_forum;
DROP TABLE IF EXISTS public.sc_formsonline_userrights;
DROP TABLE IF EXISTS public.sc_formsonline_grouprights;
DROP TABLE IF EXISTS public.sc_formsonline_forms;
DROP TABLE IF EXISTS public.sc_formsonline_forminstvali;
DROP TABLE IF EXISTS public.sc_formsonline_forminstances;
DROP TABLE IF EXISTS public.sc_delegatednews_news;
DROP TABLE IF EXISTS public.sc_contact_groupfather;
DROP TABLE IF EXISTS public.sc_connecteurjdbc_connectinfo;
DROP TABLE IF EXISTS public.sc_community_membership;
DROP TABLE IF EXISTS public.sc_community;
DROP TABLE IF EXISTS public.sc_classifieds_subscribes;
DROP TABLE IF EXISTS public.sc_classifieds_classifieds;
DROP TABLE IF EXISTS public.sc_blog_post;
DROP TABLE IF EXISTS public.sb_workflow_workinguser;
DROP TABLE IF EXISTS public.sb_workflow_usersettings;
DROP TABLE IF EXISTS public.sb_workflow_userinfo;
DROP TABLE IF EXISTS public.sb_workflow_undo_step;
DROP TABLE IF EXISTS public.sb_workflow_replacements;
DROP TABLE IF EXISTS public.sb_workflow_question;
DROP TABLE IF EXISTS public.sb_workflow_processinstance;
DROP TABLE IF EXISTS public.sb_workflow_lockinguser;
DROP TABLE IF EXISTS public.sb_workflow_interesteduser;
DROP TABLE IF EXISTS public.sb_workflow_historystep;
DROP TABLE IF EXISTS public.sb_workflow_error;
DROP TABLE IF EXISTS public.sb_workflow_activestate;
DROP TABLE IF EXISTS public.sb_webconnections_info;
DROP TABLE IF EXISTS public.sb_variables_variable;
DROP TABLE IF EXISTS public.sb_variables_value;
DROP TABLE IF EXISTS public.sb_tree_treei18n;
DROP TABLE IF EXISTS public.sb_tree_tree;
DROP TABLE IF EXISTS public.sb_thumbnail_thumbnail;
DROP TABLE IF EXISTS public.sb_thesaurus_vocabulary;
DROP TABLE IF EXISTS public.sb_thesaurus_synonym;
DROP TABLE IF EXISTS public.sb_thesaurus_jargon;
DROP TABLE IF EXISTS public.sb_tagcloud_tagcloud;
DROP TABLE IF EXISTS public.sb_statistic_history;
DROP TABLE IF EXISTS public.sb_stat_volumecumul;
DROP TABLE IF EXISTS public.sb_stat_volume;
DROP TABLE IF EXISTS public.sb_stat_sizedircumul;
DROP TABLE IF EXISTS public.sb_stat_sizedir;
DROP TABLE IF EXISTS public.sb_stat_connectioncumul;
DROP TABLE IF EXISTS public.sb_stat_connection;
DROP TABLE IF EXISTS public.sb_stat_accesscumul;
DROP TABLE IF EXISTS public.sb_stat_access;
DROP TABLE IF EXISTS public.sb_sn_typerelationship;
DROP TABLE IF EXISTS public.sb_sn_status;
DROP TABLE IF EXISTS public.sb_sn_relationship;
DROP TABLE IF EXISTS public.sb_sn_invitation;
DROP TABLE IF EXISTS public.sb_sn_externalaccount;
DROP TABLE IF EXISTS public.sb_seealso_link;
DROP TABLE IF EXISTS public.sb_reminder;
DROP TABLE IF EXISTS public.sb_questioncontainer_qc;
DROP TABLE IF EXISTS public.sb_questioncontainer_comment;
DROP TABLE IF EXISTS public.sb_question_score;
DROP TABLE IF EXISTS public.sb_question_questionresult;
DROP TABLE IF EXISTS public.sb_question_question;
DROP TABLE IF EXISTS public.sb_question_answer;
DROP TABLE IF EXISTS public.sb_publication_validation;
DROP TABLE IF EXISTS public.sb_publication_publii18n;
DROP TABLE IF EXISTS public.sb_publication_publifather;
DROP TABLE IF EXISTS public.sb_publication_publi;
DROP TABLE IF EXISTS public.sb_pdc_utilization;
DROP TABLE IF EXISTS public.sb_pdc_user_rights;
DROP TABLE IF EXISTS public.sb_pdc_subscription_axis;
DROP TABLE IF EXISTS public.sb_pdc_subscription;
DROP TABLE IF EXISTS public.sb_pdc_group_rights;
DROP TABLE IF EXISTS public.sb_pdc_axisi18n;
DROP TABLE IF EXISTS public.sb_pdc_axis;
DROP TABLE IF EXISTS public.sb_notation_notation;
DROP TABLE IF EXISTS public.sb_node_nodei18n;
DROP TABLE IF EXISTS public.sb_node_node;
DROP TABLE IF EXISTS public.sb_mylinks_linkcat;
DROP TABLE IF EXISTS public.sb_mylinks_link;
DROP TABLE IF EXISTS public.sb_mylinks_cat;
DROP TABLE IF EXISTS public.sb_interests_axis;
DROP TABLE IF EXISTS public.sb_interests;
DROP TABLE IF EXISTS public.sb_formtemplate_textfield;
DROP TABLE IF EXISTS public.sb_formtemplate_templatefield;
DROP TABLE IF EXISTS public.sb_formtemplate_template;
DROP TABLE IF EXISTS public.sb_formtemplate_record;
DROP TABLE IF EXISTS public.sb_filesharing_ticket;
DROP TABLE IF EXISTS public.sb_filesharing_history;
DROP TABLE IF EXISTS public.sb_coordinates_coordinates;
DROP TABLE IF EXISTS public.sb_contribution_tracking;
DROP TABLE IF EXISTS public.sb_contentmanager_instance;
DROP TABLE IF EXISTS public.sb_contentmanager_content;
DROP TABLE IF EXISTS public.sb_containermanager_links;
DROP TABLE IF EXISTS public.sb_containermanager_instance;
DROP TABLE IF EXISTS public.sb_contact_info;
DROP TABLE IF EXISTS public.sb_contact_contactfather;
DROP TABLE IF EXISTS public.sb_contact_contact;
DROP TABLE IF EXISTS public.sb_comment_comment;
DROP TABLE IF EXISTS public.sb_classifyengine_classify;
DROP TABLE IF EXISTS public.sb_cal_recurrence_exception;
DROP TABLE IF EXISTS public.sb_cal_recurrence_dayofweek;
DROP TABLE IF EXISTS public.sb_cal_recurrence;
DROP TABLE IF EXISTS public.sb_cal_occurrences;
DROP TABLE IF EXISTS public.sb_cal_event;
DROP TABLE IF EXISTS public.sb_cal_components;
DROP TABLE IF EXISTS public.sb_cal_categories;
DROP TABLE IF EXISTS public.sb_cal_calendar;
DROP TABLE IF EXISTS public.sb_cal_attributes;
DROP TABLE IF EXISTS public.sb_cal_attendees;
DROP TABLE IF EXISTS public.sb_agenda_import_settings;
DROP TABLE IF EXISTS public.sb_agenda_holidays;
DROP TABLE IF EXISTS public.readingcontrol;
DROP TABLE IF EXISTS public.qrtz_triggers;
DROP TABLE IF EXISTS public.qrtz_simprop_triggers;
DROP TABLE IF EXISTS public.qrtz_simple_triggers;
DROP TABLE IF EXISTS public.qrtz_scheduler_state;
DROP TABLE IF EXISTS public.qrtz_paused_trigger_grps;
DROP TABLE IF EXISTS public.qrtz_locks;
DROP TABLE IF EXISTS public.qrtz_job_details;
DROP TABLE IF EXISTS public.qrtz_fired_triggers;
DROP TABLE IF EXISTS public.qrtz_cron_triggers;
DROP TABLE IF EXISTS public.qrtz_calendars;
DROP TABLE IF EXISTS public.qrtz_blob_triggers;
DROP TABLE IF EXISTS public.personalization;
DROP TABLE IF EXISTS public.permalinks_version;
DROP TABLE IF EXISTS public.permalinks_document;
DROP TABLE IF EXISTS public.pdcposition_pdcaxisvalue;
DROP TABLE IF EXISTS public.pdcposition;
DROP TABLE IF EXISTS public.pdcclassification_pdcposition;
DROP TABLE IF EXISTS public.pdcclassification;
DROP TABLE IF EXISTS public.pdcaxisvalue;
DROP TABLE IF EXISTS public.model_contact;
DROP TABLE IF EXISTS public.model;
DROP TABLE IF EXISTS public.domainsp_user;
DROP TABLE IF EXISTS public.domainsp_group_user_rel;
DROP TABLE IF EXISTS public.domainsp_group;
DROP TABLE IF EXISTS public.days;
DROP TABLE IF EXISTS public.calendartodoattendee;
DROP TABLE IF EXISTS public.calendartodo;
DROP TABLE IF EXISTS public.calendarjournalcategory;
DROP TABLE IF EXISTS public.calendarjournalattendee;
DROP TABLE IF EXISTS public.calendarjournal;
DROP TABLE IF EXISTS public.calendarcategory;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: silverpeas
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO silverpeas;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: silverpeas
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: calendarcategory; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.calendarcategory (
    categoryid character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.calendarcategory OWNER TO silverpeas;

--
-- Name: calendarjournal; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.calendarjournal (
    id integer NOT NULL,
    name character varying(2000) NOT NULL,
    description character varying(4000),
    delegatorid character varying(100) NOT NULL,
    startday character varying(50) NOT NULL,
    endday character varying(50),
    starthour character varying(50),
    endhour character varying(50),
    classification character varying(20),
    priority integer,
    lastmodification character varying(50),
    externalid character varying(50)
);


ALTER TABLE public.calendarjournal OWNER TO silverpeas;

--
-- Name: calendarjournalattendee; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.calendarjournalattendee (
    journalid integer NOT NULL,
    userid character varying(100) NOT NULL,
    participationstatus character varying(50)
);


ALTER TABLE public.calendarjournalattendee OWNER TO silverpeas;

--
-- Name: calendarjournalcategory; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.calendarjournalcategory (
    journalid integer NOT NULL,
    categoryid character varying(50) NOT NULL
);


ALTER TABLE public.calendarjournalcategory OWNER TO silverpeas;

--
-- Name: calendartodo; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.calendartodo (
    id integer NOT NULL,
    name character varying(2000) NOT NULL,
    description character varying(4000),
    delegatorid character varying(100) NOT NULL,
    startday character varying(50),
    endday character varying(50),
    starthour character varying(50),
    endhour character varying(50),
    classification character varying(20),
    priority integer,
    lastmodification character varying(50),
    percentcompleted integer,
    completedday character varying(20),
    duration integer,
    componentid character varying(100),
    spaceid character varying(100),
    externalid character varying(100)
);


ALTER TABLE public.calendartodo OWNER TO silverpeas;

--
-- Name: calendartodoattendee; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.calendartodoattendee (
    todoid integer NOT NULL,
    userid character varying(100) NOT NULL,
    participationstatus character varying(50)
);


ALTER TABLE public.calendartodoattendee OWNER TO silverpeas;

--
-- Name: days; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.days (
    day character varying(50) NOT NULL
);


ALTER TABLE public.days OWNER TO silverpeas;

--
-- Name: domainsp_group; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.domainsp_group (
    id integer NOT NULL,
    supergroupid integer,
    name character varying(100) NOT NULL,
    description character varying(400)
);


ALTER TABLE public.domainsp_group OWNER TO silverpeas;

--
-- Name: domainsp_group_user_rel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.domainsp_group_user_rel (
    groupid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.domainsp_group_user_rel OWNER TO silverpeas;

--
-- Name: domainsp_user; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.domainsp_user (
    id integer NOT NULL,
    firstname character varying(100),
    lastname character varying(100) NOT NULL,
    phone character varying(20),
    homephone character varying(20),
    cellphone character varying(20),
    fax character varying(20),
    address character varying(500),
    title character varying(100),
    company character varying(100),
    "position" character varying(100),
    boss character varying(100),
    login character varying(50) NOT NULL,
    password character varying(123),
    passwordvalid character(1) DEFAULT 'Y'::bpchar NOT NULL,
    loginmail character varying(100),
    email character varying(100)
);


ALTER TABLE public.domainsp_user OWNER TO silverpeas;

--
-- Name: model; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.model (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(100),
    imagename character varying(100),
    htmldisplayer character varying(3500) NOT NULL,
    htmleditor character varying(3500) NOT NULL,
    partid integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.model OWNER TO silverpeas;

--
-- Name: model_contact; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.model_contact (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(50),
    imagename character varying(50),
    htmldisplayer character varying(3000) NOT NULL,
    htmleditor character varying(3000) NOT NULL
);


ALTER TABLE public.model_contact OWNER TO silverpeas;

--
-- Name: pdcaxisvalue; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.pdcaxisvalue (
    valueid bigint NOT NULL,
    axisid bigint NOT NULL
);


ALTER TABLE public.pdcaxisvalue OWNER TO silverpeas;

--
-- Name: pdcclassification; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.pdcclassification (
    id bigint NOT NULL,
    contentid character varying(255),
    instanceid character varying(255) NOT NULL,
    modifiable boolean NOT NULL,
    nodeid character varying(255)
);


ALTER TABLE public.pdcclassification OWNER TO silverpeas;

--
-- Name: pdcclassification_pdcposition; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.pdcclassification_pdcposition (
    pdcclassification_id bigint NOT NULL,
    positions_id bigint NOT NULL
);


ALTER TABLE public.pdcclassification_pdcposition OWNER TO silverpeas;

--
-- Name: pdcposition; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.pdcposition (
    id bigint NOT NULL
);


ALTER TABLE public.pdcposition OWNER TO silverpeas;

--
-- Name: pdcposition_pdcaxisvalue; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.pdcposition_pdcaxisvalue (
    pdcposition_id bigint NOT NULL,
    axisvalues_valueid bigint NOT NULL,
    axisvalues_axisid bigint NOT NULL
);


ALTER TABLE public.pdcposition_pdcaxisvalue OWNER TO silverpeas;

--
-- Name: permalinks_document; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.permalinks_document (
    documentid integer NOT NULL,
    documentuuid character varying(50) NOT NULL
);


ALTER TABLE public.permalinks_document OWNER TO silverpeas;

--
-- Name: permalinks_version; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.permalinks_version (
    versionid integer NOT NULL,
    versionuuid character varying(50) NOT NULL
);


ALTER TABLE public.permalinks_version OWNER TO silverpeas;

--
-- Name: personalization; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.personalization (
    id character varying(100) NOT NULL,
    languages character varying(100),
    zoneid character varying(100),
    look character varying(50),
    personalwspace character varying(50),
    thesaurusstatus integer NOT NULL,
    draganddropstatus integer DEFAULT 1,
    webdaveditingstatus integer DEFAULT 0,
    menudisplay character varying(50) DEFAULT 'DEFAULT'::character varying
);


ALTER TABLE public.personalization OWNER TO silverpeas;

--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.qrtz_blob_triggers OWNER TO silverpeas;

--
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


ALTER TABLE public.qrtz_calendars OWNER TO silverpeas;

--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO silverpeas;

--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO silverpeas;

--
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


ALTER TABLE public.qrtz_job_details OWNER TO silverpeas;

--
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.qrtz_locks OWNER TO silverpeas;

--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.qrtz_paused_trigger_grps OWNER TO silverpeas;

--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


ALTER TABLE public.qrtz_scheduler_state OWNER TO silverpeas;

--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO silverpeas;

--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


ALTER TABLE public.qrtz_simprop_triggers OWNER TO silverpeas;

--
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


ALTER TABLE public.qrtz_triggers OWNER TO silverpeas;

--
-- Name: readingcontrol; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.readingcontrol (
    pubid integer NOT NULL,
    actorid character varying(100) NOT NULL,
    space character varying(50) NOT NULL,
    componentname character varying(50) NOT NULL
);


ALTER TABLE public.readingcontrol OWNER TO silverpeas;

--
-- Name: sb_agenda_holidays; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_agenda_holidays (
    userid integer NOT NULL,
    holidaydate character varying(10) NOT NULL
);


ALTER TABLE public.sb_agenda_holidays OWNER TO silverpeas;

--
-- Name: sb_agenda_import_settings; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_agenda_import_settings (
    userid integer NOT NULL,
    hostname character varying(500) NOT NULL,
    synchrotype integer NOT NULL,
    synchrodelay integer NOT NULL,
    url character varying(500),
    remotelogin character varying(200),
    remotepwd character varying(200),
    charset character varying(20)
);


ALTER TABLE public.sb_agenda_import_settings OWNER TO silverpeas;

--
-- Name: sb_cal_attendees; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_attendees (
    id character varying(40) NOT NULL,
    attendeeid character varying(40) NOT NULL,
    componentid character varying(40) NOT NULL,
    type integer NOT NULL,
    participation character varying(12) DEFAULT 'AWAITING'::character varying NOT NULL,
    presence character varying(12) DEFAULT 'REQUIRED'::character varying NOT NULL,
    delegate character varying(40),
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_cal_attendees OWNER TO silverpeas;

--
-- Name: sb_cal_attributes; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_attributes (
    id character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.sb_cal_attributes OWNER TO silverpeas;

--
-- Name: sb_cal_calendar; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_calendar (
    id character varying(40) NOT NULL,
    instanceid character varying(30) NOT NULL,
    title character varying(255) NOT NULL,
    zoneid character varying(40) NOT NULL,
    externalurl character varying(250),
    synchrodate timestamp without time zone,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_cal_calendar OWNER TO silverpeas;

--
-- Name: sb_cal_categories; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_categories (
    id character varying(40) NOT NULL,
    category character varying(255) NOT NULL
);


ALTER TABLE public.sb_cal_categories OWNER TO silverpeas;

--
-- Name: sb_cal_components; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_components (
    id character varying(40) NOT NULL,
    calendarid character varying(40) NOT NULL,
    startdate timestamp without time zone NOT NULL,
    enddate timestamp without time zone NOT NULL,
    indays boolean NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(2000) NOT NULL,
    location character varying(255),
    attributes character varying(40),
    priority integer NOT NULL,
    sequence bigint DEFAULT 0 NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_cal_components OWNER TO silverpeas;

--
-- Name: sb_cal_event; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_event (
    id character varying(40) NOT NULL,
    externalid character varying(255),
    synchrodate timestamp without time zone,
    componentid character varying(40) NOT NULL,
    visibility character varying(50) NOT NULL,
    recurrenceid character varying(40)
);


ALTER TABLE public.sb_cal_event OWNER TO silverpeas;

--
-- Name: sb_cal_occurrences; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_occurrences (
    id character varying(60) NOT NULL,
    eventid character varying(40) NOT NULL,
    componentid character varying(40) NOT NULL
);


ALTER TABLE public.sb_cal_occurrences OWNER TO silverpeas;

--
-- Name: sb_cal_recurrence; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_recurrence (
    id character varying(40) NOT NULL,
    recur_periodinterval integer NOT NULL,
    recur_periodunit character varying(5) NOT NULL,
    recur_count integer DEFAULT 0,
    recur_enddate timestamp without time zone
);


ALTER TABLE public.sb_cal_recurrence OWNER TO silverpeas;

--
-- Name: sb_cal_recurrence_dayofweek; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_recurrence_dayofweek (
    recurrenceid character varying(40) NOT NULL,
    recur_nth integer NOT NULL,
    recur_dayofweek integer NOT NULL
);


ALTER TABLE public.sb_cal_recurrence_dayofweek OWNER TO silverpeas;

--
-- Name: sb_cal_recurrence_exception; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_cal_recurrence_exception (
    recurrenceid character varying(40) NOT NULL,
    recur_exceptiondate timestamp without time zone NOT NULL
);


ALTER TABLE public.sb_cal_recurrence_exception OWNER TO silverpeas;

--
-- Name: sb_classifyengine_classify; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_classifyengine_classify (
    positionid integer NOT NULL,
    objectid integer NOT NULL,
    axis0 character varying(150),
    axis1 character varying(150),
    axis2 character varying(150),
    axis3 character varying(150),
    axis4 character varying(150),
    axis5 character varying(150),
    axis6 character varying(150),
    axis7 character varying(150),
    axis8 character varying(150),
    axis9 character varying(150),
    axis10 character varying(150),
    axis11 character varying(150),
    axis12 character varying(150),
    axis13 character varying(150),
    axis14 character varying(150),
    axis15 character varying(150),
    axis16 character varying(150),
    axis17 character varying(150),
    axis18 character varying(150),
    axis19 character varying(150),
    axis20 character varying(150),
    axis21 character varying(150),
    axis22 character varying(150),
    axis23 character varying(150),
    axis24 character varying(150),
    axis25 character varying(150),
    axis26 character varying(150),
    axis27 character varying(150),
    axis28 character varying(150),
    axis29 character varying(150),
    axis30 character varying(150),
    axis31 character varying(150),
    axis32 character varying(150),
    axis33 character varying(150),
    axis34 character varying(150),
    axis35 character varying(150),
    axis36 character varying(150),
    axis37 character varying(150),
    axis38 character varying(150),
    axis39 character varying(150),
    axis40 character varying(150),
    axis41 character varying(150),
    axis42 character varying(150),
    axis43 character varying(150),
    axis44 character varying(150),
    axis45 character varying(150),
    axis46 character varying(150),
    axis47 character varying(150),
    axis48 character varying(150),
    axis49 character varying(150)
);


ALTER TABLE public.sb_classifyengine_classify OWNER TO silverpeas;

--
-- Name: sb_comment_comment; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_comment_comment (
    commentid integer NOT NULL,
    commentownerid integer NOT NULL,
    commentcreationdate character(10) NOT NULL,
    commentmodificationdate character(10),
    commentcomment character varying(2000) NOT NULL,
    instanceid character varying(50) NOT NULL,
    resourcetype character varying(50) NOT NULL,
    resourceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_comment_comment OWNER TO silverpeas;

--
-- Name: sb_contact_contact; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_contact_contact (
    contactid integer NOT NULL,
    contactfirstname character varying(1000),
    contactlastname character varying(1000),
    contactemail character varying(1000),
    contactphone character varying(20),
    contactfax character varying(20),
    userid character varying(100),
    contactcreationdate character varying(10) NOT NULL,
    contactcreatorid character varying(100) NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_contact_contact OWNER TO silverpeas;

--
-- Name: sb_contact_contactfather; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_contact_contactfather (
    contactid integer NOT NULL,
    nodeid integer NOT NULL
);


ALTER TABLE public.sb_contact_contactfather OWNER TO silverpeas;

--
-- Name: sb_contact_info; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_contact_info (
    infoid integer NOT NULL,
    contactid integer NOT NULL,
    modelid character varying(100) NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_contact_info OWNER TO silverpeas;

--
-- Name: sb_containermanager_instance; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_containermanager_instance (
    instanceid integer NOT NULL,
    componentid character varying(100) NOT NULL,
    containertype character varying(100) NOT NULL,
    contenttype character varying(100) NOT NULL
);


ALTER TABLE public.sb_containermanager_instance OWNER TO silverpeas;

--
-- Name: sb_containermanager_links; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_containermanager_links (
    positionid integer NOT NULL,
    containerinstanceid integer NOT NULL
);


ALTER TABLE public.sb_containermanager_links OWNER TO silverpeas;

--
-- Name: sb_contentmanager_content; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_contentmanager_content (
    silvercontentid integer NOT NULL,
    internalcontentid character varying(100) NOT NULL,
    contentinstanceid integer NOT NULL,
    authorid integer NOT NULL,
    creationdate date NOT NULL,
    begindate character varying(10),
    enddate character varying(10),
    isvisible integer
);


ALTER TABLE public.sb_contentmanager_content OWNER TO silverpeas;

--
-- Name: sb_contentmanager_instance; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_contentmanager_instance (
    instanceid integer NOT NULL,
    componentid character varying(100) NOT NULL,
    containertype character varying(100) NOT NULL,
    contenttype character varying(100) NOT NULL
);


ALTER TABLE public.sb_contentmanager_instance OWNER TO silverpeas;

--
-- Name: sb_contribution_tracking; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_contribution_tracking (
    id character varying(40) NOT NULL,
    context character varying(255) DEFAULT ''::character varying,
    contrib_id character varying(40) NOT NULL,
    contrib_type character varying(40) NOT NULL,
    contrib_instanceid character varying(50) NOT NULL,
    action_type character varying(20) NOT NULL,
    action_date timestamp without time zone NOT NULL,
    action_by character varying(50) NOT NULL
);


ALTER TABLE public.sb_contribution_tracking OWNER TO silverpeas;

--
-- Name: sb_coordinates_coordinates; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_coordinates_coordinates (
    coordinatesid integer NOT NULL,
    nodeid integer NOT NULL,
    coordinatesleaf character varying(50) NOT NULL,
    coordinatesdisplayorder integer,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_coordinates_coordinates OWNER TO silverpeas;

--
-- Name: sb_filesharing_history; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_filesharing_history (
    id bigint NOT NULL,
    keyfile character varying(255) NOT NULL,
    downloaddate bigint NOT NULL,
    downloadip character varying(50) NOT NULL
);


ALTER TABLE public.sb_filesharing_history OWNER TO silverpeas;

--
-- Name: sb_filesharing_ticket; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_filesharing_ticket (
    shared_object bigint NOT NULL,
    componentid character varying(255) NOT NULL,
    creatorid character varying(50) NOT NULL,
    creationdate bigint NOT NULL,
    updateid character varying(50),
    updatedate bigint,
    enddate bigint,
    nbaccessmax integer NOT NULL,
    nbaccess integer,
    keyfile character varying(255) NOT NULL,
    shared_object_type character varying(255) NOT NULL
);


ALTER TABLE public.sb_filesharing_ticket OWNER TO silverpeas;

--
-- Name: sb_formtemplate_record; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_formtemplate_record (
    recordid integer NOT NULL,
    templateid integer NOT NULL,
    externalid character varying(250) NOT NULL,
    lang character(2)
);


ALTER TABLE public.sb_formtemplate_record OWNER TO silverpeas;

--
-- Name: sb_formtemplate_template; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_formtemplate_template (
    templateid integer NOT NULL,
    externalid character varying(250) NOT NULL,
    templatename character varying(250)
);


ALTER TABLE public.sb_formtemplate_template OWNER TO silverpeas;

--
-- Name: sb_formtemplate_templatefield; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_formtemplate_templatefield (
    templateid integer NOT NULL,
    fieldname character varying(50) NOT NULL,
    fieldindex integer NOT NULL,
    fieldtype character varying(50) NOT NULL,
    ismandatory smallint DEFAULT 0,
    isreadonly smallint DEFAULT 0,
    ishidden smallint DEFAULT 0
);


ALTER TABLE public.sb_formtemplate_templatefield OWNER TO silverpeas;

--
-- Name: sb_formtemplate_textfield; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_formtemplate_textfield (
    recordid integer NOT NULL,
    fieldname character varying(100) NOT NULL,
    fieldvalue character varying(4000),
    fieldvalueindex integer
);


ALTER TABLE public.sb_formtemplate_textfield OWNER TO silverpeas;

--
-- Name: sb_interests; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_interests (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    criteria character varying(255),
    workspaceid character(100),
    peasid character(100),
    authorid character(10),
    afterdate character varying(10),
    beforedate character varying(10),
    ownerid integer NOT NULL
);


ALTER TABLE public.sb_interests OWNER TO silverpeas;

--
-- Name: sb_interests_axis; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_interests_axis (
    id integer NOT NULL,
    icid integer NOT NULL,
    axisid integer NOT NULL,
    value character varying(100)
);


ALTER TABLE public.sb_interests_axis OWNER TO silverpeas;

--
-- Name: sb_mylinks_cat; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_mylinks_cat (
    catid integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    userid character varying(50) NOT NULL,
    "position" integer
);


ALTER TABLE public.sb_mylinks_cat OWNER TO silverpeas;

--
-- Name: sb_mylinks_link; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_mylinks_link (
    linkid integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    url character varying(255) NOT NULL,
    visible integer NOT NULL,
    popup integer NOT NULL,
    userid character varying(50) NOT NULL,
    instanceid character varying(50),
    objectid character varying(50),
    "position" integer
);


ALTER TABLE public.sb_mylinks_link OWNER TO silverpeas;

--
-- Name: sb_mylinks_linkcat; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_mylinks_linkcat (
    linkid integer NOT NULL,
    catid integer NOT NULL
);


ALTER TABLE public.sb_mylinks_linkcat OWNER TO silverpeas;

--
-- Name: sb_node_node; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_node_node (
    nodeid integer NOT NULL,
    nodename character varying(1000) NOT NULL,
    nodedescription character varying(2000),
    nodecreationdate character varying(10) NOT NULL,
    nodecreatorid character varying(100) NOT NULL,
    nodepath character varying(1000) NOT NULL,
    nodelevelnumber integer NOT NULL,
    nodefatherid integer NOT NULL,
    modelid character varying(1000),
    nodestatus character varying(1000),
    instanceid character varying(50) NOT NULL,
    type character varying(50),
    ordernumber integer DEFAULT 0,
    lang character(2),
    rightsdependson integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.sb_node_node OWNER TO silverpeas;

--
-- Name: sb_node_nodei18n; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_node_nodei18n (
    id integer NOT NULL,
    nodeid integer NOT NULL,
    lang character(2) NOT NULL,
    nodename character varying(1000) NOT NULL,
    nodedescription character varying(2000)
);


ALTER TABLE public.sb_node_nodei18n OWNER TO silverpeas;

--
-- Name: sb_notation_notation; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_notation_notation (
    id integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    externalid character varying(50) NOT NULL,
    externaltype character varying(50) NOT NULL,
    author character varying(50) NOT NULL,
    note integer NOT NULL
);


ALTER TABLE public.sb_notation_notation OWNER TO silverpeas;

--
-- Name: sb_pdc_axis; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_pdc_axis (
    id integer NOT NULL,
    rootid integer NOT NULL,
    name character varying(255) NOT NULL,
    axistype character(1) NOT NULL,
    axisorder integer NOT NULL,
    creationdate character varying(10),
    creatorid character varying(255),
    description character varying(1000),
    lang character(2)
);


ALTER TABLE public.sb_pdc_axis OWNER TO silverpeas;

--
-- Name: sb_pdc_axisi18n; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_pdc_axisi18n (
    id integer NOT NULL,
    axisid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.sb_pdc_axisi18n OWNER TO silverpeas;

--
-- Name: sb_pdc_group_rights; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_pdc_group_rights (
    axisid integer NOT NULL,
    valueid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.sb_pdc_group_rights OWNER TO silverpeas;

--
-- Name: sb_pdc_subscription; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_pdc_subscription (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ownerid integer NOT NULL
);


ALTER TABLE public.sb_pdc_subscription OWNER TO silverpeas;

--
-- Name: sb_pdc_subscription_axis; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_pdc_subscription_axis (
    id integer NOT NULL,
    pdcsubscriptionid integer NOT NULL,
    axisid integer NOT NULL,
    value character varying(100)
);


ALTER TABLE public.sb_pdc_subscription_axis OWNER TO silverpeas;

--
-- Name: sb_pdc_user_rights; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_pdc_user_rights (
    axisid integer NOT NULL,
    valueid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.sb_pdc_user_rights OWNER TO silverpeas;

--
-- Name: sb_pdc_utilization; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_pdc_utilization (
    id integer NOT NULL,
    instanceid character varying(100) NOT NULL,
    axisid integer NOT NULL,
    basevalue integer NOT NULL,
    mandatory integer NOT NULL,
    variant integer NOT NULL
);


ALTER TABLE public.sb_pdc_utilization OWNER TO silverpeas;

--
-- Name: sb_publication_publi; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_publication_publi (
    pubid integer NOT NULL,
    infoid character varying(50),
    pubname character varying(400) NOT NULL,
    pubdescription character varying(2000),
    pubcreationdate character varying(10) NOT NULL,
    pubbegindate character varying(10) NOT NULL,
    pubenddate character varying(10) NOT NULL,
    pubcreatorid character varying(100) NOT NULL,
    pubimportance integer,
    pubversion character varying(100),
    pubkeywords character varying(1000),
    pubcontent character varying(2000),
    pubstatus character varying(100),
    pubupdatedate character varying(10),
    instanceid character varying(50) NOT NULL,
    pubupdaterid character varying(100),
    pubvalidatedate character varying(10),
    pubvalidatorid character varying(50),
    pubbeginhour character varying(5),
    pubendhour character varying(5),
    pubauthor character varying(50),
    pubtargetvalidatorid character varying(50),
    pubcloneid integer DEFAULT '-1'::integer,
    pubclonestatus character varying(50),
    lang character(2),
    pubdraftoutdate character varying(10)
);


ALTER TABLE public.sb_publication_publi OWNER TO silverpeas;

--
-- Name: sb_publication_publifather; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_publication_publifather (
    pubid integer NOT NULL,
    nodeid integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    aliasuserid integer,
    aliasdate character varying(20),
    puborder integer DEFAULT 0
);


ALTER TABLE public.sb_publication_publifather OWNER TO silverpeas;

--
-- Name: sb_publication_publii18n; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_publication_publii18n (
    id integer NOT NULL,
    pubid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(400) NOT NULL,
    description character varying(2000),
    keywords character varying(1000)
);


ALTER TABLE public.sb_publication_publii18n OWNER TO silverpeas;

--
-- Name: sb_publication_validation; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_publication_validation (
    id integer NOT NULL,
    pubid integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    userid integer NOT NULL,
    decisiondate character varying(20) NOT NULL,
    decision character varying(50) NOT NULL
);


ALTER TABLE public.sb_publication_validation OWNER TO silverpeas;

--
-- Name: sb_question_answer; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_question_answer (
    answerid integer NOT NULL,
    questionid integer NOT NULL,
    answerlabel character varying(1000),
    answernbpoints integer,
    answerissolution integer NOT NULL,
    answercomment character varying(2000),
    answernbvoters integer NOT NULL,
    answerisopened integer NOT NULL,
    answerimage character varying(2000),
    answerquestionlink character varying(100)
);


ALTER TABLE public.sb_question_answer OWNER TO silverpeas;

--
-- Name: sb_question_question; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_question_question (
    questionid integer NOT NULL,
    qcid integer NOT NULL,
    questionlabel character varying(1000) NOT NULL,
    questiondescription character varying(2000),
    questionclue character varying(2000),
    questionimage character varying(1000),
    questionisqcm integer NOT NULL,
    questiontype integer NOT NULL,
    questionisopen integer NOT NULL,
    questioncluepenalty integer NOT NULL,
    questionmaxtime integer NOT NULL,
    questiondisplayorder integer NOT NULL,
    questionnbpointsmin integer NOT NULL,
    questionnbpointsmax integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    style character varying(50)
);


ALTER TABLE public.sb_question_question OWNER TO silverpeas;

--
-- Name: sb_question_questionresult; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_question_questionresult (
    qrid integer NOT NULL,
    questionid integer NOT NULL,
    userid character varying(100) NOT NULL,
    answerid integer NOT NULL,
    qropenanswer character varying(2000),
    qrnbpoints integer NOT NULL,
    qrpolldate character varying(10) NOT NULL,
    qrelapsedtime character varying(100),
    qrparticipationid integer
);


ALTER TABLE public.sb_question_questionresult OWNER TO silverpeas;

--
-- Name: sb_question_score; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_question_score (
    scoreid integer NOT NULL,
    qcid integer NOT NULL,
    userid character varying(100) NOT NULL,
    scoreparticipationid integer NOT NULL,
    scorescore integer NOT NULL,
    scoreelapsedtime character varying(100),
    scoreparticipationdate character varying(10) NOT NULL,
    scoresuggestion character varying(2000)
);


ALTER TABLE public.sb_question_score OWNER TO silverpeas;

--
-- Name: sb_questioncontainer_comment; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_questioncontainer_comment (
    commentid integer NOT NULL,
    commentfatherid integer NOT NULL,
    userid character varying(100) NOT NULL,
    commentcomment character varying(2000),
    commentisanonymous integer NOT NULL,
    commentdate character varying(10) NOT NULL
);


ALTER TABLE public.sb_questioncontainer_comment OWNER TO silverpeas;

--
-- Name: sb_questioncontainer_qc; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_questioncontainer_qc (
    qcid integer NOT NULL,
    qctitle character varying(1000) NOT NULL,
    qcdescription character varying(2000),
    qccomment character varying(2000),
    qccreatorid character varying(100) NOT NULL,
    qccreationdate character varying(10) NOT NULL,
    qcbegindate character varying(10) NOT NULL,
    qcenddate character varying(10) NOT NULL,
    qcisclosed integer NOT NULL,
    qcnbvoters integer NOT NULL,
    qcnbquestionspage integer NOT NULL,
    qcnbmaxparticipations integer,
    qcnbtriesbeforesolution integer,
    qcmaxtime integer,
    instanceid character varying(50) NOT NULL,
    anonymous integer NOT NULL,
    resultmode integer NOT NULL,
    resultview integer NOT NULL
);


ALTER TABLE public.sb_questioncontainer_qc OWNER TO silverpeas;

--
-- Name: sb_reminder; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_reminder (
    id character varying(41) NOT NULL,
    remindertype character varying(40) NOT NULL,
    contrib_id character varying(40) NOT NULL,
    contrib_instanceid character varying(30) NOT NULL,
    contrib_type character varying(40) NOT NULL,
    userid character varying(40) NOT NULL,
    text character varying(255),
    triggered boolean DEFAULT false NOT NULL,
    trigger_datetime timestamp without time zone,
    trigger_durationtime integer,
    trigger_durationunit character varying(12),
    trigger_prop character varying(30),
    process_name character varying(200) NOT NULL
);


ALTER TABLE public.sb_reminder OWNER TO silverpeas;

--
-- Name: sb_seealso_link; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_seealso_link (
    id integer NOT NULL,
    objectid integer NOT NULL,
    objectinstanceid character varying(50) NOT NULL,
    targetid integer NOT NULL,
    targetinstanceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_seealso_link OWNER TO silverpeas;

--
-- Name: sb_sn_externalaccount; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_sn_externalaccount (
    profileid character varying(100) NOT NULL,
    networkid character varying(10) NOT NULL,
    silverpeasuserid character varying(50)
);


ALTER TABLE public.sb_sn_externalaccount OWNER TO silverpeas;

--
-- Name: sb_sn_invitation; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_sn_invitation (
    id integer NOT NULL,
    senderid integer NOT NULL,
    receiverid integer NOT NULL,
    message character varying(1000),
    invitationdate timestamp without time zone NOT NULL
);


ALTER TABLE public.sb_sn_invitation OWNER TO silverpeas;

--
-- Name: sb_sn_relationship; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_sn_relationship (
    id integer NOT NULL,
    user1id integer NOT NULL,
    user2id integer NOT NULL,
    typerelationshipid integer,
    acceptancedate timestamp without time zone NOT NULL,
    inviterid integer NOT NULL
);


ALTER TABLE public.sb_sn_relationship OWNER TO silverpeas;

--
-- Name: sb_sn_status; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_sn_status (
    id integer NOT NULL,
    userid integer NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    description character varying(1000) NOT NULL
);


ALTER TABLE public.sb_sn_status OWNER TO silverpeas;

--
-- Name: sb_sn_typerelationship; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_sn_typerelationship (
    id integer NOT NULL,
    designation character varying(10)
);


ALTER TABLE public.sb_sn_typerelationship OWNER TO silverpeas;

--
-- Name: sb_stat_access; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_stat_access (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    peastype character varying(50) NOT NULL,
    spaceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    countaccess numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_access OWNER TO silverpeas;

--
-- Name: sb_stat_accesscumul; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_stat_accesscumul (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    peastype character varying(50) NOT NULL,
    spaceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    countaccess numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_accesscumul OWNER TO silverpeas;

--
-- Name: sb_stat_connection; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_stat_connection (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    countconnection numeric(19,0) NOT NULL,
    duration numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_connection OWNER TO silverpeas;

--
-- Name: sb_stat_connectioncumul; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_stat_connectioncumul (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    countconnection numeric(19,0) NOT NULL,
    duration numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_connectioncumul OWNER TO silverpeas;

--
-- Name: sb_stat_sizedir; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_stat_sizedir (
    datestat character varying(10) NOT NULL,
    filedir character varying(256) NOT NULL,
    sizedir numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_sizedir OWNER TO silverpeas;

--
-- Name: sb_stat_sizedircumul; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_stat_sizedircumul (
    datestat character varying(10) NOT NULL,
    filedir character varying(256) NOT NULL,
    sizedir numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_sizedircumul OWNER TO silverpeas;

--
-- Name: sb_stat_volume; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_stat_volume (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    peastype character varying(50) NOT NULL,
    spaceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    countvolume numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_volume OWNER TO silverpeas;

--
-- Name: sb_stat_volumecumul; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_stat_volumecumul (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    peastype character varying(50) NOT NULL,
    spaceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    countvolume numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_volumecumul OWNER TO silverpeas;

--
-- Name: sb_statistic_history; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_statistic_history (
    datestat character varying(10) NOT NULL,
    heurestat character varying(10) NOT NULL,
    userid character varying(100) NOT NULL,
    resourceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    actiontype integer NOT NULL,
    resourcetype character varying(50) NOT NULL
);


ALTER TABLE public.sb_statistic_history OWNER TO silverpeas;

--
-- Name: sb_tagcloud_tagcloud; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_tagcloud_tagcloud (
    id integer NOT NULL,
    tag character varying(100) NOT NULL,
    label character varying(100) NOT NULL,
    instanceid character varying(50) NOT NULL,
    externalid character varying(50) NOT NULL,
    externaltype integer NOT NULL
);


ALTER TABLE public.sb_tagcloud_tagcloud OWNER TO silverpeas;

--
-- Name: sb_thesaurus_jargon; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_thesaurus_jargon (
    id integer NOT NULL,
    type integer NOT NULL,
    idvoca integer NOT NULL,
    iduser character varying(50) NOT NULL
);


ALTER TABLE public.sb_thesaurus_jargon OWNER TO silverpeas;

--
-- Name: sb_thesaurus_synonym; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_thesaurus_synonym (
    id integer NOT NULL,
    idvoca integer NOT NULL,
    idtree integer NOT NULL,
    idterm integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.sb_thesaurus_synonym OWNER TO silverpeas;

--
-- Name: sb_thesaurus_vocabulary; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_thesaurus_vocabulary (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(2000) NOT NULL
);


ALTER TABLE public.sb_thesaurus_vocabulary OWNER TO silverpeas;

--
-- Name: sb_thumbnail_thumbnail; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_thumbnail_thumbnail (
    instanceid character varying(50) NOT NULL,
    objectid integer NOT NULL,
    objecttype integer NOT NULL,
    originalattachmentname character varying(250) NOT NULL,
    modifiedattachmentname character varying(250),
    mimetype character varying(250),
    xstart integer,
    ystart integer,
    xlength integer,
    ylength integer
);


ALTER TABLE public.sb_thumbnail_thumbnail OWNER TO silverpeas;

--
-- Name: sb_tree_tree; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_tree_tree (
    treeid integer NOT NULL,
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000),
    creationdate character(10) NOT NULL,
    creatorid character varying(255) NOT NULL,
    path character varying(1000) NOT NULL,
    levelnumber integer NOT NULL,
    fatherid integer NOT NULL,
    ordernumber integer,
    lang character(2)
);


ALTER TABLE public.sb_tree_tree OWNER TO silverpeas;

--
-- Name: sb_tree_treei18n; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_tree_treei18n (
    id integer NOT NULL,
    treeid integer NOT NULL,
    nodeid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.sb_tree_treei18n OWNER TO silverpeas;

--
-- Name: sb_variables_value; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_variables_value (
    id character varying(40) NOT NULL,
    variableid character varying(40) NOT NULL,
    value character varying(2000) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_variables_value OWNER TO silverpeas;

--
-- Name: sb_variables_variable; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_variables_variable (
    id character varying(40) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(2000),
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_variables_variable OWNER TO silverpeas;

--
-- Name: sb_webconnections_info; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_webconnections_info (
    connectionid integer NOT NULL,
    userid integer NOT NULL,
    componentid character varying(50) NOT NULL,
    paramlogin character varying(100) NOT NULL,
    parampassword bytea
);


ALTER TABLE public.sb_webconnections_info OWNER TO silverpeas;

--
-- Name: sb_workflow_activestate; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_activestate (
    id integer NOT NULL,
    instanceid integer NOT NULL,
    state character varying(50) NOT NULL,
    backstatus numeric(1,0) DEFAULT 0 NOT NULL,
    timeoutstatus numeric(1,0) DEFAULT 0 NOT NULL,
    timeoutdate timestamp without time zone
);


ALTER TABLE public.sb_workflow_activestate OWNER TO silverpeas;

--
-- Name: sb_workflow_error; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_error (
    id integer NOT NULL,
    instanceid integer NOT NULL,
    stepid integer,
    errormessage character varying(200),
    stacktrace character varying(4000),
    userid character varying(100),
    actionname character varying(100),
    actiondate timestamp without time zone,
    userrole character varying(100),
    statename character varying(100)
);


ALTER TABLE public.sb_workflow_error OWNER TO silverpeas;

--
-- Name: sb_workflow_historystep; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_historystep (
    instanceid integer NOT NULL,
    id integer NOT NULL,
    userid character varying(50),
    substituteid character varying(40),
    userrolename character varying(50),
    action character varying(50),
    actiondate timestamp without time zone,
    resolvedstate character varying(50),
    tostate character varying(50),
    actionstatus integer
);


ALTER TABLE public.sb_workflow_historystep OWNER TO silverpeas;

--
-- Name: sb_workflow_interesteduser; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_interesteduser (
    id integer NOT NULL,
    userid character varying(50),
    usersrole character varying(50),
    instanceid integer NOT NULL,
    state character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    groupid character varying(50)
);


ALTER TABLE public.sb_workflow_interesteduser OWNER TO silverpeas;

--
-- Name: sb_workflow_lockinguser; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_lockinguser (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    instanceid integer NOT NULL,
    state character varying(50) NOT NULL,
    lockdate timestamp without time zone
);


ALTER TABLE public.sb_workflow_lockinguser OWNER TO silverpeas;

--
-- Name: sb_workflow_processinstance; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_processinstance (
    instanceid integer NOT NULL,
    modelid character varying(50) NOT NULL,
    locked numeric(1,0) NOT NULL,
    errorstatus numeric(1,0) DEFAULT 0 NOT NULL,
    timeoutstatus numeric(1,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public.sb_workflow_processinstance OWNER TO silverpeas;

--
-- Name: sb_workflow_question; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_question (
    id integer NOT NULL,
    instanceid integer NOT NULL,
    questiontext character varying(500) NOT NULL,
    responsetext character varying(500),
    questiondate timestamp without time zone NOT NULL,
    responsedate timestamp without time zone,
    fromstate character varying(50) NOT NULL,
    targetstate character varying(50) NOT NULL,
    fromuserid character varying(50) NOT NULL,
    touserid character varying(50) NOT NULL,
    relevant numeric(1,0) NOT NULL
);


ALTER TABLE public.sb_workflow_question OWNER TO silverpeas;

--
-- Name: sb_workflow_replacements; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_replacements (
    id character varying(40) NOT NULL,
    incumbentid character varying(40) NOT NULL,
    substituteid character varying(40) NOT NULL,
    workflowid character varying(40) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_workflow_replacements OWNER TO silverpeas;

--
-- Name: sb_workflow_undo_step; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_undo_step (
    id integer NOT NULL,
    stepid integer NOT NULL,
    instanceid integer NOT NULL,
    action character varying(20) NOT NULL,
    parameters character varying(150) NOT NULL
);


ALTER TABLE public.sb_workflow_undo_step OWNER TO silverpeas;

--
-- Name: sb_workflow_userinfo; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_userinfo (
    id integer NOT NULL,
    settingsid integer NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(100)
);


ALTER TABLE public.sb_workflow_userinfo OWNER TO silverpeas;

--
-- Name: sb_workflow_usersettings; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_usersettings (
    settingsid integer NOT NULL,
    userid character varying(100) NOT NULL,
    peasid character varying(100) NOT NULL
);


ALTER TABLE public.sb_workflow_usersettings OWNER TO silverpeas;

--
-- Name: sb_workflow_workinguser; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sb_workflow_workinguser (
    id integer NOT NULL,
    userid character varying(50),
    usersrole character varying(50),
    instanceid integer NOT NULL,
    state character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    groupid character varying(50)
);


ALTER TABLE public.sb_workflow_workinguser OWNER TO silverpeas;

--
-- Name: sc_blog_post; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_blog_post (
    pubid integer NOT NULL,
    dateevent character(13) DEFAULT '0000000000000'::bpchar NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_blog_post OWNER TO silverpeas;

--
-- Name: sc_classifieds_classifieds; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_classifieds_classifieds (
    classifiedid integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(4000) NOT NULL,
    price integer,
    creatorid character varying(50) NOT NULL,
    creationdate character varying(13) NOT NULL,
    updatedate character varying(13),
    status character varying(50) NOT NULL,
    validatorid character varying(50),
    validatedate character varying(13)
);


ALTER TABLE public.sc_classifieds_classifieds OWNER TO silverpeas;

--
-- Name: sc_classifieds_subscribes; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_classifieds_subscribes (
    subscribeid integer NOT NULL,
    userid character varying(50) NOT NULL,
    instanceid character varying(50) NOT NULL,
    field1 character varying(100) NOT NULL,
    field2 character varying(100) NOT NULL
);


ALTER TABLE public.sc_classifieds_subscribes OWNER TO silverpeas;

--
-- Name: sc_community; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_community (
    id character varying(40) NOT NULL,
    instanceid character varying(30) NOT NULL,
    spaceid character varying(30) NOT NULL,
    groupid integer,
    homepage character varying(400),
    homepagetype integer,
    charterurl character varying(400)
);


ALTER TABLE public.sc_community OWNER TO silverpeas;

--
-- Name: sc_community_membership; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_community_membership (
    id character varying(40) NOT NULL,
    community character varying(40) NOT NULL,
    userid integer NOT NULL,
    status character varying(15) NOT NULL,
    joiningdate timestamp without time zone,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sc_community_membership OWNER TO silverpeas;

--
-- Name: sc_connecteurjdbc_connectinfo; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_connecteurjdbc_connectinfo (
    id integer NOT NULL,
    datasource character varying(250),
    login character varying(250),
    password character varying(250),
    sqlreq character varying(4000),
    rowlimit integer,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_connecteurjdbc_connectinfo OWNER TO silverpeas;

--
-- Name: sc_contact_groupfather; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_contact_groupfather (
    groupid integer NOT NULL,
    fatherid integer NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_contact_groupfather OWNER TO silverpeas;

--
-- Name: sc_delegatednews_news; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_delegatednews_news (
    pubid integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    status character varying(100) NOT NULL,
    contributorid character varying(50) NOT NULL,
    validatorid character varying(50),
    validationdate timestamp(0) without time zone,
    begindate timestamp(0) without time zone,
    enddate timestamp(0) without time zone,
    newsorder integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.sc_delegatednews_news OWNER TO silverpeas;

--
-- Name: sc_formsonline_forminstances; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_formsonline_forminstances (
    id integer NOT NULL,
    formid integer NOT NULL,
    state integer NOT NULL,
    creatorid character varying(20) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_formsonline_forminstances OWNER TO silverpeas;

--
-- Name: sc_formsonline_forminstvali; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_formsonline_forminstvali (
    id integer NOT NULL,
    forminstid integer NOT NULL,
    validationby character varying(40) NOT NULL,
    validationtype character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    validationdate timestamp without time zone NOT NULL,
    validationcomment character varying(4000) DEFAULT NULL::character varying,
    follower boolean DEFAULT false NOT NULL
);


ALTER TABLE public.sc_formsonline_forminstvali OWNER TO silverpeas;

--
-- Name: sc_formsonline_forms; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_formsonline_forms (
    id integer NOT NULL,
    xmlformname character varying(80) NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(1000),
    creationdate timestamp without time zone NOT NULL,
    state integer NOT NULL,
    instanceid character varying(80) NOT NULL,
    alreadyused smallint DEFAULT 0 NOT NULL,
    creatorid character varying(20) NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    hierarchicalvalidation boolean DEFAULT false NOT NULL,
    forminstexchangereceiver character varying(200) DEFAULT NULL::character varying,
    deleteafterforminstexchange boolean DEFAULT false NOT NULL
);


ALTER TABLE public.sc_formsonline_forms OWNER TO silverpeas;

--
-- Name: sc_formsonline_grouprights; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_formsonline_grouprights (
    formid integer NOT NULL,
    instanceid character varying(80) NOT NULL,
    groupid character varying(20) NOT NULL,
    righttype character varying(1) NOT NULL
);


ALTER TABLE public.sc_formsonline_grouprights OWNER TO silverpeas;

--
-- Name: sc_formsonline_userrights; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_formsonline_userrights (
    formid integer NOT NULL,
    instanceid character varying(80) NOT NULL,
    userid character varying(20) NOT NULL,
    righttype character varying(1) NOT NULL
);


ALTER TABLE public.sc_formsonline_userrights OWNER TO silverpeas;

--
-- Name: sc_forums_forum; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_forums_forum (
    forumid integer NOT NULL,
    forumname character varying(1000) NOT NULL,
    forumdescription character varying(2000),
    forumcreationdate character varying(50) NOT NULL,
    forumclosedate character varying(50),
    forumcreator character varying(255) NOT NULL,
    forumactive integer NOT NULL,
    forumparent integer DEFAULT 0 NOT NULL,
    forummodes character varying(50),
    forumlocklevel integer,
    instanceid character varying(50) NOT NULL,
    categoryid character varying(50)
);


ALTER TABLE public.sc_forums_forum OWNER TO silverpeas;

--
-- Name: sc_forums_historyuser; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_forums_historyuser (
    userid character varying(255) NOT NULL,
    messageid integer NOT NULL,
    lastaccess character varying(50) NOT NULL
);


ALTER TABLE public.sc_forums_historyuser OWNER TO silverpeas;

--
-- Name: sc_forums_message; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_forums_message (
    messageid integer NOT NULL,
    messagetitle character varying(1000) NOT NULL,
    messageauthor character varying(255) NOT NULL,
    forumid integer NOT NULL,
    messageparentid integer,
    messagedate timestamp without time zone,
    status character varying(50)
);


ALTER TABLE public.sc_forums_message OWNER TO silverpeas;

--
-- Name: sc_forums_rights; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_forums_rights (
    userid character varying(255) NOT NULL,
    forumid character varying(255) NOT NULL
);


ALTER TABLE public.sc_forums_rights OWNER TO silverpeas;

--
-- Name: sc_gallery_internal; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_internal (
    mediaid character varying(40) NOT NULL,
    filename character varying(255),
    filesize bigint,
    filemimetype character varying(100),
    download integer,
    begindownloaddate bigint,
    enddownloaddate bigint
);


ALTER TABLE public.sc_gallery_internal OWNER TO silverpeas;

--
-- Name: sc_gallery_media; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_media (
    mediaid character varying(40) NOT NULL,
    mediatype character varying(30) NOT NULL,
    instanceid character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    author character varying(50),
    keyword character varying(1000),
    beginvisibilitydate bigint DEFAULT '-2208992400000'::bigint NOT NULL,
    endvisibilitydate bigint DEFAULT '32503676399999'::bigint NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(50) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(50)
);


ALTER TABLE public.sc_gallery_media OWNER TO silverpeas;

--
-- Name: sc_gallery_order; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_order (
    orderid character varying(40) NOT NULL,
    userid character varying(40) NOT NULL,
    instanceid character varying(50) NOT NULL,
    createdate timestamp without time zone NOT NULL,
    processdate timestamp without time zone,
    processuser character varying(50)
);


ALTER TABLE public.sc_gallery_order OWNER TO silverpeas;

--
-- Name: sc_gallery_orderdetail; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_orderdetail (
    orderid character varying(40) NOT NULL,
    mediaid character varying(40) NOT NULL,
    instanceid character varying(50) NOT NULL,
    downloaddate timestamp without time zone,
    downloaddecision character varying(50)
);


ALTER TABLE public.sc_gallery_orderdetail OWNER TO silverpeas;

--
-- Name: sc_gallery_path; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_path (
    mediaid character varying(40) NOT NULL,
    instanceid character varying(50) NOT NULL,
    nodeid integer NOT NULL
);


ALTER TABLE public.sc_gallery_path OWNER TO silverpeas;

--
-- Name: sc_gallery_photo; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_photo (
    mediaid character varying(40) NOT NULL,
    resolutionw integer,
    resolutionh integer
);


ALTER TABLE public.sc_gallery_photo OWNER TO silverpeas;

--
-- Name: sc_gallery_sound; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_sound (
    mediaid character varying(40) NOT NULL,
    bitrate bigint,
    duration bigint
);


ALTER TABLE public.sc_gallery_sound OWNER TO silverpeas;

--
-- Name: sc_gallery_streaming; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_streaming (
    mediaid character varying(40) NOT NULL,
    homepageurl character varying(1000) NOT NULL,
    provider character varying(50) NOT NULL
);


ALTER TABLE public.sc_gallery_streaming OWNER TO silverpeas;

--
-- Name: sc_gallery_video; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_gallery_video (
    mediaid character varying(40) NOT NULL,
    resolutionw integer,
    resolutionh integer,
    bitrate bigint,
    duration bigint
);


ALTER TABLE public.sc_gallery_video OWNER TO silverpeas;

--
-- Name: sc_il_extsus; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_il_extsus (
    letter integer NOT NULL,
    email character varying(1000) NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_il_extsus OWNER TO silverpeas;

--
-- Name: sc_il_letter; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_il_letter (
    id integer NOT NULL,
    name character varying(1000) NOT NULL,
    description character varying(2000),
    periode character varying(255),
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_il_letter OWNER TO silverpeas;

--
-- Name: sc_il_publication; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_il_publication (
    id integer NOT NULL,
    title character varying(1000) NOT NULL,
    description character varying(2000),
    parutiondate character varying(255),
    publicationstate integer NOT NULL,
    letterid integer NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_il_publication OWNER TO silverpeas;

--
-- Name: sc_kmelia_search; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_kmelia_search (
    id bigint NOT NULL,
    instanceid character varying(50),
    topicid integer NOT NULL,
    userid integer NOT NULL,
    searchdate timestamp without time zone NOT NULL,
    language character varying(50),
    query character varying(255)
);


ALTER TABLE public.sc_kmelia_search OWNER TO silverpeas;

--
-- Name: sc_mailinglist_attachment; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_mailinglist_attachment (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    attachmentsize bigint,
    attachmentpath character varying(255),
    filename character varying(255),
    contenttype character varying(255),
    md5signature character varying(255),
    messageid character varying(255)
);


ALTER TABLE public.sc_mailinglist_attachment OWNER TO silverpeas;

--
-- Name: sc_mailinglist_external_user; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_mailinglist_external_user (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    componentid character varying(255),
    email character varying(255) NOT NULL,
    listid character varying(255)
);


ALTER TABLE public.sc_mailinglist_external_user OWNER TO silverpeas;

--
-- Name: sc_mailinglist_internal_sub; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_mailinglist_internal_sub (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    subscriber_type character varying(255) NOT NULL,
    externalid character varying(255) NOT NULL,
    mailinglistid character varying(255) NOT NULL
);


ALTER TABLE public.sc_mailinglist_internal_sub OWNER TO silverpeas;

--
-- Name: sc_mailinglist_list; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_mailinglist_list (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    componentid character varying(255)
);


ALTER TABLE public.sc_mailinglist_list OWNER TO silverpeas;

--
-- Name: sc_mailinglist_message; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_mailinglist_message (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    mailid character varying(255) NOT NULL,
    componentid character varying(255) NOT NULL,
    title character varying(255),
    summary character varying(255),
    sender character varying(255),
    sentdate timestamp without time zone,
    referenceid character varying(255),
    moderated boolean,
    contenttype character varying(255),
    attachmentssize bigint,
    messageyear integer,
    messagemonth integer,
    body text
);


ALTER TABLE public.sc_mailinglist_message OWNER TO silverpeas;

--
-- Name: sc_mydb_connectinfo; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_mydb_connectinfo (
    id integer NOT NULL,
    datasource character varying(250),
    login character varying(250),
    password character varying(250),
    tablename character varying(100),
    rowlimit integer,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_mydb_connectinfo OWNER TO silverpeas;

--
-- Name: sc_projectmanager_calendar; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_projectmanager_calendar (
    holidaydate character varying(10) NOT NULL,
    fatherid integer NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_projectmanager_calendar OWNER TO silverpeas;

--
-- Name: sc_projectmanager_resources; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_projectmanager_resources (
    id integer NOT NULL,
    taskid integer NOT NULL,
    resourceid integer NOT NULL,
    charge integer NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_projectmanager_resources OWNER TO silverpeas;

--
-- Name: sc_projectmanager_tasks; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_projectmanager_tasks (
    id integer NOT NULL,
    mereid integer,
    chrono integer NOT NULL,
    nom character varying(100) NOT NULL,
    description character varying(500),
    organisateurid integer NOT NULL,
    responsableid integer NOT NULL,
    charge double precision,
    consomme double precision,
    raf double precision,
    avancement integer,
    statut integer,
    datedebut character varying(10) NOT NULL,
    datefin character varying(10) NOT NULL,
    codeprojet character varying(50),
    descriptionprojet character varying(100),
    estdecomposee integer,
    instanceid character varying(50) NOT NULL,
    path character varying(50) NOT NULL,
    previousid integer
);


ALTER TABLE public.sc_projectmanager_tasks OWNER TO silverpeas;

--
-- Name: sc_questionreply_question; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_questionreply_question (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    content character varying(2000),
    creatorid character varying(50) NOT NULL,
    creationdate character varying(10) NOT NULL,
    status integer NOT NULL,
    publicreplynumber integer NOT NULL,
    privatereplynumber integer NOT NULL,
    replynumber integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    categoryid character varying(50)
);


ALTER TABLE public.sc_questionreply_question OWNER TO silverpeas;

--
-- Name: sc_questionreply_recipient; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_questionreply_recipient (
    id integer NOT NULL,
    questionid integer NOT NULL,
    userid character varying(50) NOT NULL
);


ALTER TABLE public.sc_questionreply_recipient OWNER TO silverpeas;

--
-- Name: sc_questionreply_reply; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_questionreply_reply (
    id integer NOT NULL,
    questionid integer NOT NULL,
    title character varying(300) NOT NULL,
    content character varying(2000),
    creatorid character varying(50) NOT NULL,
    creationdate character varying(10) NOT NULL,
    publicreply integer NOT NULL,
    privatereply integer NOT NULL
);


ALTER TABLE public.sc_questionreply_reply OWNER TO silverpeas;

--
-- Name: sc_quickinfo_news; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_quickinfo_news (
    id character varying(40) NOT NULL,
    instanceid character varying(30) NOT NULL,
    foreignid character varying(40) NOT NULL,
    important boolean NOT NULL,
    broadcastticker boolean NOT NULL,
    broadcastmandatory boolean NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    publishdate timestamp without time zone,
    publishedby character varying(40),
    version bigint NOT NULL
);


ALTER TABLE public.sc_quickinfo_news OWNER TO silverpeas;

--
-- Name: sc_resources_category; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_resources_category (
    id bigint NOT NULL,
    instanceid character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    creationdate character varying(20) NOT NULL,
    updatedate character varying(20) NOT NULL,
    bookable integer,
    form character varying(50),
    responsibleid integer,
    createrid character varying(50),
    updaterid character varying(50),
    description character varying(2000)
);


ALTER TABLE public.sc_resources_category OWNER TO silverpeas;

--
-- Name: sc_resources_managers; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_resources_managers (
    resourceid bigint NOT NULL,
    managerid bigint NOT NULL
);


ALTER TABLE public.sc_resources_managers OWNER TO silverpeas;

--
-- Name: sc_resources_reservation; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_resources_reservation (
    id bigint NOT NULL,
    instanceid character varying(50) NOT NULL,
    evenement character varying(128) NOT NULL,
    userid integer NOT NULL,
    creationdate character varying(20) NOT NULL,
    updatedate character varying(20) NOT NULL,
    begindate character varying(20) NOT NULL,
    enddate character varying(20) NOT NULL,
    reason character varying(2000),
    place character varying(128),
    status character varying(50)
);


ALTER TABLE public.sc_resources_reservation OWNER TO silverpeas;

--
-- Name: sc_resources_reservedresource; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_resources_reservedresource (
    reservationid bigint NOT NULL,
    resourceid bigint NOT NULL,
    status character varying(50)
);


ALTER TABLE public.sc_resources_reservedresource OWNER TO silverpeas;

--
-- Name: sc_resources_resource; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_resources_resource (
    id bigint NOT NULL,
    instanceid character varying(50) NOT NULL,
    categoryid bigint NOT NULL,
    name character varying(128) NOT NULL,
    creationdate character varying(20) NOT NULL,
    updatedate character varying(20) NOT NULL,
    bookable integer,
    responsibleid integer,
    createrid character varying(50),
    updaterid character varying(50),
    description character varying(2000)
);


ALTER TABLE public.sc_resources_resource OWNER TO silverpeas;

--
-- Name: sc_rss_channels; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_rss_channels (
    id integer NOT NULL,
    url character varying(1000) NOT NULL,
    safeurl boolean DEFAULT false NOT NULL,
    refreshrate integer NOT NULL,
    nbdisplayeditems integer NOT NULL,
    displayimage integer NOT NULL,
    creatorid character varying(100) NOT NULL,
    creationdate character(10) NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_rss_channels OWNER TO silverpeas;

--
-- Name: sc_scheduleevent_contributor; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_scheduleevent_contributor (
    id character varying(255) NOT NULL,
    scheduleeventid character varying(255) NOT NULL,
    userid integer NOT NULL,
    lastvalidation timestamp without time zone,
    lastvisit timestamp without time zone
);


ALTER TABLE public.sc_scheduleevent_contributor OWNER TO silverpeas;

--
-- Name: sc_scheduleevent_list; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_scheduleevent_list (
    id character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(4000),
    creationdate timestamp without time zone NOT NULL,
    status integer NOT NULL,
    creatorid integer NOT NULL
);


ALTER TABLE public.sc_scheduleevent_list OWNER TO silverpeas;

--
-- Name: sc_scheduleevent_options; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_scheduleevent_options (
    id character varying(255) NOT NULL,
    scheduleeventid character varying(255) NOT NULL,
    optionday timestamp without time zone NOT NULL,
    optionhour integer NOT NULL
);


ALTER TABLE public.sc_scheduleevent_options OWNER TO silverpeas;

--
-- Name: sc_scheduleevent_response; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_scheduleevent_response (
    id character varying(255) NOT NULL,
    scheduleeventid character varying(255) NOT NULL,
    userid integer NOT NULL,
    optionid character varying(255) NOT NULL
);


ALTER TABLE public.sc_scheduleevent_response OWNER TO silverpeas;

--
-- Name: sc_silvercrawler_statistic; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_silvercrawler_statistic (
    datedownload character(13) NOT NULL,
    userid character varying(100) NOT NULL,
    path character varying(1000) NOT NULL,
    componentid character varying(50) NOT NULL,
    objecttype character varying(50) NOT NULL
);


ALTER TABLE public.sc_silvercrawler_statistic OWNER TO silverpeas;

--
-- Name: sc_suggestion; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_suggestion (
    id character varying(40) NOT NULL,
    suggestionboxid character varying(40) NOT NULL,
    title character varying(2000) NOT NULL,
    status character varying(20) NOT NULL,
    validationdate timestamp without time zone,
    validationcomment character varying(2000),
    validationby character varying(40),
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sc_suggestion OWNER TO silverpeas;

--
-- Name: sc_suggestion_box; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_suggestion_box (
    id character varying(40) NOT NULL,
    instanceid character varying(30) NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sc_suggestion_box OWNER TO silverpeas;

--
-- Name: sc_whitepages_card; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_whitepages_card (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    hidestatus integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    creationdate character(10) DEFAULT '2003/01/01'::bpchar NOT NULL,
    creatorid integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.sc_whitepages_card OWNER TO silverpeas;

--
-- Name: sc_whitepages_searchfields; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sc_whitepages_searchfields (
    id character varying(255) NOT NULL,
    instanceid character varying(50) NOT NULL,
    fieldid character varying(50) NOT NULL
);


ALTER TABLE public.sc_whitepages_searchfields OWNER TO silverpeas;

--
-- Name: sr_packages; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.sr_packages (
    sr_package character varying(32) NOT NULL,
    sr_version character(3) NOT NULL
);


ALTER TABLE public.sr_packages OWNER TO silverpeas;

--
-- Name: st_accesslevel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_accesslevel (
    id character(1) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.st_accesslevel OWNER TO silverpeas;

--
-- Name: st_componentinstance; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_componentinstance (
    id integer NOT NULL,
    spaceid integer NOT NULL,
    name character varying(100) NOT NULL,
    componentname character varying(100) NOT NULL,
    description character varying(400),
    createdby integer,
    ordernum integer DEFAULT 0 NOT NULL,
    createtime character varying(20),
    updatetime character varying(20),
    removetime character varying(20),
    componentstatus character(1),
    updatedby integer,
    removedby integer,
    ispublic integer DEFAULT 0 NOT NULL,
    ishidden integer DEFAULT 0 NOT NULL,
    lang character(2),
    isinheritanceblocked integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.st_componentinstance OWNER TO silverpeas;

--
-- Name: st_componentinstancei18n; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_componentinstancei18n (
    id integer NOT NULL,
    componentid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(400)
);


ALTER TABLE public.st_componentinstancei18n OWNER TO silverpeas;

--
-- Name: st_datereminder; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_datereminder (
    id character varying(40) NOT NULL,
    resourcetype character varying(50) NOT NULL,
    resourceid character varying(50) NOT NULL,
    datereminder timestamp without time zone NOT NULL,
    message character varying(2000),
    processstatus integer DEFAULT 0 NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.st_datereminder OWNER TO silverpeas;

--
-- Name: st_delayednotification; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_delayednotification (
    id bigint NOT NULL,
    userid integer NOT NULL,
    fromuserid integer NOT NULL,
    channel integer NOT NULL,
    action integer NOT NULL,
    notificationresourceid bigint NOT NULL,
    language character varying(2) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    message character varying(10000)
);


ALTER TABLE public.st_delayednotification OWNER TO silverpeas;

--
-- Name: st_delayednotifusersetting; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_delayednotifusersetting (
    id integer NOT NULL,
    userid integer NOT NULL,
    channel integer NOT NULL,
    frequency character varying(4) NOT NULL
);


ALTER TABLE public.st_delayednotifusersetting OWNER TO silverpeas;

--
-- Name: st_domain; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_domain (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(400),
    propfilename character varying(100) NOT NULL,
    classname character varying(100) NOT NULL,
    authenticationserver character varying(100) NOT NULL,
    thetimestamp character varying(100) DEFAULT '0'::character varying NOT NULL,
    silverpeasserverurl character varying(400)
);


ALTER TABLE public.st_domain OWNER TO silverpeas;

--
-- Name: st_formdesigner_connectors; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_formdesigner_connectors (
    id integer NOT NULL,
    name character varying(1000) NOT NULL,
    description character varying(2000) NOT NULL,
    driver character varying(1000) NOT NULL,
    url character varying(1000) NOT NULL,
    login character varying(1000) NOT NULL,
    passwd character varying(1000),
    sqlquery character varying(4000) NOT NULL,
    type character varying(50) NOT NULL
);


ALTER TABLE public.st_formdesigner_connectors OWNER TO silverpeas;

--
-- Name: st_formdesigner_formdesign; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_formdesigner_formdesign (
    id integer NOT NULL,
    refidform integer NOT NULL,
    componentid character varying(100) NOT NULL,
    name character varying(1000) NOT NULL,
    description character varying(2000) NOT NULL,
    creationdate character varying(10) NOT NULL,
    author integer NOT NULL
);


ALTER TABLE public.st_formdesigner_formdesign OWNER TO silverpeas;

--
-- Name: st_formeditor_formedited; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_formeditor_formedited (
    id integer NOT NULL,
    formid integer NOT NULL,
    userid integer NOT NULL,
    createdate character varying(10) NOT NULL,
    modifydate character varying(10) NOT NULL
);


ALTER TABLE public.st_formeditor_formedited OWNER TO silverpeas;

--
-- Name: st_formeditor_formediteddata; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_formeditor_formediteddata (
    id integer NOT NULL,
    formeditedid integer NOT NULL,
    editedkey character varying(50) NOT NULL,
    editedvalue character varying(500) NOT NULL
);


ALTER TABLE public.st_formeditor_formediteddata OWNER TO silverpeas;

--
-- Name: st_group; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_group (
    id integer NOT NULL,
    domainid integer NOT NULL,
    specificid character varying(500) NOT NULL,
    supergroupid integer,
    name character varying(100) NOT NULL,
    description character varying(400),
    synchrorule character varying(2000),
    creationdate timestamp without time zone,
    savedate timestamp without time zone,
    state character varying(30) NOT NULL,
    statesavedate timestamp without time zone NOT NULL
);


ALTER TABLE public.st_group OWNER TO silverpeas;

--
-- Name: st_group_user_rel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_group_user_rel (
    groupid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_group_user_rel OWNER TO silverpeas;

--
-- Name: st_groupuserrole; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_groupuserrole (
    id integer NOT NULL,
    groupid integer NOT NULL,
    rolename character varying(100) NOT NULL
);


ALTER TABLE public.st_groupuserrole OWNER TO silverpeas;

--
-- Name: st_groupuserrole_group_rel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_groupuserrole_group_rel (
    groupuserroleid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.st_groupuserrole_group_rel OWNER TO silverpeas;

--
-- Name: st_groupuserrole_user_rel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_groupuserrole_user_rel (
    groupuserroleid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_groupuserrole_user_rel OWNER TO silverpeas;

--
-- Name: st_instance_data; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_instance_data (
    id integer NOT NULL,
    componentid integer NOT NULL,
    name character varying(100) NOT NULL,
    label character varying(100) NOT NULL,
    value character varying(1000)
);


ALTER TABLE public.st_instance_data OWNER TO silverpeas;

--
-- Name: st_instance_modelused; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_instance_modelused (
    instanceid character varying(50) NOT NULL,
    modelid character varying(50) NOT NULL,
    objectid character varying(50) DEFAULT '0'::character varying NOT NULL
);


ALTER TABLE public.st_instance_modelused OWNER TO silverpeas;

--
-- Name: st_keystore; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_keystore (
    userkey numeric(18,0) NOT NULL,
    login character varying(100) NOT NULL,
    domainid integer NOT NULL
);


ALTER TABLE public.st_keystore OWNER TO silverpeas;

--
-- Name: st_longtext; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_longtext (
    id integer NOT NULL,
    ordernum integer NOT NULL,
    bodycontent character varying(2000) NOT NULL
);


ALTER TABLE public.st_longtext OWNER TO silverpeas;

--
-- Name: st_notifaddress; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_notifaddress (
    id integer NOT NULL,
    userid integer NOT NULL,
    notifname character varying(20) NOT NULL,
    notifchannelid integer NOT NULL,
    address character varying(250) NOT NULL,
    usage character varying(20),
    priority integer NOT NULL
);


ALTER TABLE public.st_notifaddress OWNER TO silverpeas;

--
-- Name: st_notifchannel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_notifchannel (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(200),
    couldbeadded character(1) DEFAULT 'Y'::bpchar NOT NULL,
    fromavailable character(1) DEFAULT 'N'::bpchar NOT NULL,
    subjectavailable character(1) DEFAULT 'N'::bpchar NOT NULL
);


ALTER TABLE public.st_notifchannel OWNER TO silverpeas;

--
-- Name: st_notifdefaultaddress; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_notifdefaultaddress (
    id integer NOT NULL,
    userid integer NOT NULL,
    notifaddressid integer NOT NULL
);


ALTER TABLE public.st_notifdefaultaddress OWNER TO silverpeas;

--
-- Name: st_notificationresource; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_notificationresource (
    id bigint NOT NULL,
    componentinstanceid character varying(50) NOT NULL,
    resourceid character varying(500) NOT NULL,
    resourcetype character varying(50) NOT NULL,
    resourcename character varying(500) NOT NULL,
    resourcedescription character varying(2000),
    resourcelocation character varying(500) NOT NULL,
    resourceurl character varying(1000),
    attachmenttargetid character varying(500),
    resourcedetails character varying(8000)
);


ALTER TABLE public.st_notificationresource OWNER TO silverpeas;

--
-- Name: st_notifpreference; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_notifpreference (
    id integer NOT NULL,
    notifaddressid integer NOT NULL,
    componentinstanceid integer NOT NULL,
    userid integer NOT NULL,
    messagetype integer NOT NULL
);


ALTER TABLE public.st_notifpreference OWNER TO silverpeas;

--
-- Name: st_notifsended; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_notifsended (
    notifid integer NOT NULL,
    userid integer NOT NULL,
    messagetype integer,
    notifdate character(13) NOT NULL,
    title character varying(1024),
    link character varying(255),
    sessionid character varying(255),
    componentid character varying(255),
    body integer
);


ALTER TABLE public.st_notifsended OWNER TO silverpeas;

--
-- Name: st_notifsendedreceiver; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_notifsendedreceiver (
    notifid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_notifsendedreceiver OWNER TO silverpeas;

--
-- Name: st_popupmessage; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_popupmessage (
    id integer NOT NULL,
    userid integer NOT NULL,
    body character varying(4000),
    senderid character varying(10),
    sendername character varying(200),
    answerallowed character(1) DEFAULT '0'::bpchar,
    source character varying(255),
    url character varying(255),
    msgdate character varying(10),
    msgtime character varying(5)
);


ALTER TABLE public.st_popupmessage OWNER TO silverpeas;

--
-- Name: st_quota; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_quota (
    id bigint NOT NULL,
    quotatype character varying(50) NOT NULL,
    resourceid character varying(50) NOT NULL,
    mincount bigint NOT NULL,
    maxcount bigint NOT NULL,
    currentcount bigint NOT NULL,
    savedate timestamp without time zone NOT NULL
);


ALTER TABLE public.st_quota OWNER TO silverpeas;

--
-- Name: st_servermessage; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_servermessage (
    id integer NOT NULL,
    userid integer NOT NULL,
    header character varying(255),
    subject character varying(1024),
    body character varying(4000),
    sessionid character varying(255),
    type character(1)
);


ALTER TABLE public.st_servermessage OWNER TO silverpeas;

--
-- Name: st_silvermailmessage; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_silvermailmessage (
    id integer NOT NULL,
    userid integer NOT NULL,
    folderid integer,
    header character varying(255),
    sendername character varying(255),
    subject character varying(1024),
    body character varying(4000),
    source character varying(255),
    url character varying(255),
    datemsg character varying(255),
    readen integer NOT NULL
);


ALTER TABLE public.st_silvermailmessage OWNER TO silverpeas;

--
-- Name: st_space; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_space (
    id integer NOT NULL,
    domainfatherid integer,
    name character varying(100) NOT NULL,
    description character varying(400),
    createdby integer,
    firstpagetype integer NOT NULL,
    firstpageextraparam character varying(400),
    ordernum integer DEFAULT 0 NOT NULL,
    createtime character varying(20),
    updatetime character varying(20),
    removetime character varying(20),
    spacestatus character(1),
    updatedby integer,
    removedby integer,
    lang character(2),
    isinheritanceblocked integer DEFAULT 0 NOT NULL,
    look character varying(50),
    displayspacefirst smallint,
    ispersonal smallint
);


ALTER TABLE public.st_space OWNER TO silverpeas;

--
-- Name: st_spacei18n; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_spacei18n (
    id integer NOT NULL,
    spaceid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(400)
);


ALTER TABLE public.st_spacei18n OWNER TO silverpeas;

--
-- Name: st_spaceuserrole; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_spaceuserrole (
    id integer NOT NULL,
    spaceid integer NOT NULL,
    name character varying(100),
    rolename character varying(100) NOT NULL,
    description character varying(400),
    isinherited integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.st_spaceuserrole OWNER TO silverpeas;

--
-- Name: st_spaceuserrole_group_rel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_spaceuserrole_group_rel (
    spaceuserroleid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.st_spaceuserrole_group_rel OWNER TO silverpeas;

--
-- Name: st_spaceuserrole_user_rel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_spaceuserrole_user_rel (
    spaceuserroleid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_spaceuserrole_user_rel OWNER TO silverpeas;

--
-- Name: st_token; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_token (
    id bigint NOT NULL,
    tokentype character varying(50) NOT NULL,
    resourceid character varying(50) NOT NULL,
    token character varying(50) NOT NULL,
    savecount integer NOT NULL,
    savedate timestamp without time zone NOT NULL
);


ALTER TABLE public.st_token OWNER TO silverpeas;

--
-- Name: st_user; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_user (
    id integer NOT NULL,
    domainid integer NOT NULL,
    specificid character varying(500) NOT NULL,
    firstname character varying(100),
    lastname character varying(100) NOT NULL,
    email character varying(100),
    login character varying(100) NOT NULL,
    loginmail character varying(100),
    accesslevel character(1) DEFAULT 'U'::bpchar NOT NULL,
    loginquestion character varying(200),
    loginanswer character varying(200),
    creationdate timestamp without time zone,
    savedate timestamp without time zone,
    version integer DEFAULT 0 NOT NULL,
    tosacceptancedate timestamp without time zone,
    lastlogindate timestamp without time zone,
    nbsuccessfulloginattempts integer DEFAULT 0 NOT NULL,
    lastlogincredentialupdatedate timestamp without time zone,
    expirationdate timestamp without time zone,
    state character varying(30) NOT NULL,
    statesavedate timestamp without time zone NOT NULL,
    notifmanualreceiverlimit integer,
    sensitivedata boolean DEFAULT false NOT NULL
);


ALTER TABLE public.st_user OWNER TO silverpeas;

--
-- Name: st_userfavoritespaces; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_userfavoritespaces (
    id integer NOT NULL,
    userid integer NOT NULL,
    spaceid integer NOT NULL
);


ALTER TABLE public.st_userfavoritespaces OWNER TO silverpeas;

--
-- Name: st_userrole; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_userrole (
    id integer NOT NULL,
    instanceid integer NOT NULL,
    name character varying(100),
    rolename character varying(100) NOT NULL,
    description character varying(400),
    isinherited integer DEFAULT 0 NOT NULL,
    objectid integer,
    objecttype character varying(50)
);


ALTER TABLE public.st_userrole OWNER TO silverpeas;

--
-- Name: st_userrole_group_rel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_userrole_group_rel (
    userroleid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.st_userrole_group_rel OWNER TO silverpeas;

--
-- Name: st_userrole_user_rel; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.st_userrole_user_rel (
    userroleid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_userrole_user_rel OWNER TO silverpeas;

--
-- Name: subscribe; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.subscribe (
    subscriberid character varying(100) NOT NULL,
    subscribertype character varying(50) NOT NULL,
    subscriptionmethod character varying(50) NOT NULL,
    resourceid character varying(100) NOT NULL,
    resourcetype character varying(50) NOT NULL,
    space character varying(50) NOT NULL,
    instanceid character varying(50) NOT NULL,
    creatorid character varying(100) NOT NULL,
    creationdate timestamp without time zone NOT NULL
);


ALTER TABLE public.subscribe OWNER TO silverpeas;

--
-- Name: uniqueid; Type: TABLE; Schema: public; Owner: silverpeas
--

CREATE TABLE public.uniqueid (
    maxid bigint NOT NULL,
    tablename character varying(100) NOT NULL
);


ALTER TABLE public.uniqueid OWNER TO silverpeas;

--
-- Data for Name: calendarcategory; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.calendarcategory (categoryid, name) FROM stdin;
1	Réunion
2	Déplacement
3	Vacances
4	Personnel
5	Brain Storming
6	Formation
\.


--
-- Data for Name: calendarjournal; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.calendarjournal (id, name, description, delegatorid, startday, endday, starthour, endhour, classification, priority, lastmodification, externalid) FROM stdin;
\.


--
-- Data for Name: calendarjournalattendee; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.calendarjournalattendee (journalid, userid, participationstatus) FROM stdin;
\.


--
-- Data for Name: calendarjournalcategory; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.calendarjournalcategory (journalid, categoryid) FROM stdin;
\.


--
-- Data for Name: calendartodo; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.calendartodo (id, name, description, delegatorid, startday, endday, starthour, endhour, classification, priority, lastmodification, percentcompleted, completedday, duration, componentid, spaceid, externalid) FROM stdin;
\.


--
-- Data for Name: calendartodoattendee; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.calendartodoattendee (todoid, userid, participationstatus) FROM stdin;
\.


--
-- Data for Name: days; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.days (day) FROM stdin;
01
02
03
04
05
06
07
08
09
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
\.


--
-- Data for Name: domainsp_group; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.domainsp_group (id, supergroupid, name, description) FROM stdin;
\.


--
-- Data for Name: domainsp_group_user_rel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.domainsp_group_user_rel (groupid, userid) FROM stdin;
\.


--
-- Data for Name: domainsp_user; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.domainsp_user (id, firstname, lastname, phone, homephone, cellphone, fax, address, title, company, "position", boss, login, password, passwordvalid, loginmail, email) FROM stdin;
0	\N	Silverpeas Admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	silverpeas	$6$m12Is8OTd4kq5$8tmYIwEook2gfwX/IskwTEMYy55qgwo6ukZao29wK5n3CxJNnOsfyxqxwDRT6fz.FLDW7jUfpafBn/nPa5vuo/	Y	\N	silverpeas@localhost
1	\N	SilverAdmin	\N	\N	\N	\N	\N	\N	\N	\N	\N	SilverAdmin	$6$m12Is8OTd4kq5$8tmYIwEook2gfwX/IskwTEMYy55qgwo6ukZao29wK5n3CxJNnOsfyxqxwDRT6fz.FLDW7jUfpafBn/nPa5vuo/	Y	\N	silveradmin@localhost
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.model (id, name, description, imagename, htmldisplayer, htmleditor, partid) FROM stdin;
\.


--
-- Data for Name: model_contact; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.model_contact (id, name, description, imagename, htmldisplayer, htmleditor) FROM stdin;
\.


--
-- Data for Name: pdcaxisvalue; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.pdcaxisvalue (valueid, axisid) FROM stdin;
\.


--
-- Data for Name: pdcclassification; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.pdcclassification (id, contentid, instanceid, modifiable, nodeid) FROM stdin;
\.


--
-- Data for Name: pdcclassification_pdcposition; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.pdcclassification_pdcposition (pdcclassification_id, positions_id) FROM stdin;
\.


--
-- Data for Name: pdcposition; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.pdcposition (id) FROM stdin;
\.


--
-- Data for Name: pdcposition_pdcaxisvalue; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.pdcposition_pdcaxisvalue (pdcposition_id, axisvalues_valueid, axisvalues_axisid) FROM stdin;
\.


--
-- Data for Name: permalinks_document; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.permalinks_document (documentid, documentuuid) FROM stdin;
\.


--
-- Data for Name: permalinks_version; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.permalinks_version (versionid, versionuuid) FROM stdin;
\.


--
-- Data for Name: personalization; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.personalization (id, languages, zoneid, look, personalwspace, thesaurusstatus, draganddropstatus, webdaveditingstatus, menudisplay) FROM stdin;
\.


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
PersistentQuartzScheduler	TRIGGER_ACCESS
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
\.


--
-- Data for Name: readingcontrol; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.readingcontrol (pubid, actorid, space, componentname) FROM stdin;
\.


--
-- Data for Name: sb_agenda_holidays; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_agenda_holidays (userid, holidaydate) FROM stdin;
\.


--
-- Data for Name: sb_agenda_import_settings; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_agenda_import_settings (userid, hostname, synchrotype, synchrodelay, url, remotelogin, remotepwd, charset) FROM stdin;
\.


--
-- Data for Name: sb_cal_attendees; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_attendees (id, attendeeid, componentid, type, participation, presence, delegate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sb_cal_attributes; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_attributes (id, name, value) FROM stdin;
\.


--
-- Data for Name: sb_cal_calendar; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_calendar (id, instanceid, title, zoneid, externalurl, synchrodate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sb_cal_categories; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_categories (id, category) FROM stdin;
\.


--
-- Data for Name: sb_cal_components; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_components (id, calendarid, startdate, enddate, indays, title, description, location, attributes, priority, sequence, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sb_cal_event; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_event (id, externalid, synchrodate, componentid, visibility, recurrenceid) FROM stdin;
\.


--
-- Data for Name: sb_cal_occurrences; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_occurrences (id, eventid, componentid) FROM stdin;
\.


--
-- Data for Name: sb_cal_recurrence; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_recurrence (id, recur_periodinterval, recur_periodunit, recur_count, recur_enddate) FROM stdin;
\.


--
-- Data for Name: sb_cal_recurrence_dayofweek; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_recurrence_dayofweek (recurrenceid, recur_nth, recur_dayofweek) FROM stdin;
\.


--
-- Data for Name: sb_cal_recurrence_exception; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_cal_recurrence_exception (recurrenceid, recur_exceptiondate) FROM stdin;
\.


--
-- Data for Name: sb_classifyengine_classify; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_classifyengine_classify (positionid, objectid, axis0, axis1, axis2, axis3, axis4, axis5, axis6, axis7, axis8, axis9, axis10, axis11, axis12, axis13, axis14, axis15, axis16, axis17, axis18, axis19, axis20, axis21, axis22, axis23, axis24, axis25, axis26, axis27, axis28, axis29, axis30, axis31, axis32, axis33, axis34, axis35, axis36, axis37, axis38, axis39, axis40, axis41, axis42, axis43, axis44, axis45, axis46, axis47, axis48, axis49) FROM stdin;
-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1
\.


--
-- Data for Name: sb_comment_comment; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_comment_comment (commentid, commentownerid, commentcreationdate, commentmodificationdate, commentcomment, instanceid, resourcetype, resourceid) FROM stdin;
\.


--
-- Data for Name: sb_contact_contact; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_contact_contact (contactid, contactfirstname, contactlastname, contactemail, contactphone, contactfax, userid, contactcreationdate, contactcreatorid, instanceid) FROM stdin;
\.


--
-- Data for Name: sb_contact_contactfather; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_contact_contactfather (contactid, nodeid) FROM stdin;
\.


--
-- Data for Name: sb_contact_info; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_contact_info (infoid, contactid, modelid, instanceid) FROM stdin;
\.


--
-- Data for Name: sb_containermanager_instance; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_containermanager_instance (instanceid, componentid, containertype, contenttype) FROM stdin;
\.


--
-- Data for Name: sb_containermanager_links; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_containermanager_links (positionid, containerinstanceid) FROM stdin;
\.


--
-- Data for Name: sb_contentmanager_content; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_contentmanager_content (silvercontentid, internalcontentid, contentinstanceid, authorid, creationdate, begindate, enddate, isvisible) FROM stdin;
\.


--
-- Data for Name: sb_contentmanager_instance; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_contentmanager_instance (instanceid, componentid, containertype, contenttype) FROM stdin;
\.


--
-- Data for Name: sb_contribution_tracking; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_contribution_tracking (id, context, contrib_id, contrib_type, contrib_instanceid, action_type, action_date, action_by) FROM stdin;
\.


--
-- Data for Name: sb_coordinates_coordinates; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_coordinates_coordinates (coordinatesid, nodeid, coordinatesleaf, coordinatesdisplayorder, instanceid) FROM stdin;
\.


--
-- Data for Name: sb_filesharing_history; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_filesharing_history (id, keyfile, downloaddate, downloadip) FROM stdin;
\.


--
-- Data for Name: sb_filesharing_ticket; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_filesharing_ticket (shared_object, componentid, creatorid, creationdate, updateid, updatedate, enddate, nbaccessmax, nbaccess, keyfile, shared_object_type) FROM stdin;
\.


--
-- Data for Name: sb_formtemplate_record; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_formtemplate_record (recordid, templateid, externalid, lang) FROM stdin;
\.


--
-- Data for Name: sb_formtemplate_template; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_formtemplate_template (templateid, externalid, templatename) FROM stdin;
\.


--
-- Data for Name: sb_formtemplate_templatefield; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_formtemplate_templatefield (templateid, fieldname, fieldindex, fieldtype, ismandatory, isreadonly, ishidden) FROM stdin;
\.


--
-- Data for Name: sb_formtemplate_textfield; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_formtemplate_textfield (recordid, fieldname, fieldvalue, fieldvalueindex) FROM stdin;
\.


--
-- Data for Name: sb_interests; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_interests (id, name, criteria, workspaceid, peasid, authorid, afterdate, beforedate, ownerid) FROM stdin;
\.


--
-- Data for Name: sb_interests_axis; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_interests_axis (id, icid, axisid, value) FROM stdin;
\.


--
-- Data for Name: sb_mylinks_cat; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_mylinks_cat (catid, name, description, userid, "position") FROM stdin;
\.


--
-- Data for Name: sb_mylinks_link; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_mylinks_link (linkid, name, description, url, visible, popup, userid, instanceid, objectid, "position") FROM stdin;
\.


--
-- Data for Name: sb_mylinks_linkcat; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_mylinks_linkcat (linkid, catid) FROM stdin;
\.


--
-- Data for Name: sb_node_node; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_node_node (nodeid, nodename, nodedescription, nodecreationdate, nodecreatorid, nodepath, nodelevelnumber, nodefatherid, modelid, nodestatus, instanceid, type, ordernumber, lang, rightsdependson) FROM stdin;
\.


--
-- Data for Name: sb_node_nodei18n; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_node_nodei18n (id, nodeid, lang, nodename, nodedescription) FROM stdin;
\.


--
-- Data for Name: sb_notation_notation; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_notation_notation (id, instanceid, externalid, externaltype, author, note) FROM stdin;
\.


--
-- Data for Name: sb_pdc_axis; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_pdc_axis (id, rootid, name, axistype, axisorder, creationdate, creatorid, description, lang) FROM stdin;
\.


--
-- Data for Name: sb_pdc_axisi18n; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_pdc_axisi18n (id, axisid, lang, name, description) FROM stdin;
\.


--
-- Data for Name: sb_pdc_group_rights; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_pdc_group_rights (axisid, valueid, groupid) FROM stdin;
\.


--
-- Data for Name: sb_pdc_subscription; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_pdc_subscription (id, name, ownerid) FROM stdin;
\.


--
-- Data for Name: sb_pdc_subscription_axis; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_pdc_subscription_axis (id, pdcsubscriptionid, axisid, value) FROM stdin;
\.


--
-- Data for Name: sb_pdc_user_rights; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_pdc_user_rights (axisid, valueid, userid) FROM stdin;
\.


--
-- Data for Name: sb_pdc_utilization; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_pdc_utilization (id, instanceid, axisid, basevalue, mandatory, variant) FROM stdin;
\.


--
-- Data for Name: sb_publication_publi; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_publication_publi (pubid, infoid, pubname, pubdescription, pubcreationdate, pubbegindate, pubenddate, pubcreatorid, pubimportance, pubversion, pubkeywords, pubcontent, pubstatus, pubupdatedate, instanceid, pubupdaterid, pubvalidatedate, pubvalidatorid, pubbeginhour, pubendhour, pubauthor, pubtargetvalidatorid, pubcloneid, pubclonestatus, lang, pubdraftoutdate) FROM stdin;
\.


--
-- Data for Name: sb_publication_publifather; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_publication_publifather (pubid, nodeid, instanceid, aliasuserid, aliasdate, puborder) FROM stdin;
\.


--
-- Data for Name: sb_publication_publii18n; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_publication_publii18n (id, pubid, lang, name, description, keywords) FROM stdin;
\.


--
-- Data for Name: sb_publication_validation; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_publication_validation (id, pubid, instanceid, userid, decisiondate, decision) FROM stdin;
\.


--
-- Data for Name: sb_question_answer; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_question_answer (answerid, questionid, answerlabel, answernbpoints, answerissolution, answercomment, answernbvoters, answerisopened, answerimage, answerquestionlink) FROM stdin;
\.


--
-- Data for Name: sb_question_question; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_question_question (questionid, qcid, questionlabel, questiondescription, questionclue, questionimage, questionisqcm, questiontype, questionisopen, questioncluepenalty, questionmaxtime, questiondisplayorder, questionnbpointsmin, questionnbpointsmax, instanceid, style) FROM stdin;
\.


--
-- Data for Name: sb_question_questionresult; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_question_questionresult (qrid, questionid, userid, answerid, qropenanswer, qrnbpoints, qrpolldate, qrelapsedtime, qrparticipationid) FROM stdin;
\.


--
-- Data for Name: sb_question_score; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_question_score (scoreid, qcid, userid, scoreparticipationid, scorescore, scoreelapsedtime, scoreparticipationdate, scoresuggestion) FROM stdin;
\.


--
-- Data for Name: sb_questioncontainer_comment; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_questioncontainer_comment (commentid, commentfatherid, userid, commentcomment, commentisanonymous, commentdate) FROM stdin;
\.


--
-- Data for Name: sb_questioncontainer_qc; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_questioncontainer_qc (qcid, qctitle, qcdescription, qccomment, qccreatorid, qccreationdate, qcbegindate, qcenddate, qcisclosed, qcnbvoters, qcnbquestionspage, qcnbmaxparticipations, qcnbtriesbeforesolution, qcmaxtime, instanceid, anonymous, resultmode, resultview) FROM stdin;
\.


--
-- Data for Name: sb_reminder; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_reminder (id, remindertype, contrib_id, contrib_instanceid, contrib_type, userid, text, triggered, trigger_datetime, trigger_durationtime, trigger_durationunit, trigger_prop, process_name) FROM stdin;
\.


--
-- Data for Name: sb_seealso_link; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_seealso_link (id, objectid, objectinstanceid, targetid, targetinstanceid) FROM stdin;
\.


--
-- Data for Name: sb_sn_externalaccount; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_sn_externalaccount (profileid, networkid, silverpeasuserid) FROM stdin;
\.


--
-- Data for Name: sb_sn_invitation; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_sn_invitation (id, senderid, receiverid, message, invitationdate) FROM stdin;
\.


--
-- Data for Name: sb_sn_relationship; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_sn_relationship (id, user1id, user2id, typerelationshipid, acceptancedate, inviterid) FROM stdin;
\.


--
-- Data for Name: sb_sn_status; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_sn_status (id, userid, creationdate, description) FROM stdin;
\.


--
-- Data for Name: sb_sn_typerelationship; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_sn_typerelationship (id, designation) FROM stdin;
\.


--
-- Data for Name: sb_stat_access; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_stat_access (datestat, userid, peastype, spaceid, componentid, countaccess) FROM stdin;
\.


--
-- Data for Name: sb_stat_accesscumul; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_stat_accesscumul (datestat, userid, peastype, spaceid, componentid, countaccess) FROM stdin;
\.


--
-- Data for Name: sb_stat_connection; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_stat_connection (datestat, userid, countconnection, duration) FROM stdin;
\.


--
-- Data for Name: sb_stat_connectioncumul; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_stat_connectioncumul (datestat, userid, countconnection, duration) FROM stdin;
\.


--
-- Data for Name: sb_stat_sizedir; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_stat_sizedir (datestat, filedir, sizedir) FROM stdin;
\.


--
-- Data for Name: sb_stat_sizedircumul; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_stat_sizedircumul (datestat, filedir, sizedir) FROM stdin;
\.


--
-- Data for Name: sb_stat_volume; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_stat_volume (datestat, userid, peastype, spaceid, componentid, countvolume) FROM stdin;
\.


--
-- Data for Name: sb_stat_volumecumul; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_stat_volumecumul (datestat, userid, peastype, spaceid, componentid, countvolume) FROM stdin;
\.


--
-- Data for Name: sb_statistic_history; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_statistic_history (datestat, heurestat, userid, resourceid, componentid, actiontype, resourcetype) FROM stdin;
\.


--
-- Data for Name: sb_tagcloud_tagcloud; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_tagcloud_tagcloud (id, tag, label, instanceid, externalid, externaltype) FROM stdin;
\.


--
-- Data for Name: sb_thesaurus_jargon; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_thesaurus_jargon (id, type, idvoca, iduser) FROM stdin;
\.


--
-- Data for Name: sb_thesaurus_synonym; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_thesaurus_synonym (id, idvoca, idtree, idterm, name) FROM stdin;
\.


--
-- Data for Name: sb_thesaurus_vocabulary; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_thesaurus_vocabulary (id, name, description) FROM stdin;
\.


--
-- Data for Name: sb_thumbnail_thumbnail; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_thumbnail_thumbnail (instanceid, objectid, objecttype, originalattachmentname, modifiedattachmentname, mimetype, xstart, ystart, xlength, ylength) FROM stdin;
\.


--
-- Data for Name: sb_tree_tree; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_tree_tree (treeid, id, name, description, creationdate, creatorid, path, levelnumber, fatherid, ordernumber, lang) FROM stdin;
\.


--
-- Data for Name: sb_tree_treei18n; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_tree_treei18n (id, treeid, nodeid, lang, name, description) FROM stdin;
\.


--
-- Data for Name: sb_variables_value; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_variables_value (id, variableid, value, startdate, enddate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sb_variables_variable; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_variables_variable (id, label, description, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sb_webconnections_info; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_webconnections_info (connectionid, userid, componentid, paramlogin, parampassword) FROM stdin;
\.


--
-- Data for Name: sb_workflow_activestate; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_activestate (id, instanceid, state, backstatus, timeoutstatus, timeoutdate) FROM stdin;
\.


--
-- Data for Name: sb_workflow_error; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_error (id, instanceid, stepid, errormessage, stacktrace, userid, actionname, actiondate, userrole, statename) FROM stdin;
\.


--
-- Data for Name: sb_workflow_historystep; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_historystep (instanceid, id, userid, substituteid, userrolename, action, actiondate, resolvedstate, tostate, actionstatus) FROM stdin;
\.


--
-- Data for Name: sb_workflow_interesteduser; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_interesteduser (id, userid, usersrole, instanceid, state, role, groupid) FROM stdin;
\.


--
-- Data for Name: sb_workflow_lockinguser; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_lockinguser (id, userid, instanceid, state, lockdate) FROM stdin;
\.


--
-- Data for Name: sb_workflow_processinstance; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_processinstance (instanceid, modelid, locked, errorstatus, timeoutstatus) FROM stdin;
\.


--
-- Data for Name: sb_workflow_question; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_question (id, instanceid, questiontext, responsetext, questiondate, responsedate, fromstate, targetstate, fromuserid, touserid, relevant) FROM stdin;
\.


--
-- Data for Name: sb_workflow_replacements; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_replacements (id, incumbentid, substituteid, workflowid, startdate, enddate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sb_workflow_undo_step; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_undo_step (id, stepid, instanceid, action, parameters) FROM stdin;
\.


--
-- Data for Name: sb_workflow_userinfo; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_userinfo (id, settingsid, name, value) FROM stdin;
\.


--
-- Data for Name: sb_workflow_usersettings; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_usersettings (settingsid, userid, peasid) FROM stdin;
\.


--
-- Data for Name: sb_workflow_workinguser; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sb_workflow_workinguser (id, userid, usersrole, instanceid, state, role, groupid) FROM stdin;
\.


--
-- Data for Name: sc_blog_post; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_blog_post (pubid, dateevent, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_classifieds_classifieds; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_classifieds_classifieds (classifiedid, instanceid, title, description, price, creatorid, creationdate, updatedate, status, validatorid, validatedate) FROM stdin;
\.


--
-- Data for Name: sc_classifieds_subscribes; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_classifieds_subscribes (subscribeid, userid, instanceid, field1, field2) FROM stdin;
\.


--
-- Data for Name: sc_community; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_community (id, instanceid, spaceid, groupid, homepage, homepagetype, charterurl) FROM stdin;
\.


--
-- Data for Name: sc_community_membership; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_community_membership (id, community, userid, status, joiningdate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sc_connecteurjdbc_connectinfo; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_connecteurjdbc_connectinfo (id, datasource, login, password, sqlreq, rowlimit, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_contact_groupfather; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_contact_groupfather (groupid, fatherid, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_delegatednews_news; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_delegatednews_news (pubid, instanceid, status, contributorid, validatorid, validationdate, begindate, enddate, newsorder) FROM stdin;
\.


--
-- Data for Name: sc_formsonline_forminstances; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_formsonline_forminstances (id, formid, state, creatorid, creationdate, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_formsonline_forminstvali; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_formsonline_forminstvali (id, forminstid, validationby, validationtype, status, validationdate, validationcomment, follower) FROM stdin;
\.


--
-- Data for Name: sc_formsonline_forms; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_formsonline_forms (id, xmlformname, name, description, creationdate, state, instanceid, alreadyused, creatorid, title, hierarchicalvalidation, forminstexchangereceiver, deleteafterforminstexchange) FROM stdin;
\.


--
-- Data for Name: sc_formsonline_grouprights; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_formsonline_grouprights (formid, instanceid, groupid, righttype) FROM stdin;
\.


--
-- Data for Name: sc_formsonline_userrights; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_formsonline_userrights (formid, instanceid, userid, righttype) FROM stdin;
\.


--
-- Data for Name: sc_forums_forum; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_forums_forum (forumid, forumname, forumdescription, forumcreationdate, forumclosedate, forumcreator, forumactive, forumparent, forummodes, forumlocklevel, instanceid, categoryid) FROM stdin;
\.


--
-- Data for Name: sc_forums_historyuser; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_forums_historyuser (userid, messageid, lastaccess) FROM stdin;
\.


--
-- Data for Name: sc_forums_message; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_forums_message (messageid, messagetitle, messageauthor, forumid, messageparentid, messagedate, status) FROM stdin;
\.


--
-- Data for Name: sc_forums_rights; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_forums_rights (userid, forumid) FROM stdin;
\.


--
-- Data for Name: sc_gallery_internal; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_internal (mediaid, filename, filesize, filemimetype, download, begindownloaddate, enddownloaddate) FROM stdin;
\.


--
-- Data for Name: sc_gallery_media; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_media (mediaid, mediatype, instanceid, title, description, author, keyword, beginvisibilitydate, endvisibilitydate, createdate, createdby, lastupdatedate, lastupdatedby) FROM stdin;
\.


--
-- Data for Name: sc_gallery_order; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_order (orderid, userid, instanceid, createdate, processdate, processuser) FROM stdin;
\.


--
-- Data for Name: sc_gallery_orderdetail; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_orderdetail (orderid, mediaid, instanceid, downloaddate, downloaddecision) FROM stdin;
\.


--
-- Data for Name: sc_gallery_path; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_path (mediaid, instanceid, nodeid) FROM stdin;
\.


--
-- Data for Name: sc_gallery_photo; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_photo (mediaid, resolutionw, resolutionh) FROM stdin;
\.


--
-- Data for Name: sc_gallery_sound; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_sound (mediaid, bitrate, duration) FROM stdin;
\.


--
-- Data for Name: sc_gallery_streaming; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_streaming (mediaid, homepageurl, provider) FROM stdin;
\.


--
-- Data for Name: sc_gallery_video; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_gallery_video (mediaid, resolutionw, resolutionh, bitrate, duration) FROM stdin;
\.


--
-- Data for Name: sc_il_extsus; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_il_extsus (letter, email, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_il_letter; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_il_letter (id, name, description, periode, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_il_publication; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_il_publication (id, title, description, parutiondate, publicationstate, letterid, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_kmelia_search; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_kmelia_search (id, instanceid, topicid, userid, searchdate, language, query) FROM stdin;
\.


--
-- Data for Name: sc_mailinglist_attachment; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_mailinglist_attachment (id, version, attachmentsize, attachmentpath, filename, contenttype, md5signature, messageid) FROM stdin;
\.


--
-- Data for Name: sc_mailinglist_external_user; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_mailinglist_external_user (id, version, componentid, email, listid) FROM stdin;
\.


--
-- Data for Name: sc_mailinglist_internal_sub; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_mailinglist_internal_sub (id, version, subscriber_type, externalid, mailinglistid) FROM stdin;
\.


--
-- Data for Name: sc_mailinglist_list; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_mailinglist_list (id, version, componentid) FROM stdin;
\.


--
-- Data for Name: sc_mailinglist_message; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_mailinglist_message (id, version, mailid, componentid, title, summary, sender, sentdate, referenceid, moderated, contenttype, attachmentssize, messageyear, messagemonth, body) FROM stdin;
\.


--
-- Data for Name: sc_mydb_connectinfo; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_mydb_connectinfo (id, datasource, login, password, tablename, rowlimit, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_projectmanager_calendar; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_projectmanager_calendar (holidaydate, fatherid, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_projectmanager_resources; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_projectmanager_resources (id, taskid, resourceid, charge, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_projectmanager_tasks; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_projectmanager_tasks (id, mereid, chrono, nom, description, organisateurid, responsableid, charge, consomme, raf, avancement, statut, datedebut, datefin, codeprojet, descriptionprojet, estdecomposee, instanceid, path, previousid) FROM stdin;
\.


--
-- Data for Name: sc_questionreply_question; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_questionreply_question (id, title, content, creatorid, creationdate, status, publicreplynumber, privatereplynumber, replynumber, instanceid, categoryid) FROM stdin;
\.


--
-- Data for Name: sc_questionreply_recipient; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_questionreply_recipient (id, questionid, userid) FROM stdin;
\.


--
-- Data for Name: sc_questionreply_reply; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_questionreply_reply (id, questionid, title, content, creatorid, creationdate, publicreply, privatereply) FROM stdin;
\.


--
-- Data for Name: sc_quickinfo_news; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_quickinfo_news (id, instanceid, foreignid, important, broadcastticker, broadcastmandatory, createdate, createdby, lastupdatedate, lastupdatedby, publishdate, publishedby, version) FROM stdin;
\.


--
-- Data for Name: sc_resources_category; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_resources_category (id, instanceid, name, creationdate, updatedate, bookable, form, responsibleid, createrid, updaterid, description) FROM stdin;
\.


--
-- Data for Name: sc_resources_managers; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_resources_managers (resourceid, managerid) FROM stdin;
\.


--
-- Data for Name: sc_resources_reservation; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_resources_reservation (id, instanceid, evenement, userid, creationdate, updatedate, begindate, enddate, reason, place, status) FROM stdin;
\.


--
-- Data for Name: sc_resources_reservedresource; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_resources_reservedresource (reservationid, resourceid, status) FROM stdin;
\.


--
-- Data for Name: sc_resources_resource; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_resources_resource (id, instanceid, categoryid, name, creationdate, updatedate, bookable, responsibleid, createrid, updaterid, description) FROM stdin;
\.


--
-- Data for Name: sc_rss_channels; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_rss_channels (id, url, safeurl, refreshrate, nbdisplayeditems, displayimage, creatorid, creationdate, instanceid) FROM stdin;
\.


--
-- Data for Name: sc_scheduleevent_contributor; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_scheduleevent_contributor (id, scheduleeventid, userid, lastvalidation, lastvisit) FROM stdin;
\.


--
-- Data for Name: sc_scheduleevent_list; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_scheduleevent_list (id, title, description, creationdate, status, creatorid) FROM stdin;
\.


--
-- Data for Name: sc_scheduleevent_options; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_scheduleevent_options (id, scheduleeventid, optionday, optionhour) FROM stdin;
\.


--
-- Data for Name: sc_scheduleevent_response; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_scheduleevent_response (id, scheduleeventid, userid, optionid) FROM stdin;
\.


--
-- Data for Name: sc_silvercrawler_statistic; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_silvercrawler_statistic (datedownload, userid, path, componentid, objecttype) FROM stdin;
\.


--
-- Data for Name: sc_suggestion; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_suggestion (id, suggestionboxid, title, status, validationdate, validationcomment, validationby, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sc_suggestion_box; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_suggestion_box (id, instanceid, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: sc_whitepages_card; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_whitepages_card (id, userid, hidestatus, instanceid, creationdate, creatorid) FROM stdin;
\.


--
-- Data for Name: sc_whitepages_searchfields; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sc_whitepages_searchfields (id, instanceid, fieldid) FROM stdin;
\.


--
-- Data for Name: sr_packages; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.sr_packages (sr_package, sr_version) FROM stdin;
dbbuilder	004
busCore	047
agenda	001
coordinates	003
formTemplate	010
question	004
nsChannelSILVERMAIL	003
comment	003
myLinks	005
calendar	001
classifyEngine	002
pdcSubscription	002
questionContainer	004
node	007
statistic	003
silverStatistics	002
pdc	008
variables	001
fileSharing	004
publication	021
notificationManager	010
nsChannelSERVER	002
reminder	003
treeManager	004
dateReminder	001
nsChannelPOPUP	005
quota	002
contentManager	004
containerManager	002
tagCloud	002
webConnections	002
versioning	014
interests	004
scheduler	001
workflowEngine	009
thesaurus	002
token	001
contact	003
notation	003
socialNetwork	003
formsOnline	003
projectManager	003
myDB	003
infoLetter	002
almanach	006
resourcesManager	005
suggestionBox	001
mailingList	004
whitePages	005
community	002
gallery	006
yellowpages	002
rssAgregator	004
forums	006
scheduleevent	003
delegatedNews	003
quickinfo	001
blog	002
kmelia	005
silverCrawler	002
classifieds	004
connecteurJDBC	003
questionReply	007
\.


--
-- Data for Name: st_accesslevel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_accesslevel (id, name) FROM stdin;
U	User
A	Administrator
G	Guest
K	KMManager
D	DomainManager
\.


--
-- Data for Name: st_componentinstance; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_componentinstance (id, spaceid, name, componentname, description, createdby, ordernum, createtime, updatetime, removetime, componentstatus, updatedby, removedby, ispublic, ishidden, lang, isinheritanceblocked) FROM stdin;
\.


--
-- Data for Name: st_componentinstancei18n; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_componentinstancei18n (id, componentid, lang, name, description) FROM stdin;
\.


--
-- Data for Name: st_datereminder; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_datereminder (id, resourcetype, resourceid, datereminder, message, processstatus, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- Data for Name: st_delayednotification; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_delayednotification (id, userid, fromuserid, channel, action, notificationresourceid, language, creationdate, message) FROM stdin;
\.


--
-- Data for Name: st_delayednotifusersetting; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_delayednotifusersetting (id, userid, channel, frequency) FROM stdin;
\.


--
-- Data for Name: st_domain; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_domain (id, name, description, propfilename, classname, authenticationserver, thetimestamp, silverpeasserverurl) FROM stdin;
-1	internal	Do not remove - Used by Silverpeas engine	-	-	-	0	
0	domainSilverpeas	default domain for Silverpeas	org.silverpeas.domains.domainSP	org.silverpeas.core.admin.domain.driver.SilverpeasDomainDriver	autDomainSP	0	http://localhost:8000
\.


--
-- Data for Name: st_formdesigner_connectors; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_formdesigner_connectors (id, name, description, driver, url, login, passwd, sqlquery, type) FROM stdin;
0	________	 	 	 	 	 	 	 
\.


--
-- Data for Name: st_formdesigner_formdesign; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_formdesigner_formdesign (id, refidform, componentid, name, description, creationdate, author) FROM stdin;
\.


--
-- Data for Name: st_formeditor_formedited; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_formeditor_formedited (id, formid, userid, createdate, modifydate) FROM stdin;
\.


--
-- Data for Name: st_formeditor_formediteddata; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_formeditor_formediteddata (id, formeditedid, editedkey, editedvalue) FROM stdin;
\.


--
-- Data for Name: st_group; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_group (id, domainid, specificid, supergroupid, name, description, synchrorule, creationdate, savedate, state, statesavedate) FROM stdin;
\.


--
-- Data for Name: st_group_user_rel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_group_user_rel (groupid, userid) FROM stdin;
\.


--
-- Data for Name: st_groupuserrole; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_groupuserrole (id, groupid, rolename) FROM stdin;
\.


--
-- Data for Name: st_groupuserrole_group_rel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_groupuserrole_group_rel (groupuserroleid, groupid) FROM stdin;
\.


--
-- Data for Name: st_groupuserrole_user_rel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_groupuserrole_user_rel (groupuserroleid, userid) FROM stdin;
\.


--
-- Data for Name: st_instance_data; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_instance_data (id, componentid, name, label, value) FROM stdin;
\.


--
-- Data for Name: st_instance_modelused; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_instance_modelused (instanceid, modelid, objectid) FROM stdin;
\.


--
-- Data for Name: st_keystore; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_keystore (userkey, login, domainid) FROM stdin;
\.


--
-- Data for Name: st_longtext; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_longtext (id, ordernum, bodycontent) FROM stdin;
\.


--
-- Data for Name: st_notifaddress; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_notifaddress (id, userid, notifname, notifchannelid, address, usage, priority) FROM stdin;
\.


--
-- Data for Name: st_notifchannel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_notifchannel (id, name, description, couldbeadded, fromavailable, subjectavailable) FROM stdin;
1	SMTP		Y	E	Y
2	SMS		Y	 	N
3	POPUP		N	I	N
4	SILVERMAIL		N	I	Y
5	REMOVE		N	 	N
6	SERVER		N	 	N
\.


--
-- Data for Name: st_notifdefaultaddress; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_notifdefaultaddress (id, userid, notifaddressid) FROM stdin;
\.


--
-- Data for Name: st_notificationresource; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_notificationresource (id, componentinstanceid, resourceid, resourcetype, resourcename, resourcedescription, resourcelocation, resourceurl, attachmenttargetid, resourcedetails) FROM stdin;
\.


--
-- Data for Name: st_notifpreference; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_notifpreference (id, notifaddressid, componentinstanceid, userid, messagetype) FROM stdin;
\.


--
-- Data for Name: st_notifsended; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_notifsended (notifid, userid, messagetype, notifdate, title, link, sessionid, componentid, body) FROM stdin;
\.


--
-- Data for Name: st_notifsendedreceiver; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_notifsendedreceiver (notifid, userid) FROM stdin;
\.


--
-- Data for Name: st_popupmessage; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_popupmessage (id, userid, body, senderid, sendername, answerallowed, source, url, msgdate, msgtime) FROM stdin;
\.


--
-- Data for Name: st_quota; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_quota (id, quotatype, resourceid, mincount, maxcount, currentcount, savedate) FROM stdin;
\.


--
-- Data for Name: st_servermessage; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_servermessage (id, userid, header, subject, body, sessionid, type) FROM stdin;
\.


--
-- Data for Name: st_silvermailmessage; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_silvermailmessage (id, userid, folderid, header, sendername, subject, body, source, url, datemsg, readen) FROM stdin;
\.


--
-- Data for Name: st_space; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_space (id, domainfatherid, name, description, createdby, firstpagetype, firstpageextraparam, ordernum, createtime, updatetime, removetime, spacestatus, updatedby, removedby, lang, isinheritanceblocked, look, displayspacefirst, ispersonal) FROM stdin;
\.


--
-- Data for Name: st_spacei18n; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_spacei18n (id, spaceid, lang, name, description) FROM stdin;
\.


--
-- Data for Name: st_spaceuserrole; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_spaceuserrole (id, spaceid, name, rolename, description, isinherited) FROM stdin;
\.


--
-- Data for Name: st_spaceuserrole_group_rel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_spaceuserrole_group_rel (spaceuserroleid, groupid) FROM stdin;
\.


--
-- Data for Name: st_spaceuserrole_user_rel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_spaceuserrole_user_rel (spaceuserroleid, userid) FROM stdin;
\.


--
-- Data for Name: st_token; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_token (id, tokentype, resourceid, token, savecount, savedate) FROM stdin;
\.


--
-- Data for Name: st_user; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_user (id, domainid, specificid, firstname, lastname, email, login, loginmail, accesslevel, loginquestion, loginanswer, creationdate, savedate, version, tosacceptancedate, lastlogindate, nbsuccessfulloginattempts, lastlogincredentialupdatedate, expirationdate, state, statesavedate, notifmanualreceiverlimit, sensitivedata) FROM stdin;
0	0	0		Silverpeas Admin	silverpeas@localhost	silverpeas	\N	A	\N	\N	\N	2026-09-30 13:42:48.052	1	\N	2026-09-30 13:42:48.047	1	\N	\N	VALID	2026-09-30 13:36:24.848523	\N	f
1	0	1		SilverAdmin	silveradmin@localhost	SilverAdmin	\N	A	\N	\N	\N	2026-09-30 13:43:07.198	1	\N	2026-09-30 13:43:07.196	1	\N	\N	VALID	2026-09-30 13:43:01.786605	\N	f
\.


--
-- Data for Name: st_userfavoritespaces; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_userfavoritespaces (id, userid, spaceid) FROM stdin;
\.


--
-- Data for Name: st_userrole; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_userrole (id, instanceid, name, rolename, description, isinherited, objectid, objecttype) FROM stdin;
\.


--
-- Data for Name: st_userrole_group_rel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_userrole_group_rel (userroleid, groupid) FROM stdin;
\.


--
-- Data for Name: st_userrole_user_rel; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.st_userrole_user_rel (userroleid, userid) FROM stdin;
\.


--
-- Data for Name: subscribe; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.subscribe (subscriberid, subscribertype, subscriptionmethod, resourceid, resourcetype, space, instanceid, creatorid, creationdate) FROM stdin;
\.


--
-- Data for Name: uniqueid; Type: TABLE DATA; Schema: public; Owner: silverpeas
--

COPY public.uniqueid (maxid, tablename) FROM stdin;
\.


--
-- Name: st_datereminder const_st_datereminder_pk; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_datereminder
    ADD CONSTRAINT const_st_datereminder_pk PRIMARY KEY (id);


--
-- Name: st_delayednotification const_st_dn_pk; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_delayednotification
    ADD CONSTRAINT const_st_dn_pk PRIMARY KEY (id);


--
-- Name: st_delayednotifusersetting const_st_dnus_pk; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_delayednotifusersetting
    ADD CONSTRAINT const_st_dnus_pk PRIMARY KEY (id);


--
-- Name: st_notificationresource const_st_nr_pk; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notificationresource
    ADD CONSTRAINT const_st_nr_pk PRIMARY KEY (id);


--
-- Name: st_quota const_st_quota_pk; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_quota
    ADD CONSTRAINT const_st_quota_pk PRIMARY KEY (id);


--
-- Name: st_token const_st_token_pk; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_token
    ADD CONSTRAINT const_st_token_pk PRIMARY KEY (id);


--
-- Name: sc_mailinglist_message mailinglist_message_mailid_key; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_message
    ADD CONSTRAINT mailinglist_message_mailid_key UNIQUE (mailid, componentid);


--
-- Name: pdcaxisvalue pdcaxisvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcaxisvalue
    ADD CONSTRAINT pdcaxisvalue_pkey PRIMARY KEY (valueid, axisid);


--
-- Name: pdcclassification_pdcposition pdcclassification_pdcposition_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcclassification_pdcposition
    ADD CONSTRAINT pdcclassification_pdcposition_pkey PRIMARY KEY (pdcclassification_id, positions_id);


--
-- Name: pdcclassification_pdcposition pdcclassification_pdcposition_positions_id_key; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcclassification_pdcposition
    ADD CONSTRAINT pdcclassification_pdcposition_positions_id_key UNIQUE (positions_id);


--
-- Name: pdcclassification pdcclassification_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcclassification
    ADD CONSTRAINT pdcclassification_pkey PRIMARY KEY (id);


--
-- Name: pdcposition_pdcaxisvalue pdcposition_pdcaxisvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcposition_pdcaxisvalue
    ADD CONSTRAINT pdcposition_pdcaxisvalue_pkey PRIMARY KEY (pdcposition_id, axisvalues_valueid, axisvalues_axisid);


--
-- Name: pdcposition pdcposition_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcposition
    ADD CONSTRAINT pdcposition_pkey PRIMARY KEY (id);


--
-- Name: st_accesslevel pk_accesslevel; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_accesslevel
    ADD CONSTRAINT pk_accesslevel PRIMARY KEY (id);


--
-- Name: sb_cal_attendees pk_attendee; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_attendees
    ADD CONSTRAINT pk_attendee PRIMARY KEY (id);


--
-- Name: sb_cal_attributes pk_attributes; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_attributes
    ADD CONSTRAINT pk_attributes PRIMARY KEY (id, name);


--
-- Name: sc_blog_post pk_blog_post; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_blog_post
    ADD CONSTRAINT pk_blog_post PRIMARY KEY (pubid);


--
-- Name: sb_cal_components pk_calcomponent; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_components
    ADD CONSTRAINT pk_calcomponent PRIMARY KEY (id);


--
-- Name: sb_cal_calendar pk_calendar; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_calendar
    ADD CONSTRAINT pk_calendar PRIMARY KEY (id);


--
-- Name: calendarcategory pk_calendarcategory; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.calendarcategory
    ADD CONSTRAINT pk_calendarcategory PRIMARY KEY (categoryid);


--
-- Name: calendarjournal pk_calendarjournal; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.calendarjournal
    ADD CONSTRAINT pk_calendarjournal PRIMARY KEY (id);


--
-- Name: calendarjournalattendee pk_calendarjournalattendee; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.calendarjournalattendee
    ADD CONSTRAINT pk_calendarjournalattendee PRIMARY KEY (journalid, userid);


--
-- Name: calendarjournalcategory pk_calendarjournalcategory; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.calendarjournalcategory
    ADD CONSTRAINT pk_calendarjournalcategory PRIMARY KEY (journalid, categoryid);


--
-- Name: calendartodo pk_calendartodo; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.calendartodo
    ADD CONSTRAINT pk_calendartodo PRIMARY KEY (id);


--
-- Name: calendartodoattendee pk_calendartodoattendee; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.calendartodoattendee
    ADD CONSTRAINT pk_calendartodoattendee PRIMARY KEY (todoid, userid);


--
-- Name: sb_cal_categories pk_categories; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id, category);


--
-- Name: sb_classifyengine_classify pk_classifyengine_classify; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_classifyengine_classify
    ADD CONSTRAINT pk_classifyengine_classify PRIMARY KEY (positionid);


--
-- Name: sb_comment_comment pk_comment_comment; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_comment_comment
    ADD CONSTRAINT pk_comment_comment PRIMARY KEY (commentid);


--
-- Name: st_componentinstance pk_componentinstance; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_componentinstance
    ADD CONSTRAINT pk_componentinstance PRIMARY KEY (id);


--
-- Name: sc_connecteurjdbc_connectinfo pk_connecteurjdbc_connectinfo; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_connecteurjdbc_connectinfo
    ADD CONSTRAINT pk_connecteurjdbc_connectinfo PRIMARY KEY (id);


--
-- Name: sb_contact_contact pk_contact_contact; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_contact_contact
    ADD CONSTRAINT pk_contact_contact PRIMARY KEY (contactid);


--
-- Name: sb_contact_contactfather pk_contact_contactfather; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_contact_contactfather
    ADD CONSTRAINT pk_contact_contactfather PRIMARY KEY (contactid, nodeid);


--
-- Name: sb_contact_info pk_contact_info; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_contact_info
    ADD CONSTRAINT pk_contact_info PRIMARY KEY (infoid);


--
-- Name: sb_containermanager_instance pk_containermanager_instance; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_containermanager_instance
    ADD CONSTRAINT pk_containermanager_instance PRIMARY KEY (instanceid);


--
-- Name: sb_contentmanager_content pk_contentmanager_content; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_contentmanager_content
    ADD CONSTRAINT pk_contentmanager_content PRIMARY KEY (silvercontentid);


--
-- Name: sb_contentmanager_instance pk_contentmanager_instance; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_contentmanager_instance
    ADD CONSTRAINT pk_contentmanager_instance PRIMARY KEY (instanceid);


--
-- Name: sb_contribution_tracking pk_contribution_tracking; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_contribution_tracking
    ADD CONSTRAINT pk_contribution_tracking PRIMARY KEY (id);


--
-- Name: sb_coordinates_coordinates pk_coordinates_coordinates; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_coordinates_coordinates
    ADD CONSTRAINT pk_coordinates_coordinates PRIMARY KEY (coordinatesid, nodeid, instanceid);


--
-- Name: sc_delegatednews_news pk_delegatednews_news; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_delegatednews_news
    ADD CONSTRAINT pk_delegatednews_news PRIMARY KEY (pubid);


--
-- Name: domainsp_group pk_domainsp_group; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.domainsp_group
    ADD CONSTRAINT pk_domainsp_group PRIMARY KEY (id);


--
-- Name: domainsp_group_user_rel pk_domainsp_group_user_rel; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.domainsp_group_user_rel
    ADD CONSTRAINT pk_domainsp_group_user_rel PRIMARY KEY (groupid, userid);


--
-- Name: domainsp_user pk_domainsp_user; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.domainsp_user
    ADD CONSTRAINT pk_domainsp_user PRIMARY KEY (id);


--
-- Name: sb_cal_event pk_event; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_event
    ADD CONSTRAINT pk_event PRIMARY KEY (id);


--
-- Name: sb_sn_externalaccount pk_externalaccount; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_sn_externalaccount
    ADD CONSTRAINT pk_externalaccount PRIMARY KEY (profileid, networkid);


--
-- Name: sb_formtemplate_record pk_formtemplate_record; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_record
    ADD CONSTRAINT pk_formtemplate_record PRIMARY KEY (recordid);


--
-- Name: sb_formtemplate_template pk_formtemplate_template; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_template
    ADD CONSTRAINT pk_formtemplate_template PRIMARY KEY (templateid);


--
-- Name: sb_formtemplate_templatefield pk_formtemplate_templatefield; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_templatefield
    ADD CONSTRAINT pk_formtemplate_templatefield PRIMARY KEY (templateid, fieldname);


--
-- Name: sc_forums_forum pk_forums_forum; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_forums_forum
    ADD CONSTRAINT pk_forums_forum PRIMARY KEY (forumid);


--
-- Name: sc_forums_historyuser pk_forums_historyuser; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_forums_historyuser
    ADD CONSTRAINT pk_forums_historyuser PRIMARY KEY (userid, messageid);


--
-- Name: sc_forums_message pk_forums_message; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_forums_message
    ADD CONSTRAINT pk_forums_message PRIMARY KEY (messageid);


--
-- Name: sc_forums_rights pk_forums_rights; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_forums_rights
    ADD CONSTRAINT pk_forums_rights PRIMARY KEY (userid, forumid);


--
-- Name: st_group pk_group; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_group
    ADD CONSTRAINT pk_group PRIMARY KEY (id);


--
-- Name: st_group_user_rel pk_group_user_rel; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_group_user_rel
    ADD CONSTRAINT pk_group_user_rel PRIMARY KEY (groupid, userid);


--
-- Name: sc_il_letter pk_infoletter_letter; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_il_letter
    ADD CONSTRAINT pk_infoletter_letter PRIMARY KEY (id);


--
-- Name: sc_il_publication pk_infoletter_publication; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_il_publication
    ADD CONSTRAINT pk_infoletter_publication PRIMARY KEY (id);


--
-- Name: st_instance_data pk_instance_data; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_instance_data
    ADD CONSTRAINT pk_instance_data PRIMARY KEY (id);


--
-- Name: sb_interests pk_interests; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_interests
    ADD CONSTRAINT pk_interests PRIMARY KEY (id);


--
-- Name: sb_interests_axis pk_interests_axis; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_interests_axis
    ADD CONSTRAINT pk_interests_axis PRIMARY KEY (id);


--
-- Name: sc_kmelia_search pk_kmelia_search; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_kmelia_search
    ADD CONSTRAINT pk_kmelia_search PRIMARY KEY (id);


--
-- Name: sc_mailinglist_attachment pk_mailinglist_attachment; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_attachment
    ADD CONSTRAINT pk_mailinglist_attachment PRIMARY KEY (id);


--
-- Name: sc_mailinglist_external_user pk_mailinglist_external_user; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_external_user
    ADD CONSTRAINT pk_mailinglist_external_user PRIMARY KEY (id);


--
-- Name: sc_mailinglist_internal_sub pk_mailinglist_internal_sub; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_internal_sub
    ADD CONSTRAINT pk_mailinglist_internal_sub PRIMARY KEY (id);


--
-- Name: sc_mailinglist_list pk_mailinglist_list; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_list
    ADD CONSTRAINT pk_mailinglist_list PRIMARY KEY (id);


--
-- Name: sc_mailinglist_message pk_mailinglist_message; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_message
    ADD CONSTRAINT pk_mailinglist_message PRIMARY KEY (id);


--
-- Name: model pk_model; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT pk_model PRIMARY KEY (id);


--
-- Name: model_contact pk_model_contact; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.model_contact
    ADD CONSTRAINT pk_model_contact PRIMARY KEY (id);


--
-- Name: sc_mydb_connectinfo pk_mydb_connectinfo; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mydb_connectinfo
    ADD CONSTRAINT pk_mydb_connectinfo PRIMARY KEY (id);


--
-- Name: sb_node_node pk_node_node; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_node_node
    ADD CONSTRAINT pk_node_node PRIMARY KEY (nodeid, instanceid);


--
-- Name: sb_node_nodei18n pk_node_nodei18n; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_node_nodei18n
    ADD CONSTRAINT pk_node_nodei18n PRIMARY KEY (id);


--
-- Name: st_notifpreference pk_notifaddr_component; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifpreference
    ADD CONSTRAINT pk_notifaddr_component PRIMARY KEY (id);


--
-- Name: st_notifaddress pk_notifaddress; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifaddress
    ADD CONSTRAINT pk_notifaddress PRIMARY KEY (id);


--
-- Name: st_notifchannel pk_notifchannel; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifchannel
    ADD CONSTRAINT pk_notifchannel PRIMARY KEY (id);


--
-- Name: st_notifsended pk_notifsended; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifsended
    ADD CONSTRAINT pk_notifsended PRIMARY KEY (notifid);


--
-- Name: st_notifsendedreceiver pk_notifsendedreceiver; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifsendedreceiver
    ADD CONSTRAINT pk_notifsendedreceiver PRIMARY KEY (notifid, userid);


--
-- Name: sb_cal_occurrences pk_occurrence; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_occurrences
    ADD CONSTRAINT pk_occurrence PRIMARY KEY (id);


--
-- Name: sb_pdc_axis pk_pdc_axis; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_axis
    ADD CONSTRAINT pk_pdc_axis PRIMARY KEY (id);


--
-- Name: sb_pdc_axisi18n pk_pdc_axisi18n; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_axisi18n
    ADD CONSTRAINT pk_pdc_axisi18n PRIMARY KEY (id);


--
-- Name: sb_pdc_subscription pk_pdc_subscription; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_subscription
    ADD CONSTRAINT pk_pdc_subscription PRIMARY KEY (id);


--
-- Name: sb_pdc_subscription_axis pk_pdc_subscription_axis; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_subscription_axis
    ADD CONSTRAINT pk_pdc_subscription_axis PRIMARY KEY (id);


--
-- Name: sb_pdc_utilization pk_pdc_utilization; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_utilization
    ADD CONSTRAINT pk_pdc_utilization PRIMARY KEY (id);


--
-- Name: permalinks_document pk_permalinks_document; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.permalinks_document
    ADD CONSTRAINT pk_permalinks_document PRIMARY KEY (documentid);


--
-- Name: permalinks_version pk_permalinks_version; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.permalinks_version
    ADD CONSTRAINT pk_permalinks_version PRIMARY KEY (versionid);


--
-- Name: personalization pk_personalization; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.personalization
    ADD CONSTRAINT pk_personalization PRIMARY KEY (id);


--
-- Name: sc_projectmanager_calendar pk_projectmanager_calendar; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_projectmanager_calendar
    ADD CONSTRAINT pk_projectmanager_calendar PRIMARY KEY (holidaydate, fatherid, instanceid);


--
-- Name: sc_projectmanager_resources pk_projectmanager_resource; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_projectmanager_resources
    ADD CONSTRAINT pk_projectmanager_resource PRIMARY KEY (id);


--
-- Name: sc_projectmanager_tasks pk_projectmanager_tasks; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_projectmanager_tasks
    ADD CONSTRAINT pk_projectmanager_tasks PRIMARY KEY (id);


--
-- Name: sb_publication_publi pk_publication_publi; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_publication_publi
    ADD CONSTRAINT pk_publication_publi PRIMARY KEY (pubid);


--
-- Name: sb_publication_publifather pk_publication_publifather; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_publication_publifather
    ADD CONSTRAINT pk_publication_publifather PRIMARY KEY (pubid, nodeid, instanceid);


--
-- Name: sb_publication_publii18n pk_publication_publii18n; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_publication_publii18n
    ADD CONSTRAINT pk_publication_publii18n PRIMARY KEY (id);


--
-- Name: sb_question_answer pk_question_answer; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_question_answer
    ADD CONSTRAINT pk_question_answer PRIMARY KEY (answerid);


--
-- Name: sb_question_question pk_question_question; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_question_question
    ADD CONSTRAINT pk_question_question PRIMARY KEY (questionid);


--
-- Name: sb_question_questionresult pk_question_questionresult; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_question_questionresult
    ADD CONSTRAINT pk_question_questionresult PRIMARY KEY (qrid);


--
-- Name: sb_question_score pk_question_score; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_question_score
    ADD CONSTRAINT pk_question_score PRIMARY KEY (scoreid);


--
-- Name: sb_questioncontainer_comment pk_questioncontainer_comment; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_questioncontainer_comment
    ADD CONSTRAINT pk_questioncontainer_comment PRIMARY KEY (commentid);


--
-- Name: sb_questioncontainer_qc pk_questioncontainer_qc; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_questioncontainer_qc
    ADD CONSTRAINT pk_questioncontainer_qc PRIMARY KEY (qcid);


--
-- Name: sc_questionreply_question pk_questionreply_question; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_questionreply_question
    ADD CONSTRAINT pk_questionreply_question PRIMARY KEY (id);


--
-- Name: sc_questionreply_recipient pk_questionreply_recipient; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_questionreply_recipient
    ADD CONSTRAINT pk_questionreply_recipient PRIMARY KEY (id);


--
-- Name: sc_questionreply_reply pk_questionreply_reply; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_questionreply_reply
    ADD CONSTRAINT pk_questionreply_reply PRIMARY KEY (id);


--
-- Name: readingcontrol pk_readingcontrol; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.readingcontrol
    ADD CONSTRAINT pk_readingcontrol PRIMARY KEY (pubid, actorid, space, componentname);


--
-- Name: sb_cal_recurrence pk_recurrence; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_recurrence
    ADD CONSTRAINT pk_recurrence PRIMARY KEY (id);


--
-- Name: sb_reminder pk_reminder; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_reminder
    ADD CONSTRAINT pk_reminder PRIMARY KEY (id);


--
-- Name: sb_workflow_replacements pk_replacement; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_replacements
    ADD CONSTRAINT pk_replacement PRIMARY KEY (id);


--
-- Name: sc_resources_category pk_resources_category; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_resources_category
    ADD CONSTRAINT pk_resources_category PRIMARY KEY (id);


--
-- Name: sc_resources_managers pk_resources_managers; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_resources_managers
    ADD CONSTRAINT pk_resources_managers PRIMARY KEY (resourceid, managerid);


--
-- Name: sc_resources_reservation pk_resources_reservation; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_resources_reservation
    ADD CONSTRAINT pk_resources_reservation PRIMARY KEY (id);


--
-- Name: sc_resources_reservedresource pk_resources_reservedresource; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_resources_reservedresource
    ADD CONSTRAINT pk_resources_reservedresource PRIMARY KEY (reservationid, resourceid);


--
-- Name: sc_resources_resource pk_resources_resource; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_resources_resource
    ADD CONSTRAINT pk_resources_resource PRIMARY KEY (id);


--
-- Name: sc_rss_channels pk_rss_channels; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_rss_channels
    ADD CONSTRAINT pk_rss_channels PRIMARY KEY (id);


--
-- Name: sb_agenda_holidays pk_sb_agenda_holidays; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_agenda_holidays
    ADD CONSTRAINT pk_sb_agenda_holidays PRIMARY KEY (userid, holidaydate);


--
-- Name: sb_agenda_import_settings pk_sb_agenda_import_settings_set; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_agenda_import_settings
    ADD CONSTRAINT pk_sb_agenda_import_settings_set PRIMARY KEY (userid);


--
-- Name: sb_filesharing_history pk_sb_filesharing_history; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_filesharing_history
    ADD CONSTRAINT pk_sb_filesharing_history PRIMARY KEY (id);


--
-- Name: sb_filesharing_ticket pk_sb_filesharing_ticket; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_filesharing_ticket
    ADD CONSTRAINT pk_sb_filesharing_ticket PRIMARY KEY (keyfile);


--
-- Name: sb_mylinks_cat pk_sb_mylink_cat; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_mylinks_cat
    ADD CONSTRAINT pk_sb_mylink_cat PRIMARY KEY (catid);


--
-- Name: sb_mylinks_link pk_sb_mylink_link; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_mylinks_link
    ADD CONSTRAINT pk_sb_mylink_link PRIMARY KEY (linkid);


--
-- Name: sb_notation_notation pk_sb_notation_notation; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_notation_notation
    ADD CONSTRAINT pk_sb_notation_notation PRIMARY KEY (id);


--
-- Name: sb_sn_invitation pk_sb_sn_invitation; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_sn_invitation
    ADD CONSTRAINT pk_sb_sn_invitation PRIMARY KEY (id);


--
-- Name: sb_sn_relationship pk_sb_sn_relationship; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_sn_relationship
    ADD CONSTRAINT pk_sb_sn_relationship PRIMARY KEY (id);


--
-- Name: sb_sn_status pk_sb_sn_status; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_sn_status
    ADD CONSTRAINT pk_sb_sn_status PRIMARY KEY (id);


--
-- Name: sb_sn_typerelationship pk_sb_sn_typerelationship; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_sn_typerelationship
    ADD CONSTRAINT pk_sb_sn_typerelationship PRIMARY KEY (id);


--
-- Name: sb_tagcloud_tagcloud pk_sb_tagcloud_tagcloud; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_tagcloud_tagcloud
    ADD CONSTRAINT pk_sb_tagcloud_tagcloud PRIMARY KEY (id);


--
-- Name: sb_webconnections_info pk_sb_webconnections_info; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_webconnections_info
    ADD CONSTRAINT pk_sb_webconnections_info PRIMARY KEY (connectionid);


--
-- Name: sc_classifieds_classifieds pk_sc_classifieds_classifieds; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_classifieds_classifieds
    ADD CONSTRAINT pk_sc_classifieds_classifieds PRIMARY KEY (classifiedid);


--
-- Name: sc_classifieds_subscribes pk_sc_classifieds_subscribes; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_classifieds_subscribes
    ADD CONSTRAINT pk_sc_classifieds_subscribes PRIMARY KEY (userid, instanceid, field1, field2);


--
-- Name: sc_contact_groupfather pk_sc_contact_groupfather; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_contact_groupfather
    ADD CONSTRAINT pk_sc_contact_groupfather PRIMARY KEY (groupid, fatherid, instanceid);


--
-- Name: sc_formsonline_forminstances pk_sc_formsonline_forminstances; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_formsonline_forminstances
    ADD CONSTRAINT pk_sc_formsonline_forminstances PRIMARY KEY (id);


--
-- Name: sc_formsonline_forminstvali pk_sc_formsonline_forminstvali; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_formsonline_forminstvali
    ADD CONSTRAINT pk_sc_formsonline_forminstvali PRIMARY KEY (id);


--
-- Name: sc_formsonline_forms pk_sc_formsonline_forms; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_formsonline_forms
    ADD CONSTRAINT pk_sc_formsonline_forms PRIMARY KEY (id);


--
-- Name: sc_gallery_internal pk_sc_gallery_internal; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_internal
    ADD CONSTRAINT pk_sc_gallery_internal PRIMARY KEY (mediaid);


--
-- Name: sc_gallery_media pk_sc_gallery_media; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_media
    ADD CONSTRAINT pk_sc_gallery_media PRIMARY KEY (mediaid);


--
-- Name: sc_gallery_order pk_sc_gallery_order; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_order
    ADD CONSTRAINT pk_sc_gallery_order PRIMARY KEY (orderid);


--
-- Name: sc_gallery_orderdetail pk_sc_gallery_orderdetail; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_orderdetail
    ADD CONSTRAINT pk_sc_gallery_orderdetail PRIMARY KEY (orderid, mediaid);


--
-- Name: sc_gallery_path pk_sc_gallery_path; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_path
    ADD CONSTRAINT pk_sc_gallery_path PRIMARY KEY (nodeid, mediaid);


--
-- Name: sc_gallery_photo pk_sc_gallery_photo; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_photo
    ADD CONSTRAINT pk_sc_gallery_photo PRIMARY KEY (mediaid);


--
-- Name: sc_gallery_sound pk_sc_gallery_sound; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_sound
    ADD CONSTRAINT pk_sc_gallery_sound PRIMARY KEY (mediaid);


--
-- Name: sc_gallery_streaming pk_sc_gallery_streaming; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_streaming
    ADD CONSTRAINT pk_sc_gallery_streaming PRIMARY KEY (mediaid);


--
-- Name: sc_gallery_video pk_sc_gallery_video; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_gallery_video
    ADD CONSTRAINT pk_sc_gallery_video PRIMARY KEY (mediaid);


--
-- Name: sc_scheduleevent_contributor pk_scheduleevent_contrib; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_scheduleevent_contributor
    ADD CONSTRAINT pk_scheduleevent_contrib PRIMARY KEY (id);


--
-- Name: sc_scheduleevent_list pk_scheduleevent_list; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_scheduleevent_list
    ADD CONSTRAINT pk_scheduleevent_list PRIMARY KEY (id);


--
-- Name: sc_scheduleevent_options pk_scheduleevent_options; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_scheduleevent_options
    ADD CONSTRAINT pk_scheduleevent_options PRIMARY KEY (id);


--
-- Name: sc_scheduleevent_response pk_scheduleevent_response; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_scheduleevent_response
    ADD CONSTRAINT pk_scheduleevent_response PRIMARY KEY (id);


--
-- Name: sb_seealso_link pk_seealso_link; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_seealso_link
    ADD CONSTRAINT pk_seealso_link PRIMARY KEY (id);


--
-- Name: st_space pk_space; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_space
    ADD CONSTRAINT pk_space PRIMARY KEY (id);


--
-- Name: st_spaceuserrole pk_spaceuserrole; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole
    ADD CONSTRAINT pk_spaceuserrole PRIMARY KEY (id);


--
-- Name: st_spaceuserrole_group_rel pk_spaceuserrole_group_rel; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole_group_rel
    ADD CONSTRAINT pk_spaceuserrole_group_rel PRIMARY KEY (spaceuserroleid, groupid);


--
-- Name: st_spaceuserrole_user_rel pk_spaceuserrole_user_rel; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole_user_rel
    ADD CONSTRAINT pk_spaceuserrole_user_rel PRIMARY KEY (spaceuserroleid, userid);


--
-- Name: sr_packages pk_sr_packages; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sr_packages
    ADD CONSTRAINT pk_sr_packages PRIMARY KEY (sr_package);


--
-- Name: st_domain pk_st_domain; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_domain
    ADD CONSTRAINT pk_st_domain PRIMARY KEY (id);


--
-- Name: st_formdesigner_connectors pk_st_formdesigner_connectors; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_formdesigner_connectors
    ADD CONSTRAINT pk_st_formdesigner_connectors PRIMARY KEY (id);


--
-- Name: st_formdesigner_formdesign pk_st_formdesigner_formdesign; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_formdesigner_formdesign
    ADD CONSTRAINT pk_st_formdesigner_formdesign PRIMARY KEY (id);


--
-- Name: st_formeditor_formediteddata pk_st_formeditor_fed; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_formeditor_formediteddata
    ADD CONSTRAINT pk_st_formeditor_fed PRIMARY KEY (id);


--
-- Name: st_formeditor_formedited pk_st_formeditor_formedited; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_formeditor_formedited
    ADD CONSTRAINT pk_st_formeditor_formedited PRIMARY KEY (id);


--
-- Name: st_instance_modelused pk_st_instance_modelused; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_instance_modelused
    ADD CONSTRAINT pk_st_instance_modelused PRIMARY KEY (instanceid, modelid, objectid);


--
-- Name: st_longtext pk_st_longtext; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_longtext
    ADD CONSTRAINT pk_st_longtext PRIMARY KEY (id, ordernum);


--
-- Name: st_notifdefaultaddress pk_st_notifdefaultaddress; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifdefaultaddress
    ADD CONSTRAINT pk_st_notifdefaultaddress PRIMARY KEY (id);


--
-- Name: sb_thesaurus_jargon pk_thesaurus_jargon; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_thesaurus_jargon
    ADD CONSTRAINT pk_thesaurus_jargon PRIMARY KEY (id);


--
-- Name: sb_thesaurus_synonym pk_thesaurus_synonym; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_thesaurus_synonym
    ADD CONSTRAINT pk_thesaurus_synonym PRIMARY KEY (id);


--
-- Name: sb_thesaurus_vocabulary pk_thesaurus_vocabulary; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_thesaurus_vocabulary
    ADD CONSTRAINT pk_thesaurus_vocabulary PRIMARY KEY (id);


--
-- Name: sb_thumbnail_thumbnail pk_thumbnail_thumbnail; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_thumbnail_thumbnail
    ADD CONSTRAINT pk_thumbnail_thumbnail PRIMARY KEY (objectid, objecttype, instanceid);


--
-- Name: sb_tree_tree pk_tree_tree; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_tree_tree
    ADD CONSTRAINT pk_tree_tree PRIMARY KEY (treeid, id);


--
-- Name: sb_tree_treei18n pk_tree_treei18n; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_tree_treei18n
    ADD CONSTRAINT pk_tree_treei18n PRIMARY KEY (id);


--
-- Name: uniqueid pk_uniqueid; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.uniqueid
    ADD CONSTRAINT pk_uniqueid PRIMARY KEY (tablename);


--
-- Name: st_user pk_user; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_user
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- Name: st_userfavoritespaces pk_userfavoritespaces; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userfavoritespaces
    ADD CONSTRAINT pk_userfavoritespaces PRIMARY KEY (id);


--
-- Name: st_userrole pk_userrole; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole
    ADD CONSTRAINT pk_userrole PRIMARY KEY (id);


--
-- Name: st_userrole_group_rel pk_userrole_group_rel; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole_group_rel
    ADD CONSTRAINT pk_userrole_group_rel PRIMARY KEY (userroleid, groupid);


--
-- Name: st_userrole_user_rel pk_userrole_user_rel; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole_user_rel
    ADD CONSTRAINT pk_userrole_user_rel PRIMARY KEY (userroleid, userid);


--
-- Name: sb_variables_value pk_variables_value; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_variables_value
    ADD CONSTRAINT pk_variables_value PRIMARY KEY (id);


--
-- Name: sb_variables_variable pk_variables_variable; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_variables_variable
    ADD CONSTRAINT pk_variables_variable PRIMARY KEY (id);


--
-- Name: sc_whitepages_card pk_whitepages_card; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_whitepages_card
    ADD CONSTRAINT pk_whitepages_card PRIMARY KEY (id);


--
-- Name: sc_whitepages_searchfields pk_whitepages_searchfields; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_whitepages_searchfields
    ADD CONSTRAINT pk_whitepages_searchfields PRIMARY KEY (id);


--
-- Name: sb_workflow_activestate pk_workflow_activestate; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_activestate
    ADD CONSTRAINT pk_workflow_activestate PRIMARY KEY (id);


--
-- Name: sb_workflow_error pk_workflow_error; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_error
    ADD CONSTRAINT pk_workflow_error PRIMARY KEY (id);


--
-- Name: sb_workflow_historystep pk_workflow_historystep; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_historystep
    ADD CONSTRAINT pk_workflow_historystep PRIMARY KEY (id);


--
-- Name: sb_workflow_interesteduser pk_workflow_interesteduser; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_interesteduser
    ADD CONSTRAINT pk_workflow_interesteduser PRIMARY KEY (id);


--
-- Name: sb_workflow_lockinguser pk_workflow_lockinguser; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_lockinguser
    ADD CONSTRAINT pk_workflow_lockinguser PRIMARY KEY (id);


--
-- Name: sb_workflow_processinstance pk_workflow_processinstance; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_processinstance
    ADD CONSTRAINT pk_workflow_processinstance PRIMARY KEY (instanceid);


--
-- Name: sb_workflow_question pk_workflow_question; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_question
    ADD CONSTRAINT pk_workflow_question PRIMARY KEY (id);


--
-- Name: sb_workflow_undo_step pk_workflow_undo_step; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_undo_step
    ADD CONSTRAINT pk_workflow_undo_step PRIMARY KEY (id);


--
-- Name: sb_workflow_userinfo pk_workflow_userinfo; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_userinfo
    ADD CONSTRAINT pk_workflow_userinfo PRIMARY KEY (id);


--
-- Name: sb_workflow_usersettings pk_workflow_usersettings; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_usersettings
    ADD CONSTRAINT pk_workflow_usersettings PRIMARY KEY (settingsid);


--
-- Name: sb_workflow_workinguser pk_workflow_workinguser; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_workinguser
    ADD CONSTRAINT pk_workflow_workinguser PRIMARY KEY (id);


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars qrtz_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers qrtz_fired_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details qrtz_job_details_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks qrtz_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);


--
-- Name: qrtz_scheduler_state qrtz_scheduler_state_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: sc_community_membership sc_community_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_community_membership
    ADD CONSTRAINT sc_community_membership_pkey PRIMARY KEY (id);


--
-- Name: sc_community sc_community_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_community
    ADD CONSTRAINT sc_community_pkey PRIMARY KEY (id);


--
-- Name: sc_quickinfo_news sc_quickinfo_news_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_quickinfo_news
    ADD CONSTRAINT sc_quickinfo_news_pkey PRIMARY KEY (id);


--
-- Name: sc_suggestion_box sc_suggestion_box_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_suggestion_box
    ADD CONSTRAINT sc_suggestion_box_pkey PRIMARY KEY (id);


--
-- Name: sc_suggestion sc_suggestion_pkey; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_suggestion
    ADD CONSTRAINT sc_suggestion_pkey PRIMARY KEY (id);


--
-- Name: st_accesslevel un_accesslevel_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_accesslevel
    ADD CONSTRAINT un_accesslevel_1 UNIQUE (name);


--
-- Name: sc_community un_community; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_community
    ADD CONSTRAINT un_community UNIQUE (instanceid, spaceid);


--
-- Name: st_componentinstance un_componentinstance_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_componentinstance
    ADD CONSTRAINT un_componentinstance_1 UNIQUE (spaceid, name);


--
-- Name: domainsp_group un_domainsp_group_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.domainsp_group
    ADD CONSTRAINT un_domainsp_group_1 UNIQUE (supergroupid, name);


--
-- Name: domainsp_user un_domainsp_user_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.domainsp_user
    ADD CONSTRAINT un_domainsp_user_1 UNIQUE (login);


--
-- Name: sb_formtemplate_record un_formtemplate_record; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_record
    ADD CONSTRAINT un_formtemplate_record UNIQUE (templateid, externalid, lang);


--
-- Name: sb_formtemplate_template un_formtemplate_template; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_template
    ADD CONSTRAINT un_formtemplate_template UNIQUE (externalid);


--
-- Name: sb_formtemplate_templatefield un_formtemplate_templatefield; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_templatefield
    ADD CONSTRAINT un_formtemplate_templatefield UNIQUE (templateid, fieldindex);


--
-- Name: st_group un_group_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_group
    ADD CONSTRAINT un_group_1 UNIQUE (specificid, domainid);


--
-- Name: st_group un_group_2; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_group
    ADD CONSTRAINT un_group_2 UNIQUE (supergroupid, name, domainid);


--
-- Name: st_instance_data un_instance_data_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_instance_data
    ADD CONSTRAINT un_instance_data_1 UNIQUE (componentid, name);


--
-- Name: sb_node_nodei18n un_node_nodei18n; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_node_nodei18n
    ADD CONSTRAINT un_node_nodei18n UNIQUE (nodeid, lang);


--
-- Name: sb_notation_notation un_sb_notation_notation; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_notation_notation
    ADD CONSTRAINT un_sb_notation_notation UNIQUE (instanceid, externalid, externaltype, author);


--
-- Name: st_space un_space_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_space
    ADD CONSTRAINT un_space_1 UNIQUE (domainfatherid, name);


--
-- Name: st_spaceuserrole un_spaceuserrole_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole
    ADD CONSTRAINT un_spaceuserrole_1 UNIQUE (spaceid, rolename, isinherited);


--
-- Name: st_user un_user_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_user
    ADD CONSTRAINT un_user_1 UNIQUE (specificid, domainid);


--
-- Name: st_user un_user_2; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_user
    ADD CONSTRAINT un_user_2 UNIQUE (login, domainid);


--
-- Name: st_userrole un_userrole_1; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole
    ADD CONSTRAINT un_userrole_1 UNIQUE (instanceid, rolename, isinherited, objectid);


--
-- Name: sb_contentmanager_content uqe_contentmanager_content; Type: CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_contentmanager_content
    ADD CONSTRAINT uqe_contentmanager_content UNIQUE (internalcontentid, contentinstanceid);


--
-- Name: idx_community_component; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_community_component ON public.sc_community USING btree (id, instanceid);


--
-- Name: idx_community_membership; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_community_membership ON public.sc_community_membership USING btree (id, community);


--
-- Name: idx_community_space; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_community_space ON public.sc_community USING btree (id, spaceid);


--
-- Name: idx_datereminder; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_datereminder ON public.st_datereminder USING btree (resourcetype, resourceid);


--
-- Name: idx_incumbent; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_incumbent ON public.sb_workflow_replacements USING btree (incumbentid, workflowid);


--
-- Name: idx_news; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_news ON public.sc_quickinfo_news USING btree (instanceid, id);


--
-- Name: idx_pdcclassification_contentid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_pdcclassification_contentid ON public.pdcclassification USING btree (contentid);


--
-- Name: idx_pdcclassification_instanceid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_pdcclassification_instanceid ON public.pdcclassification USING btree (instanceid);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- Name: idx_reminder_contrib; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_reminder_contrib ON public.sb_reminder USING btree (contrib_id, contrib_instanceid, contrib_type);


--
-- Name: idx_reminder_contrib_user; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_reminder_contrib_user ON public.sb_reminder USING btree (contrib_id, contrib_instanceid, contrib_type, userid);


--
-- Name: idx_reminder_user; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_reminder_user ON public.sb_reminder USING btree (userid);


--
-- Name: idx_sb_contribution_tracking_contribution; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_sb_contribution_tracking_contribution ON public.sb_contribution_tracking USING btree (contrib_id, contrib_type, contrib_instanceid);


--
-- Name: idx_sb_formtemplate_textfield; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_sb_formtemplate_textfield ON public.sb_formtemplate_textfield USING btree (recordid);


--
-- Name: idx_st_dn_channel; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_st_dn_channel ON public.st_delayednotification USING btree (channel);


--
-- Name: idx_st_dn_userid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_st_dn_userid ON public.st_delayednotification USING btree (userid);


--
-- Name: idx_st_dnus_channel; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_st_dnus_channel ON public.st_delayednotifusersetting USING btree (channel);


--
-- Name: idx_st_dnus_uc; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE UNIQUE INDEX idx_st_dnus_uc ON public.st_delayednotifusersetting USING btree (userid, channel);


--
-- Name: idx_st_dnus_userid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_st_dnus_userid ON public.st_delayednotifusersetting USING btree (userid);


--
-- Name: idx_st_nr_resourceid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_st_nr_resourceid ON public.st_notificationresource USING btree (resourceid);


--
-- Name: idx_substitute; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_substitute ON public.sb_workflow_replacements USING btree (substituteid, workflowid);


--
-- Name: idx_suggestion; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_suggestion ON public.sc_suggestion USING btree (suggestionboxid, id);


--
-- Name: idx_suggestion_box; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX idx_suggestion_box ON public.sc_suggestion_box USING btree (instanceid, id);


--
-- Name: idx_uc_st_quota; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE UNIQUE INDEX idx_uc_st_quota ON public.st_quota USING btree (quotatype, resourceid);


--
-- Name: idx_uc_st_token; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE UNIQUE INDEX idx_uc_st_token ON public.st_token USING btree (tokentype, resourceid);


--
-- Name: in_classifyengine_axis0; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis0 ON public.sb_classifyengine_classify USING btree (axis0);


--
-- Name: in_classifyengine_axis1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis1 ON public.sb_classifyengine_classify USING btree (axis1);


--
-- Name: in_classifyengine_axis10; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis10 ON public.sb_classifyengine_classify USING btree (axis10);


--
-- Name: in_classifyengine_axis11; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis11 ON public.sb_classifyengine_classify USING btree (axis11);


--
-- Name: in_classifyengine_axis12; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis12 ON public.sb_classifyengine_classify USING btree (axis12);


--
-- Name: in_classifyengine_axis13; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis13 ON public.sb_classifyengine_classify USING btree (axis13);


--
-- Name: in_classifyengine_axis14; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis14 ON public.sb_classifyengine_classify USING btree (axis14);


--
-- Name: in_classifyengine_axis15; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis15 ON public.sb_classifyengine_classify USING btree (axis15);


--
-- Name: in_classifyengine_axis16; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis16 ON public.sb_classifyengine_classify USING btree (axis16);


--
-- Name: in_classifyengine_axis17; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis17 ON public.sb_classifyengine_classify USING btree (axis17);


--
-- Name: in_classifyengine_axis18; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis18 ON public.sb_classifyengine_classify USING btree (axis18);


--
-- Name: in_classifyengine_axis19; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis19 ON public.sb_classifyengine_classify USING btree (axis19);


--
-- Name: in_classifyengine_axis2; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis2 ON public.sb_classifyengine_classify USING btree (axis2);


--
-- Name: in_classifyengine_axis20; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis20 ON public.sb_classifyengine_classify USING btree (axis20);


--
-- Name: in_classifyengine_axis21; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis21 ON public.sb_classifyengine_classify USING btree (axis21);


--
-- Name: in_classifyengine_axis22; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis22 ON public.sb_classifyengine_classify USING btree (axis22);


--
-- Name: in_classifyengine_axis23; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis23 ON public.sb_classifyengine_classify USING btree (axis23);


--
-- Name: in_classifyengine_axis24; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis24 ON public.sb_classifyengine_classify USING btree (axis24);


--
-- Name: in_classifyengine_axis25; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis25 ON public.sb_classifyengine_classify USING btree (axis25);


--
-- Name: in_classifyengine_axis26; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis26 ON public.sb_classifyengine_classify USING btree (axis26);


--
-- Name: in_classifyengine_axis27; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis27 ON public.sb_classifyengine_classify USING btree (axis27);


--
-- Name: in_classifyengine_axis28; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis28 ON public.sb_classifyengine_classify USING btree (axis28);


--
-- Name: in_classifyengine_axis29; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis29 ON public.sb_classifyengine_classify USING btree (axis29);


--
-- Name: in_classifyengine_axis3; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis3 ON public.sb_classifyengine_classify USING btree (axis3);


--
-- Name: in_classifyengine_axis30; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis30 ON public.sb_classifyengine_classify USING btree (axis30);


--
-- Name: in_classifyengine_axis31; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis31 ON public.sb_classifyengine_classify USING btree (axis31);


--
-- Name: in_classifyengine_axis32; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis32 ON public.sb_classifyengine_classify USING btree (axis32);


--
-- Name: in_classifyengine_axis33; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis33 ON public.sb_classifyengine_classify USING btree (axis33);


--
-- Name: in_classifyengine_axis34; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis34 ON public.sb_classifyengine_classify USING btree (axis34);


--
-- Name: in_classifyengine_axis35; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis35 ON public.sb_classifyengine_classify USING btree (axis35);


--
-- Name: in_classifyengine_axis36; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis36 ON public.sb_classifyengine_classify USING btree (axis36);


--
-- Name: in_classifyengine_axis37; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis37 ON public.sb_classifyengine_classify USING btree (axis37);


--
-- Name: in_classifyengine_axis38; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis38 ON public.sb_classifyengine_classify USING btree (axis38);


--
-- Name: in_classifyengine_axis39; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis39 ON public.sb_classifyengine_classify USING btree (axis39);


--
-- Name: in_classifyengine_axis4; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis4 ON public.sb_classifyengine_classify USING btree (axis4);


--
-- Name: in_classifyengine_axis40; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis40 ON public.sb_classifyengine_classify USING btree (axis40);


--
-- Name: in_classifyengine_axis41; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis41 ON public.sb_classifyengine_classify USING btree (axis41);


--
-- Name: in_classifyengine_axis42; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis42 ON public.sb_classifyengine_classify USING btree (axis42);


--
-- Name: in_classifyengine_axis43; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis43 ON public.sb_classifyengine_classify USING btree (axis43);


--
-- Name: in_classifyengine_axis44; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis44 ON public.sb_classifyengine_classify USING btree (axis44);


--
-- Name: in_classifyengine_axis45; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis45 ON public.sb_classifyengine_classify USING btree (axis45);


--
-- Name: in_classifyengine_axis46; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis46 ON public.sb_classifyengine_classify USING btree (axis46);


--
-- Name: in_classifyengine_axis47; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis47 ON public.sb_classifyengine_classify USING btree (axis47);


--
-- Name: in_classifyengine_axis48; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis48 ON public.sb_classifyengine_classify USING btree (axis48);


--
-- Name: in_classifyengine_axis49; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis49 ON public.sb_classifyengine_classify USING btree (axis49);


--
-- Name: in_classifyengine_axis5; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis5 ON public.sb_classifyengine_classify USING btree (axis5);


--
-- Name: in_classifyengine_axis6; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis6 ON public.sb_classifyengine_classify USING btree (axis6);


--
-- Name: in_classifyengine_axis7; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis7 ON public.sb_classifyengine_classify USING btree (axis7);


--
-- Name: in_classifyengine_axis8; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis8 ON public.sb_classifyengine_classify USING btree (axis8);


--
-- Name: in_classifyengine_axis9; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_axis9 ON public.sb_classifyengine_classify USING btree (axis9);


--
-- Name: in_classifyengine_objectid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_classifyengine_objectid ON public.sb_classifyengine_classify USING btree (objectid);


--
-- Name: in_containermanager_links_dlb; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_containermanager_links_dlb ON public.sb_containermanager_links USING btree (positionid, containerinstanceid);


--
-- Name: in_coordinates_leafid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_coordinates_leafid ON public.sb_coordinates_coordinates USING btree (coordinatesleaf, coordinatesid);


--
-- Name: in_notifaddress_1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_notifaddress_1 ON public.st_notifaddress USING btree (userid);


--
-- Name: in_notifpreference_1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE UNIQUE INDEX in_notifpreference_1 ON public.st_notifpreference USING btree (userid, componentinstanceid, messagetype);


--
-- Name: in_notifsendedreceiver; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_notifsendedreceiver ON public.st_notifsendedreceiver USING btree (notifid);


--
-- Name: in_publi_father; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_publi_father ON public.sb_publication_publifather USING btree (nodeid);


--
-- Name: in_sb_pdc_axis_1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_sb_pdc_axis_1 ON public.sb_pdc_axis USING btree (axistype);


--
-- Name: in_sb_pdc_utilization_1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_sb_pdc_utilization_1 ON public.sb_pdc_utilization USING btree (basevalue);


--
-- Name: in_sb_pdc_utilization_2; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_sb_pdc_utilization_2 ON public.sb_pdc_utilization USING btree (instanceid);


--
-- Name: in_sb_tree_tree_1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX in_sb_tree_tree_1 ON public.sb_tree_tree USING btree (path);


--
-- Name: ind_classifieds_subscribes; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_classifieds_subscribes ON public.sc_classifieds_subscribes USING btree (subscribeid);


--
-- Name: ind_contact_groupfather; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_contact_groupfather ON public.sc_contact_groupfather USING btree (fatherid, instanceid);


--
-- Name: ind_order; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_order ON public.sc_gallery_orderdetail USING btree (orderid);


--
-- Name: ind_path; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_path ON public.sc_gallery_path USING btree (nodeid);


--
-- Name: ind_sc_scheduleevent_contributor_1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_sc_scheduleevent_contributor_1 ON public.sc_scheduleevent_contributor USING btree (scheduleeventid);


--
-- Name: ind_sc_scheduleevent_contributor_2; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_sc_scheduleevent_contributor_2 ON public.sc_scheduleevent_contributor USING btree (userid);


--
-- Name: ind_sc_scheduleevent_response_1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_sc_scheduleevent_response_1 ON public.sc_scheduleevent_response USING btree (scheduleeventid, userid);


--
-- Name: ind_st_instance_modelused; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_st_instance_modelused ON public.st_instance_modelused USING btree (instanceid, modelid);


--
-- Name: ind_state_connectioncumul1; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_state_connectioncumul1 ON public.sb_stat_connectioncumul USING btree (datestat);


--
-- Name: ind_state_connectioncumul2; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_state_connectioncumul2 ON public.sb_stat_connectioncumul USING btree (userid);


--
-- Name: ind_statistic_resourceid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_statistic_resourceid ON public.sb_statistic_history USING btree (resourceid);


--
-- Name: ind_statistic_userid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX ind_statistic_userid ON public.sb_statistic_history USING btree (userid);


--
-- Name: index_sb_agenda_holidays; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX index_sb_agenda_holidays ON public.sb_agenda_holidays USING btree (userid);


--
-- Name: jargon_iduser; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX jargon_iduser ON public.sb_thesaurus_jargon USING btree (iduser);


--
-- Name: questionreply_instanceid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX questionreply_instanceid ON public.sc_questionreply_question USING btree (instanceid);


--
-- Name: questionreply_userid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX questionreply_userid ON public.sc_questionreply_recipient USING btree (userid);


--
-- Name: synonym_termvoca; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX synonym_termvoca ON public.sb_thesaurus_synonym USING btree (idvoca, idtree, idterm);


--
-- Name: whitepages_instid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX whitepages_instid ON public.sc_whitepages_card USING btree (instanceid);


--
-- Name: whitepages_searchfieldsinstid; Type: INDEX; Schema: public; Owner: silverpeas
--

CREATE INDEX whitepages_searchfieldsinstid ON public.sc_whitepages_searchfields USING btree (instanceid);


--
-- Name: st_delayednotification const_st_dn_fk_nrid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_delayednotification
    ADD CONSTRAINT const_st_dn_fk_nrid FOREIGN KEY (notificationresourceid) REFERENCES public.st_notificationresource(id);


--
-- Name: st_delayednotification const_st_dn_fk_userid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_delayednotification
    ADD CONSTRAINT const_st_dn_fk_userid FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: st_delayednotifusersetting const_st_dnus_fk_userid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_delayednotifusersetting
    ADD CONSTRAINT const_st_dnus_fk_userid FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: sc_mailinglist_external_user fk9290f7c94b1a1b47; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_external_user
    ADD CONSTRAINT fk9290f7c94b1a1b47 FOREIGN KEY (listid) REFERENCES public.sc_mailinglist_list(id);


--
-- Name: sb_cal_attendees fk_attendee_component; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_attendees
    ADD CONSTRAINT fk_attendee_component FOREIGN KEY (componentid) REFERENCES public.sb_cal_components(id);


--
-- Name: sb_cal_components fk_calendar; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_components
    ADD CONSTRAINT fk_calendar FOREIGN KEY (calendarid) REFERENCES public.sb_cal_calendar(id);


--
-- Name: sc_community_membership fk_community; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_community_membership
    ADD CONSTRAINT fk_community FOREIGN KEY (community) REFERENCES public.sc_community(id);


--
-- Name: st_componentinstance fk_componentinstance_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_componentinstance
    ADD CONSTRAINT fk_componentinstance_1 FOREIGN KEY (spaceid) REFERENCES public.st_space(id);


--
-- Name: st_componentinstance fk_componentinstance_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_componentinstance
    ADD CONSTRAINT fk_componentinstance_2 FOREIGN KEY (createdby) REFERENCES public.st_user(id);


--
-- Name: sc_scheduleevent_contributor fk_contributor_scheduleeventid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_scheduleevent_contributor
    ADD CONSTRAINT fk_contributor_scheduleeventid FOREIGN KEY (scheduleeventid) REFERENCES public.sc_scheduleevent_list(id);


--
-- Name: sb_cal_attendees fk_delegate; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_attendees
    ADD CONSTRAINT fk_delegate FOREIGN KEY (delegate) REFERENCES public.sb_cal_attendees(id);


--
-- Name: domainsp_group fk_domainsp_group_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.domainsp_group
    ADD CONSTRAINT fk_domainsp_group_1 FOREIGN KEY (supergroupid) REFERENCES public.domainsp_group(id);


--
-- Name: domainsp_group_user_rel fk_domainsp_group_user_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.domainsp_group_user_rel
    ADD CONSTRAINT fk_domainsp_group_user_rel_1 FOREIGN KEY (groupid) REFERENCES public.domainsp_group(id);


--
-- Name: domainsp_group_user_rel fk_domainsp_group_user_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.domainsp_group_user_rel
    ADD CONSTRAINT fk_domainsp_group_user_rel_2 FOREIGN KEY (userid) REFERENCES public.domainsp_user(id);


--
-- Name: sb_cal_event fk_event_component; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_event
    ADD CONSTRAINT fk_event_component FOREIGN KEY (componentid) REFERENCES public.sb_cal_components(id);


--
-- Name: sb_cal_event fk_event_recurrence; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_event
    ADD CONSTRAINT fk_event_recurrence FOREIGN KEY (recurrenceid) REFERENCES public.sb_cal_recurrence(id);


--
-- Name: sc_formsonline_forminstances fk_forminstance; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_formsonline_forminstances
    ADD CONSTRAINT fk_forminstance FOREIGN KEY (formid) REFERENCES public.sc_formsonline_forms(id);


--
-- Name: sb_formtemplate_record fk_formtemplate_record; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_record
    ADD CONSTRAINT fk_formtemplate_record FOREIGN KEY (templateid) REFERENCES public.sb_formtemplate_template(templateid);


--
-- Name: sb_formtemplate_templatefield fk_formtemplate_templatefield; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_templatefield
    ADD CONSTRAINT fk_formtemplate_templatefield FOREIGN KEY (templateid) REFERENCES public.sb_formtemplate_template(templateid);


--
-- Name: sb_formtemplate_textfield fk_formtemplate_textfield; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_formtemplate_textfield
    ADD CONSTRAINT fk_formtemplate_textfield FOREIGN KEY (recordid) REFERENCES public.sb_formtemplate_record(recordid);


--
-- Name: sc_community fk_group; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_community
    ADD CONSTRAINT fk_group FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- Name: st_group fk_group_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_group
    ADD CONSTRAINT fk_group_1 FOREIGN KEY (supergroupid) REFERENCES public.st_group(id);


--
-- Name: st_group_user_rel fk_group_user_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_group_user_rel
    ADD CONSTRAINT fk_group_user_rel_1 FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- Name: st_group_user_rel fk_group_user_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_group_user_rel
    ADD CONSTRAINT fk_group_user_rel_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: sc_formsonline_grouprights fk_grouprights; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_formsonline_grouprights
    ADD CONSTRAINT fk_grouprights FOREIGN KEY (formid) REFERENCES public.sc_formsonline_forms(id);


--
-- Name: st_instance_data fk_instance_data_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_instance_data
    ADD CONSTRAINT fk_instance_data_1 FOREIGN KEY (componentid) REFERENCES public.st_componentinstance(id);


--
-- Name: sb_mylinks_linkcat fk_mylinks_cat_id; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_mylinks_linkcat
    ADD CONSTRAINT fk_mylinks_cat_id FOREIGN KEY (catid) REFERENCES public.sb_mylinks_cat(catid);


--
-- Name: sb_mylinks_linkcat fk_mylinks_link_id; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_mylinks_linkcat
    ADD CONSTRAINT fk_mylinks_link_id FOREIGN KEY (linkid) REFERENCES public.sb_mylinks_link(linkid);


--
-- Name: st_notifaddress fk_notifaddress_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifaddress
    ADD CONSTRAINT fk_notifaddress_1 FOREIGN KEY (notifchannelid) REFERENCES public.st_notifchannel(id);


--
-- Name: st_notifaddress fk_notifaddress_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifaddress
    ADD CONSTRAINT fk_notifaddress_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: st_notifdefaultaddress fk_notifdefaultaddress_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifdefaultaddress
    ADD CONSTRAINT fk_notifdefaultaddress_1 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: st_notifpreference fk_notifpreference_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifpreference
    ADD CONSTRAINT fk_notifpreference_1 FOREIGN KEY (componentinstanceid) REFERENCES public.st_componentinstance(id);


--
-- Name: st_notifpreference fk_notifpreference_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_notifpreference
    ADD CONSTRAINT fk_notifpreference_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: sb_cal_occurrences fk_occurrence_component; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_occurrences
    ADD CONSTRAINT fk_occurrence_component FOREIGN KEY (componentid) REFERENCES public.sb_cal_components(id);


--
-- Name: sb_cal_occurrences fk_occurrence_event; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_occurrences
    ADD CONSTRAINT fk_occurrence_event FOREIGN KEY (eventid) REFERENCES public.sb_cal_event(id);


--
-- Name: sc_scheduleevent_options fk_options_eventid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_scheduleevent_options
    ADD CONSTRAINT fk_options_eventid FOREIGN KEY (scheduleeventid) REFERENCES public.sc_scheduleevent_list(id);


--
-- Name: sb_pdc_group_rights fk_pdc_group_rights_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_group_rights
    ADD CONSTRAINT fk_pdc_group_rights_1 FOREIGN KEY (axisid) REFERENCES public.sb_pdc_axis(id);


--
-- Name: sb_pdc_group_rights fk_pdc_group_rights_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_group_rights
    ADD CONSTRAINT fk_pdc_group_rights_2 FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- Name: sb_pdc_user_rights fk_pdc_user_rights_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_user_rights
    ADD CONSTRAINT fk_pdc_user_rights_1 FOREIGN KEY (axisid) REFERENCES public.sb_pdc_axis(id);


--
-- Name: sb_pdc_user_rights fk_pdc_user_rights_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_pdc_user_rights
    ADD CONSTRAINT fk_pdc_user_rights_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: pdcclassification_pdcposition fk_pdcclassification_pdcposition_positionid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcclassification_pdcposition
    ADD CONSTRAINT fk_pdcclassification_pdcposition_positionid FOREIGN KEY (positions_id) REFERENCES public.pdcposition(id);


--
-- Name: pdcclassification_pdcposition fk_pdcclassification_pdcposition_positionid_pdcclassificationid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcclassification_pdcposition
    ADD CONSTRAINT fk_pdcclassification_pdcposition_positionid_pdcclassificationid FOREIGN KEY (pdcclassification_id) REFERENCES public.pdcclassification(id);


--
-- Name: pdcposition_pdcaxisvalue fk_pdcposition_pdcaxisvalue_pdcaxisvalueid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcposition_pdcaxisvalue
    ADD CONSTRAINT fk_pdcposition_pdcaxisvalue_pdcaxisvalueid FOREIGN KEY (axisvalues_valueid, axisvalues_axisid) REFERENCES public.pdcaxisvalue(valueid, axisid);


--
-- Name: pdcposition_pdcaxisvalue fk_pdcposition_pdcaxisvalue_pdcpositionid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.pdcposition_pdcaxisvalue
    ADD CONSTRAINT fk_pdcposition_pdcaxisvalue_pdcpositionid FOREIGN KEY (pdcposition_id) REFERENCES public.pdcposition(id);


--
-- Name: sb_cal_recurrence_dayofweek fk_recurrence_dayofweek; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_recurrence_dayofweek
    ADD CONSTRAINT fk_recurrence_dayofweek FOREIGN KEY (recurrenceid) REFERENCES public.sb_cal_recurrence(id);


--
-- Name: sb_cal_recurrence_exception fk_recurrence_exception; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_cal_recurrence_exception
    ADD CONSTRAINT fk_recurrence_exception FOREIGN KEY (recurrenceid) REFERENCES public.sb_cal_recurrence(id);


--
-- Name: sc_scheduleevent_response fk_response_optionid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_scheduleevent_response
    ADD CONSTRAINT fk_response_optionid FOREIGN KEY (optionid) REFERENCES public.sc_scheduleevent_options(id);


--
-- Name: sc_scheduleevent_response fk_response_scheduleeventid; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_scheduleevent_response
    ADD CONSTRAINT fk_response_scheduleeventid FOREIGN KEY (scheduleeventid) REFERENCES public.sc_scheduleevent_list(id);


--
-- Name: sc_formsonline_forminstvali fk_sc_formsonline_forminstances_id; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_formsonline_forminstvali
    ADD CONSTRAINT fk_sc_formsonline_forminstances_id FOREIGN KEY (forminstid) REFERENCES public.sc_formsonline_forminstances(id);


--
-- Name: st_space fk_space_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_space
    ADD CONSTRAINT fk_space_1 FOREIGN KEY (createdby) REFERENCES public.st_user(id);


--
-- Name: st_space fk_space_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_space
    ADD CONSTRAINT fk_space_2 FOREIGN KEY (domainfatherid) REFERENCES public.st_space(id);


--
-- Name: st_spaceuserrole fk_spaceuserrole_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole
    ADD CONSTRAINT fk_spaceuserrole_1 FOREIGN KEY (spaceid) REFERENCES public.st_space(id);


--
-- Name: st_spaceuserrole_group_rel fk_spaceuserrole_group_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole_group_rel
    ADD CONSTRAINT fk_spaceuserrole_group_rel_1 FOREIGN KEY (spaceuserroleid) REFERENCES public.st_spaceuserrole(id);


--
-- Name: st_spaceuserrole_group_rel fk_spaceuserrole_group_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole_group_rel
    ADD CONSTRAINT fk_spaceuserrole_group_rel_2 FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- Name: st_spaceuserrole_user_rel fk_spaceuserrole_user_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole_user_rel
    ADD CONSTRAINT fk_spaceuserrole_user_rel_1 FOREIGN KEY (spaceuserroleid) REFERENCES public.st_spaceuserrole(id);


--
-- Name: st_spaceuserrole_user_rel fk_spaceuserrole_user_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_spaceuserrole_user_rel
    ADD CONSTRAINT fk_spaceuserrole_user_rel_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: sc_mailinglist_internal_sub fk_subscriber_mailinglist_id; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_internal_sub
    ADD CONSTRAINT fk_subscriber_mailinglist_id FOREIGN KEY (mailinglistid) REFERENCES public.sc_mailinglist_list(id);


--
-- Name: sc_community_membership fk_user; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_community_membership
    ADD CONSTRAINT fk_user FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: st_user fk_user_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_user
    ADD CONSTRAINT fk_user_1 FOREIGN KEY (accesslevel) REFERENCES public.st_accesslevel(id);


--
-- Name: st_userfavoritespaces fk_userfavoritespaces_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userfavoritespaces
    ADD CONSTRAINT fk_userfavoritespaces_1 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: st_userfavoritespaces fk_userfavoritespaces_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userfavoritespaces
    ADD CONSTRAINT fk_userfavoritespaces_2 FOREIGN KEY (spaceid) REFERENCES public.st_space(id);


--
-- Name: sc_formsonline_userrights fk_userrights; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_formsonline_userrights
    ADD CONSTRAINT fk_userrights FOREIGN KEY (formid) REFERENCES public.sc_formsonline_forms(id);


--
-- Name: st_userrole fk_userrole_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole
    ADD CONSTRAINT fk_userrole_1 FOREIGN KEY (instanceid) REFERENCES public.st_componentinstance(id);


--
-- Name: st_userrole_group_rel fk_userrole_group_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole_group_rel
    ADD CONSTRAINT fk_userrole_group_rel_1 FOREIGN KEY (userroleid) REFERENCES public.st_userrole(id);


--
-- Name: st_userrole_group_rel fk_userrole_group_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole_group_rel
    ADD CONSTRAINT fk_userrole_group_rel_2 FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- Name: st_userrole_user_rel fk_userrole_user_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole_user_rel
    ADD CONSTRAINT fk_userrole_user_rel_1 FOREIGN KEY (userroleid) REFERENCES public.st_userrole(id);


--
-- Name: st_userrole_user_rel fk_userrole_user_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.st_userrole_user_rel
    ADD CONSTRAINT fk_userrole_user_rel_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- Name: sb_variables_value fk_variables_value; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_variables_value
    ADD CONSTRAINT fk_variables_value FOREIGN KEY (variableid) REFERENCES public.sb_variables_variable(id);


--
-- Name: sb_workflow_activestate fk_workflow_activestate; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_activestate
    ADD CONSTRAINT fk_workflow_activestate FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- Name: sb_workflow_historystep fk_workflow_historystep; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_historystep
    ADD CONSTRAINT fk_workflow_historystep FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- Name: sb_workflow_interesteduser fk_workflow_interesteduser; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_interesteduser
    ADD CONSTRAINT fk_workflow_interesteduser FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- Name: sb_workflow_lockinguser fk_workflow_lockinguser; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_lockinguser
    ADD CONSTRAINT fk_workflow_lockinguser FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- Name: sb_workflow_question fk_workflow_question; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_question
    ADD CONSTRAINT fk_workflow_question FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- Name: sb_workflow_userinfo fk_workflow_userinfo; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_userinfo
    ADD CONSTRAINT fk_workflow_userinfo FOREIGN KEY (settingsid) REFERENCES public.sb_workflow_usersettings(settingsid);


--
-- Name: sb_workflow_workinguser fk_workflow_workinguser; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sb_workflow_workinguser
    ADD CONSTRAINT fk_workflow_workinguser FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- Name: sc_mailinglist_attachment fkce814959db1c14ee; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.sc_mailinglist_attachment
    ADD CONSTRAINT fkce814959db1c14ee FOREIGN KEY (messageid) REFERENCES public.sc_mailinglist_message(id);


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_trigger_name_trigger_grou_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_trigger_name_trigger_grou_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_sched_name_job_name_job_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silverpeas
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_job_name_job_group_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: silverpeas
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict tEVNcOTeG0eHduBl5KDkehJLEaGeU6imXl8jp43MOzDtCl5dWG0jw5bUsNvjbC5

