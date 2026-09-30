<?php
###############################
## ResourceSpace
## Local Configuration Script
###############################

# MySQL database settings
$mysql_server = 'db';
$mysql_username = 'resourcespace';
$mysql_password = 'AdminPassword123!';
$mysql_db = 'resourcespace';

# Base URL of the installation
$baseurl = 'http://localhost:18863';

# Email settings
$email_notify = 'admin@example.com';
$email_from = 'admin@example.com';

# Application name
$applicationname = 'ResourceSpace';

# Secure keys
$scramble_key = '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';
$api_scramble_key = 'fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210';

# Paths for tools
$imagemagick_path = '/usr/bin';
$ghostscript_path = '/usr/bin';
$ffmpeg_path = '/usr/bin';
$exiftool_path = '/usr/bin';
$pdftotext_path = '/usr/bin';

$homeanim_folder = 'filestore/system/slideshow_default';

# Storage
$storagedir = '/var/www/html/filestore';
$storageurl = 'http://localhost:18863/filestore';

# Disable installation check / setup redirection
$suppress_headers = false;

# New installation defaults
$imagemagick_colorspace = "sRGB";
$contact_link = false;
$stemming = true;
$case_insensitive_username = true;
$user_pref_user_management_notifications = true;
$use_zip_extension = true;
$collection_download = true;
$ffmpeg_preview_force = true;
$ffmpeg_preview_extension = 'mp4';
$ffmpeg_preview_options = '-f mp4 -b:v 1200k -b:a 64k -ac 1 -c:v libx264 -pix_fmt yuv420p -profile:v baseline -level 3 -c:a aac -strict -2';
$daterange_search = true;
$upload_then_edit = true;
$purge_temp_folder_age = 90;
$filestore_evenspread = true;
$comments_resource_enable = true;
$api_upload_urls = array();
$use_native_input_for_date_field = true;
$resource_view_use_pre = true;
$sort_tabs = false;
$maxyear_extends_current = 5;
$thumbs_display_archive_state = true;
$file_checksums = true;
$hide_real_filepath = true;
$annotate_enabled = true;
$plugins[] = "brand_guidelines";
