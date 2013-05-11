CREATE TABLE actions (
aid VARCHAR(255) NOT NULL DEFAULT '0', 
type VARCHAR(32) NOT NULL DEFAULT '', 
callback VARCHAR(255) NOT NULL DEFAULT '', 
parameters BLOB NOT NULL, 
label VARCHAR(255) NOT NULL DEFAULT '0', 
 PRIMARY KEY (aid)
);
CREATE TABLE authmap (
aid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (aid>= 0), 
uid INTEGER NOT NULL DEFAULT 0, 
authname VARCHAR(128) NOT NULL DEFAULT '', 
module VARCHAR(128) NOT NULL DEFAULT ''
);
CREATE TABLE batch (
bid INTEGER NOT NULL CHECK (bid>= 0), 
token VARCHAR(64) NOT NULL, 
timestamp INTEGER NOT NULL, 
batch BLOB NULL DEFAULT NULL, 
 PRIMARY KEY (bid)
);
CREATE TABLE block (
bid INTEGER PRIMARY KEY AUTOINCREMENT, 
module VARCHAR(64) NOT NULL DEFAULT '', 
delta VARCHAR(32) NOT NULL DEFAULT '0', 
theme VARCHAR(64) NOT NULL DEFAULT '', 
status INTEGER NOT NULL DEFAULT 0, 
weight INTEGER NOT NULL DEFAULT 0, 
region VARCHAR(64) NOT NULL DEFAULT '', 
custom INTEGER NOT NULL DEFAULT 0, 
visibility INTEGER NOT NULL DEFAULT 0, 
pages TEXT NOT NULL, 
title VARCHAR(64) NOT NULL DEFAULT '', 
cache INTEGER NOT NULL DEFAULT 1
);
CREATE TABLE block_custom (
bid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (bid>= 0), 
body TEXT NULL DEFAULT NULL, 
info VARCHAR(128) NOT NULL DEFAULT '', 
format VARCHAR(255) NULL DEFAULT NULL
);
CREATE TABLE block_node_type (
module VARCHAR(64) NOT NULL, 
delta VARCHAR(32) NOT NULL, 
type VARCHAR(32) NOT NULL, 
 PRIMARY KEY (module, delta, type)
);
CREATE TABLE block_role (
module VARCHAR(64) NOT NULL, 
delta VARCHAR(32) NOT NULL, 
rid INTEGER NOT NULL CHECK (rid>= 0), 
 PRIMARY KEY (module, delta, rid)
);
CREATE TABLE blocked_ips (
iid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (iid>= 0), 
ip VARCHAR(40) NOT NULL DEFAULT ''
);
CREATE TABLE cache (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_block (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_bootstrap (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_field (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_filter (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_form (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_image (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_menu (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_page (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_path (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE cache_update (
cid VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0, 
serialized INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (cid)
);
CREATE TABLE comment (
cid INTEGER PRIMARY KEY AUTOINCREMENT, 
pid INTEGER NOT NULL DEFAULT 0, 
nid INTEGER NOT NULL DEFAULT 0, 
uid INTEGER NOT NULL DEFAULT 0, 
subject VARCHAR(64) NOT NULL DEFAULT '', 
hostname VARCHAR(128) NOT NULL DEFAULT '', 
created INTEGER NOT NULL DEFAULT 0, 
changed INTEGER NOT NULL DEFAULT 0, 
status INTEGER NOT NULL CHECK (status>= 0) DEFAULT 1, 
thread VARCHAR(255) NOT NULL, 
name VARCHAR(60) NULL DEFAULT NULL, 
mail VARCHAR(64) NULL DEFAULT NULL, 
homepage VARCHAR(255) NULL DEFAULT NULL, 
language VARCHAR(12) NOT NULL DEFAULT ''
);
CREATE TABLE date_format_locale (
format VARCHAR(100) NOT NULL, 
type VARCHAR(64) NOT NULL, 
language VARCHAR(12) NOT NULL, 
 PRIMARY KEY (type, language)
);
CREATE TABLE date_format_type (
type VARCHAR(64) NOT NULL, 
title VARCHAR(255) NOT NULL, 
locked INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (type)
);
CREATE TABLE date_formats (
dfid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (dfid>= 0), 
format VARCHAR(100) NOT NULL, 
type VARCHAR(64) NOT NULL, 
locked INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE field_config (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
field_name VARCHAR(32) NOT NULL, 
type VARCHAR(128) NOT NULL, 
module VARCHAR(128) NOT NULL DEFAULT '', 
active INTEGER NOT NULL DEFAULT 0, 
storage_type VARCHAR(128) NOT NULL, 
storage_module VARCHAR(128) NOT NULL DEFAULT '', 
storage_active INTEGER NOT NULL DEFAULT 0, 
locked INTEGER NOT NULL DEFAULT 0, 
data BLOB NOT NULL, 
cardinality INTEGER NOT NULL DEFAULT 0, 
translatable INTEGER NOT NULL DEFAULT 0, 
deleted INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE field_config_instance (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
field_id INTEGER NOT NULL, 
field_name VARCHAR(32) NOT NULL DEFAULT '', 
entity_type VARCHAR(32) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
data BLOB NOT NULL, 
deleted INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE field_data_body (
entity_type VARCHAR(128) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
deleted INTEGER NOT NULL DEFAULT 0, 
entity_id INTEGER NOT NULL CHECK (entity_id>= 0), 
revision_id INTEGER NULL CHECK (revision_id>= 0) DEFAULT NULL, 
language VARCHAR(32) NOT NULL DEFAULT '', 
delta INTEGER NOT NULL CHECK (delta>= 0), 
body_value TEXT NULL DEFAULT NULL, 
body_summary TEXT NULL DEFAULT NULL, 
body_format VARCHAR(255) NULL DEFAULT NULL, 
 PRIMARY KEY (entity_type, entity_id, deleted, delta, language)
);
CREATE TABLE field_data_comment_body (
entity_type VARCHAR(128) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
deleted INTEGER NOT NULL DEFAULT 0, 
entity_id INTEGER NOT NULL CHECK (entity_id>= 0), 
revision_id INTEGER NULL CHECK (revision_id>= 0) DEFAULT NULL, 
language VARCHAR(32) NOT NULL DEFAULT '', 
delta INTEGER NOT NULL CHECK (delta>= 0), 
comment_body_value TEXT NULL DEFAULT NULL, 
comment_body_format VARCHAR(255) NULL DEFAULT NULL, 
 PRIMARY KEY (entity_type, entity_id, deleted, delta, language)
);
CREATE TABLE field_data_field_image (
entity_type VARCHAR(128) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
deleted INTEGER NOT NULL DEFAULT 0, 
entity_id INTEGER NOT NULL CHECK (entity_id>= 0), 
revision_id INTEGER NULL CHECK (revision_id>= 0) DEFAULT NULL, 
language VARCHAR(32) NOT NULL DEFAULT '', 
delta INTEGER NOT NULL CHECK (delta>= 0), 
field_image_fid INTEGER NULL CHECK (field_image_fid>= 0) DEFAULT NULL, 
field_image_alt VARCHAR(128) NULL DEFAULT NULL, 
field_image_title VARCHAR(128) NULL DEFAULT NULL, 
 PRIMARY KEY (entity_type, entity_id, deleted, delta, language)
);
CREATE TABLE field_data_field_tags (
entity_type VARCHAR(128) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
deleted INTEGER NOT NULL DEFAULT 0, 
entity_id INTEGER NOT NULL CHECK (entity_id>= 0), 
revision_id INTEGER NULL CHECK (revision_id>= 0) DEFAULT NULL, 
language VARCHAR(32) NOT NULL DEFAULT '', 
delta INTEGER NOT NULL CHECK (delta>= 0), 
field_tags_tid INTEGER NULL CHECK (field_tags_tid>= 0) DEFAULT NULL, 
 PRIMARY KEY (entity_type, entity_id, deleted, delta, language)
);
CREATE TABLE field_revision_body (
entity_type VARCHAR(128) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
deleted INTEGER NOT NULL DEFAULT 0, 
entity_id INTEGER NOT NULL CHECK (entity_id>= 0), 
revision_id INTEGER NOT NULL CHECK (revision_id>= 0), 
language VARCHAR(32) NOT NULL DEFAULT '', 
delta INTEGER NOT NULL CHECK (delta>= 0), 
body_value TEXT NULL DEFAULT NULL, 
body_summary TEXT NULL DEFAULT NULL, 
body_format VARCHAR(255) NULL DEFAULT NULL, 
 PRIMARY KEY (entity_type, entity_id, revision_id, deleted, delta, language)
);
CREATE TABLE field_revision_comment_body (
entity_type VARCHAR(128) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
deleted INTEGER NOT NULL DEFAULT 0, 
entity_id INTEGER NOT NULL CHECK (entity_id>= 0), 
revision_id INTEGER NOT NULL CHECK (revision_id>= 0), 
language VARCHAR(32) NOT NULL DEFAULT '', 
delta INTEGER NOT NULL CHECK (delta>= 0), 
comment_body_value TEXT NULL DEFAULT NULL, 
comment_body_format VARCHAR(255) NULL DEFAULT NULL, 
 PRIMARY KEY (entity_type, entity_id, revision_id, deleted, delta, language)
);
CREATE TABLE field_revision_field_image (
entity_type VARCHAR(128) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
deleted INTEGER NOT NULL DEFAULT 0, 
entity_id INTEGER NOT NULL CHECK (entity_id>= 0), 
revision_id INTEGER NOT NULL CHECK (revision_id>= 0), 
language VARCHAR(32) NOT NULL DEFAULT '', 
delta INTEGER NOT NULL CHECK (delta>= 0), 
field_image_fid INTEGER NULL CHECK (field_image_fid>= 0) DEFAULT NULL, 
field_image_alt VARCHAR(128) NULL DEFAULT NULL, 
field_image_title VARCHAR(128) NULL DEFAULT NULL, 
 PRIMARY KEY (entity_type, entity_id, revision_id, deleted, delta, language)
);
CREATE TABLE field_revision_field_tags (
entity_type VARCHAR(128) NOT NULL DEFAULT '', 
bundle VARCHAR(128) NOT NULL DEFAULT '', 
deleted INTEGER NOT NULL DEFAULT 0, 
entity_id INTEGER NOT NULL CHECK (entity_id>= 0), 
revision_id INTEGER NOT NULL CHECK (revision_id>= 0), 
language VARCHAR(32) NOT NULL DEFAULT '', 
delta INTEGER NOT NULL CHECK (delta>= 0), 
field_tags_tid INTEGER NULL CHECK (field_tags_tid>= 0) DEFAULT NULL, 
 PRIMARY KEY (entity_type, entity_id, revision_id, deleted, delta, language)
);
CREATE TABLE file_managed (
fid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (fid>= 0), 
uid INTEGER NOT NULL CHECK (uid>= 0) DEFAULT 0, 
filename VARCHAR(255) NOT NULL DEFAULT '', 
uri VARCHAR(255) NOT NULL DEFAULT '', 
filemime VARCHAR(255) NOT NULL DEFAULT '', 
filesize INTEGER NOT NULL CHECK (filesize>= 0) DEFAULT 0, 
status INTEGER NOT NULL DEFAULT 0, 
timestamp INTEGER NOT NULL CHECK (timestamp>= 0) DEFAULT 0
);
CREATE TABLE file_usage (
fid INTEGER NOT NULL CHECK (fid>= 0), 
module VARCHAR(255) NOT NULL DEFAULT '', 
type VARCHAR(64) NOT NULL DEFAULT '', 
id INTEGER NOT NULL CHECK (id>= 0) DEFAULT 0, 
count INTEGER NOT NULL CHECK (count>= 0) DEFAULT 0, 
 PRIMARY KEY (fid, type, id, module)
);
CREATE TABLE filter (
format VARCHAR(255) NOT NULL, 
module VARCHAR(64) NOT NULL DEFAULT '', 
name VARCHAR(32) NOT NULL DEFAULT '', 
weight INTEGER NOT NULL DEFAULT 0, 
status INTEGER NOT NULL DEFAULT 0, 
settings BLOB NULL DEFAULT NULL, 
 PRIMARY KEY (format, name)
);
CREATE TABLE filter_format (
format VARCHAR(255) NOT NULL, 
name VARCHAR(255) NOT NULL DEFAULT '', 
cache INTEGER NOT NULL DEFAULT 0, 
status INTEGER NOT NULL CHECK (status>= 0) DEFAULT 1, 
weight INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (format)
);
CREATE TABLE flood (
fid INTEGER PRIMARY KEY AUTOINCREMENT, 
event VARCHAR(64) NOT NULL DEFAULT '', 
identifier VARCHAR(128) NOT NULL DEFAULT '', 
timestamp INTEGER NOT NULL DEFAULT 0, 
expiration INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE history (
uid INTEGER NOT NULL DEFAULT 0, 
nid INTEGER NOT NULL DEFAULT 0, 
timestamp INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (uid, nid)
);
CREATE TABLE image_effects (
ieid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (ieid>= 0), 
isid INTEGER NOT NULL CHECK (isid>= 0) DEFAULT 0, 
weight INTEGER NOT NULL DEFAULT 0, 
name VARCHAR(255) NOT NULL, 
data BLOB NOT NULL
);
CREATE TABLE image_styles (
isid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (isid>= 0), 
name VARCHAR(255) NOT NULL
);
CREATE TABLE languages (
language VARCHAR(12) NOT NULL DEFAULT '', 
name VARCHAR(64) NOT NULL DEFAULT '', 
native VARCHAR(64) NOT NULL DEFAULT '', 
direction INTEGER NOT NULL DEFAULT 0, 
enabled INTEGER NOT NULL DEFAULT 0, 
plurals INTEGER NOT NULL DEFAULT 0, 
formula VARCHAR(128) NOT NULL DEFAULT '', 
domain VARCHAR(128) NOT NULL DEFAULT '', 
prefix VARCHAR(128) NOT NULL DEFAULT '', 
weight INTEGER NOT NULL DEFAULT 0, 
javascript VARCHAR(64) NOT NULL DEFAULT '', 
 PRIMARY KEY (language)
);
CREATE TABLE locales_source (
lid INTEGER PRIMARY KEY AUTOINCREMENT, 
location TEXT NULL DEFAULT NULL, 
textgroup VARCHAR(255) NOT NULL DEFAULT 'default', 
source TEXT NOT NULL, 
context VARCHAR(255) NOT NULL DEFAULT '', 
version VARCHAR(20) NOT NULL DEFAULT 'none'
);
CREATE TABLE locales_target (
lid INTEGER NOT NULL DEFAULT 0, 
translation TEXT NOT NULL, 
language VARCHAR(12) NOT NULL DEFAULT '', 
plid INTEGER NOT NULL DEFAULT 0, 
plural INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (language, lid, plural)
);
CREATE TABLE menu_custom (
menu_name VARCHAR(32) NOT NULL DEFAULT '', 
title VARCHAR(255) NOT NULL DEFAULT '', 
description TEXT NULL DEFAULT NULL, 
 PRIMARY KEY (menu_name)
);
CREATE TABLE menu_links (
menu_name VARCHAR(32) NOT NULL DEFAULT '', 
mlid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (mlid>= 0), 
plid INTEGER NOT NULL CHECK (plid>= 0) DEFAULT 0, 
link_path VARCHAR(255) NOT NULL DEFAULT '', 
router_path VARCHAR(255) NOT NULL DEFAULT '', 
link_title VARCHAR(255) NOT NULL DEFAULT '', 
options BLOB NULL DEFAULT NULL, 
module VARCHAR(255) NOT NULL DEFAULT 'system', 
hidden INTEGER NOT NULL DEFAULT 0, 
external INTEGER NOT NULL DEFAULT 0, 
has_children INTEGER NOT NULL DEFAULT 0, 
expanded INTEGER NOT NULL DEFAULT 0, 
weight INTEGER NOT NULL DEFAULT 0, 
depth INTEGER NOT NULL DEFAULT 0, 
customized INTEGER NOT NULL DEFAULT 0, 
p1 INTEGER NOT NULL CHECK (p1>= 0) DEFAULT 0, 
p2 INTEGER NOT NULL CHECK (p2>= 0) DEFAULT 0, 
p3 INTEGER NOT NULL CHECK (p3>= 0) DEFAULT 0, 
p4 INTEGER NOT NULL CHECK (p4>= 0) DEFAULT 0, 
p5 INTEGER NOT NULL CHECK (p5>= 0) DEFAULT 0, 
p6 INTEGER NOT NULL CHECK (p6>= 0) DEFAULT 0, 
p7 INTEGER NOT NULL CHECK (p7>= 0) DEFAULT 0, 
p8 INTEGER NOT NULL CHECK (p8>= 0) DEFAULT 0, 
p9 INTEGER NOT NULL CHECK (p9>= 0) DEFAULT 0, 
updated INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE menu_router (
path VARCHAR(255) NOT NULL DEFAULT '', 
load_functions BLOB NOT NULL, 
to_arg_functions BLOB NOT NULL, 
access_callback VARCHAR(255) NOT NULL DEFAULT '', 
access_arguments BLOB NULL DEFAULT NULL, 
page_callback VARCHAR(255) NOT NULL DEFAULT '', 
page_arguments BLOB NULL DEFAULT NULL, 
delivery_callback VARCHAR(255) NOT NULL DEFAULT '', 
fit INTEGER NOT NULL DEFAULT 0, 
number_parts INTEGER NOT NULL DEFAULT 0, 
context INTEGER NOT NULL DEFAULT 0, 
tab_parent VARCHAR(255) NOT NULL DEFAULT '', 
tab_root VARCHAR(255) NOT NULL DEFAULT '', 
title VARCHAR(255) NOT NULL DEFAULT '', 
title_callback VARCHAR(255) NOT NULL DEFAULT '', 
title_arguments VARCHAR(255) NOT NULL DEFAULT '', 
theme_callback VARCHAR(255) NOT NULL DEFAULT '', 
theme_arguments VARCHAR(255) NOT NULL DEFAULT '', 
type INTEGER NOT NULL DEFAULT 0, 
description TEXT NOT NULL, 
position VARCHAR(255) NOT NULL DEFAULT '', 
weight INTEGER NOT NULL DEFAULT 0, 
include_file TEXT DEFAULT NULL, 
 PRIMARY KEY (path)
);
CREATE TABLE node (
nid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (nid>= 0), 
vid INTEGER NOT NULL CHECK (vid>= 0) DEFAULT 0, 
type VARCHAR(32) NOT NULL DEFAULT '', 
language VARCHAR(12) NOT NULL DEFAULT '', 
title VARCHAR(255) NOT NULL DEFAULT '', 
uid INTEGER NOT NULL DEFAULT 0, 
status INTEGER NOT NULL DEFAULT 1, 
created INTEGER NOT NULL DEFAULT 0, 
changed INTEGER NOT NULL DEFAULT 0, 
comment INTEGER NOT NULL DEFAULT 0, 
promote INTEGER NOT NULL DEFAULT 0, 
sticky INTEGER NOT NULL DEFAULT 0, 
tnid INTEGER NOT NULL CHECK (tnid>= 0) DEFAULT 0, 
translate INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE node_access (
nid INTEGER NOT NULL CHECK (nid>= 0) DEFAULT 0, 
gid INTEGER NOT NULL CHECK (gid>= 0) DEFAULT 0, 
realm VARCHAR(255) NOT NULL DEFAULT '', 
grant_view INTEGER NOT NULL CHECK (grant_view>= 0) DEFAULT 0, 
grant_update INTEGER NOT NULL CHECK (grant_update>= 0) DEFAULT 0, 
grant_delete INTEGER NOT NULL CHECK (grant_delete>= 0) DEFAULT 0, 
 PRIMARY KEY (nid, gid, realm)
);
CREATE TABLE node_comment_statistics (
nid INTEGER NOT NULL CHECK (nid>= 0) DEFAULT 0, 
cid INTEGER NOT NULL DEFAULT 0, 
last_comment_timestamp INTEGER NOT NULL DEFAULT 0, 
last_comment_name VARCHAR(60) NULL DEFAULT NULL, 
last_comment_uid INTEGER NOT NULL DEFAULT 0, 
comment_count INTEGER NOT NULL CHECK (comment_count>= 0) DEFAULT 0, 
 PRIMARY KEY (nid)
);
CREATE TABLE node_revision (
nid INTEGER NOT NULL CHECK (nid>= 0) DEFAULT 0, 
vid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (vid>= 0), 
uid INTEGER NOT NULL DEFAULT 0, 
title VARCHAR(255) NOT NULL DEFAULT '', 
log TEXT NOT NULL, 
timestamp INTEGER NOT NULL DEFAULT 0, 
status INTEGER NOT NULL DEFAULT 1, 
comment INTEGER NOT NULL DEFAULT 0, 
promote INTEGER NOT NULL DEFAULT 0, 
sticky INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE node_type (
type VARCHAR(32) NOT NULL, 
name VARCHAR(255) NOT NULL DEFAULT '', 
base VARCHAR(255) NOT NULL, 
module VARCHAR(255) NOT NULL, 
description TEXT NOT NULL, 
help TEXT NOT NULL, 
has_title INTEGER NOT NULL CHECK (has_title>= 0), 
title_label VARCHAR(255) NOT NULL DEFAULT '', 
custom INTEGER NOT NULL DEFAULT 0, 
modified INTEGER NOT NULL DEFAULT 0, 
locked INTEGER NOT NULL DEFAULT 0, 
disabled INTEGER NOT NULL DEFAULT 0, 
orig_type VARCHAR(255) NOT NULL DEFAULT '', 
 PRIMARY KEY (type)
);
CREATE TABLE queue (
item_id INTEGER PRIMARY KEY AUTOINCREMENT CHECK (item_id>= 0), 
name VARCHAR(255) NOT NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
expire INTEGER NOT NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE rdf_mapping (
type VARCHAR(128) NOT NULL, 
bundle VARCHAR(128) NOT NULL, 
mapping BLOB NULL DEFAULT NULL, 
 PRIMARY KEY (type, bundle)
);
CREATE TABLE registry (
name VARCHAR(255) NOT NULL DEFAULT '', 
type VARCHAR(9) NOT NULL DEFAULT '', 
filename VARCHAR(255) NOT NULL, 
module VARCHAR(255) NOT NULL DEFAULT '', 
weight INTEGER NOT NULL DEFAULT 0, 
 PRIMARY KEY (name, type)
);
CREATE TABLE registry_file (
filename VARCHAR(255) NOT NULL, 
hash VARCHAR(64) NOT NULL, 
 PRIMARY KEY (filename)
);
CREATE TABLE role (
rid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (rid>= 0), 
name VARCHAR(64) NOT NULL DEFAULT '', 
weight INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE role_permission (
rid INTEGER NOT NULL CHECK (rid>= 0), 
permission VARCHAR(128) NOT NULL DEFAULT '', 
module VARCHAR(255) NOT NULL DEFAULT '', 
 PRIMARY KEY (rid, permission)
);
CREATE TABLE search_dataset (
sid INTEGER NOT NULL CHECK (sid>= 0) DEFAULT 0, 
type VARCHAR(16) NOT NULL, 
data TEXT NOT NULL, 
reindex INTEGER NOT NULL CHECK (reindex>= 0) DEFAULT 0, 
 PRIMARY KEY (sid, type)
);
CREATE TABLE search_index (
word VARCHAR(50) NOT NULL DEFAULT '', 
sid INTEGER NOT NULL CHECK (sid>= 0) DEFAULT 0, 
type VARCHAR(16) NOT NULL, 
score FLOAT NULL DEFAULT NULL, 
 PRIMARY KEY (word, sid, type)
);
CREATE TABLE search_node_links (
sid INTEGER NOT NULL CHECK (sid>= 0) DEFAULT 0, 
type VARCHAR(16) NOT NULL DEFAULT '', 
nid INTEGER NOT NULL CHECK (nid>= 0) DEFAULT 0, 
caption TEXT NULL DEFAULT NULL, 
 PRIMARY KEY (sid, type, nid)
);
CREATE TABLE search_total (
word VARCHAR(50) NOT NULL DEFAULT '', 
count FLOAT NULL DEFAULT NULL, 
 PRIMARY KEY (word)
);
CREATE TABLE semaphore (
name VARCHAR(255) NOT NULL DEFAULT '', 
value VARCHAR(255) NOT NULL DEFAULT '', 
expire FLOAT NOT NULL, 
 PRIMARY KEY (name)
);
CREATE TABLE sequences (
value INTEGER PRIMARY KEY AUTOINCREMENT CHECK (value>= 0)
);
CREATE TABLE sessions (
uid INTEGER NOT NULL CHECK (uid>= 0), 
sid VARCHAR(128) NOT NULL, 
ssid VARCHAR(128) NOT NULL DEFAULT '', 
hostname VARCHAR(128) NOT NULL DEFAULT '', 
timestamp INTEGER NOT NULL DEFAULT 0, 
cache INTEGER NOT NULL DEFAULT 0, 
session BLOB NULL DEFAULT NULL, 
 PRIMARY KEY (sid, ssid)
);
CREATE TABLE shortcut_set (
set_name VARCHAR(32) NOT NULL DEFAULT '', 
title VARCHAR(255) NOT NULL DEFAULT '', 
 PRIMARY KEY (set_name)
);
CREATE TABLE shortcut_set_users (
uid INTEGER NOT NULL CHECK (uid>= 0) DEFAULT 0, 
set_name VARCHAR(32) NOT NULL DEFAULT '', 
 PRIMARY KEY (uid)
);
CREATE TABLE system (
filename VARCHAR(255) NOT NULL DEFAULT '', 
name VARCHAR(255) NOT NULL DEFAULT '', 
type VARCHAR(12) NOT NULL DEFAULT '', 
owner VARCHAR(255) NOT NULL DEFAULT '', 
status INTEGER NOT NULL DEFAULT 0, 
bootstrap INTEGER NOT NULL DEFAULT 0, 
schema_version INTEGER NOT NULL DEFAULT -1, 
weight INTEGER NOT NULL DEFAULT 0, 
info BLOB NULL DEFAULT NULL, 
 PRIMARY KEY (filename)
);
CREATE TABLE taxonomy_index (
nid INTEGER NOT NULL CHECK (nid>= 0) DEFAULT 0, 
tid INTEGER NOT NULL CHECK (tid>= 0) DEFAULT 0, 
sticky INTEGER NULL DEFAULT 0, 
created INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE taxonomy_term_data (
tid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (tid>= 0), 
vid INTEGER NOT NULL CHECK (vid>= 0) DEFAULT 0, 
name VARCHAR(255) NOT NULL DEFAULT '', 
description TEXT NULL DEFAULT NULL, 
format VARCHAR(255) NULL DEFAULT NULL, 
weight INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE taxonomy_term_hierarchy (
tid INTEGER NOT NULL CHECK (tid>= 0) DEFAULT 0, 
parent INTEGER NOT NULL CHECK (parent>= 0) DEFAULT 0, 
 PRIMARY KEY (tid, parent)
);
CREATE TABLE taxonomy_vocabulary (
vid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (vid>= 0), 
name VARCHAR(255) NOT NULL DEFAULT '', 
machine_name VARCHAR(255) NOT NULL DEFAULT '', 
description TEXT NULL DEFAULT NULL, 
hierarchy INTEGER NOT NULL CHECK (hierarchy>= 0) DEFAULT 0, 
module VARCHAR(255) NOT NULL DEFAULT '', 
weight INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE url_alias (
pid INTEGER PRIMARY KEY AUTOINCREMENT CHECK (pid>= 0), 
source VARCHAR(255) NOT NULL DEFAULT '', 
alias VARCHAR(255) NOT NULL DEFAULT '', 
language VARCHAR(12) NOT NULL DEFAULT ''
);
CREATE TABLE users (
uid INTEGER NOT NULL CHECK (uid>= 0) DEFAULT 0, 
name VARCHAR(60) NOT NULL DEFAULT '', 
pass VARCHAR(128) NOT NULL DEFAULT '', 
mail VARCHAR(254) NULL DEFAULT '', 
theme VARCHAR(255) NOT NULL DEFAULT '', 
signature VARCHAR(255) NOT NULL DEFAULT '', 
signature_format VARCHAR(255) NULL DEFAULT NULL, 
created INTEGER NOT NULL DEFAULT 0, 
access INTEGER NOT NULL DEFAULT 0, 
login INTEGER NOT NULL DEFAULT 0, 
status INTEGER NOT NULL DEFAULT 0, 
timezone VARCHAR(32) NULL DEFAULT NULL, 
language VARCHAR(12) NOT NULL DEFAULT '', 
picture INTEGER NOT NULL DEFAULT 0, 
init VARCHAR(254) NULL DEFAULT '', 
data BLOB NULL DEFAULT NULL, 
 PRIMARY KEY (uid)
);
CREATE TABLE users_roles (
uid INTEGER NOT NULL CHECK (uid>= 0) DEFAULT 0, 
rid INTEGER NOT NULL CHECK (rid>= 0) DEFAULT 0, 
 PRIMARY KEY (uid, rid)
);
CREATE TABLE variable (
name VARCHAR(128) NOT NULL DEFAULT '', 
value BLOB NOT NULL, 
 PRIMARY KEY (name)
);
CREATE TABLE watchdog (
wid INTEGER PRIMARY KEY AUTOINCREMENT, 
uid INTEGER NOT NULL DEFAULT 0, 
type VARCHAR(64) NOT NULL DEFAULT '', 
message TEXT NOT NULL, 
variables BLOB NOT NULL, 
severity INTEGER NOT NULL CHECK (severity>= 0) DEFAULT 0, 
link VARCHAR(255) NULL DEFAULT '', 
location TEXT NOT NULL, 
referer TEXT NULL DEFAULT NULL, 
hostname VARCHAR(128) NOT NULL DEFAULT '', 
timestamp INTEGER NOT NULL DEFAULT 0
);
CREATE UNIQUE INDEX authmap_authname ON authmap (authname);
CREATE INDEX batch_token ON batch (token);
CREATE UNIQUE INDEX block_custom_info ON block_custom (info);
CREATE INDEX block_list ON block (theme, status, region, weight, module);
CREATE INDEX block_node_type_type ON block_node_type (type);
CREATE INDEX block_role_rid ON block_role (rid);
CREATE UNIQUE INDEX block_tmd ON block (theme, module, delta);
CREATE INDEX blocked_ips_blocked_ip ON blocked_ips (ip);
CREATE INDEX cache_block_expire ON cache_block (expire);
CREATE INDEX cache_bootstrap_expire ON cache_bootstrap (expire);
CREATE INDEX cache_expire ON cache (expire);
CREATE INDEX cache_field_expire ON cache_field (expire);
CREATE INDEX cache_filter_expire ON cache_filter (expire);
CREATE INDEX cache_form_expire ON cache_form (expire);
CREATE INDEX cache_image_expire ON cache_image (expire);
CREATE INDEX cache_menu_expire ON cache_menu (expire);
CREATE INDEX cache_page_expire ON cache_page (expire);
CREATE INDEX cache_path_expire ON cache_path (expire);
CREATE INDEX cache_update_expire ON cache_update (expire);
CREATE INDEX comment_comment_created ON comment (created);
CREATE INDEX comment_comment_nid_language ON comment (nid, language);
CREATE INDEX comment_comment_num_new ON comment (nid, status, created, cid, thread);
CREATE INDEX comment_comment_status_pid ON comment (pid, status);
CREATE INDEX comment_comment_uid ON comment (uid);
CREATE INDEX date_format_type_title ON date_format_type (title);
CREATE UNIQUE INDEX date_formats_formats ON date_formats (format, type);
CREATE INDEX field_config_active ON field_config (active);
CREATE INDEX field_config_deleted ON field_config (deleted);
CREATE INDEX field_config_field_name ON field_config (field_name);
CREATE INDEX field_config_instance_deleted ON field_config_instance (deleted);
CREATE INDEX field_config_instance_field_name_bundle ON field_config_instance (field_name, entity_type, bundle);
CREATE INDEX field_config_module ON field_config (module);
CREATE INDEX field_config_storage_active ON field_config (storage_active);
CREATE INDEX field_config_storage_module ON field_config (storage_module);
CREATE INDEX field_config_storage_type ON field_config (storage_type);
CREATE INDEX field_config_type ON field_config (type);
CREATE INDEX field_data_body_body_format ON field_data_body (body_format);
CREATE INDEX field_data_body_bundle ON field_data_body (bundle);
CREATE INDEX field_data_body_deleted ON field_data_body (deleted);
CREATE INDEX field_data_body_entity_id ON field_data_body (entity_id);
CREATE INDEX field_data_body_entity_type ON field_data_body (entity_type);
CREATE INDEX field_data_body_language ON field_data_body (language);
CREATE INDEX field_data_body_revision_id ON field_data_body (revision_id);
CREATE INDEX field_data_comment_body_bundle ON field_data_comment_body (bundle);
CREATE INDEX field_data_comment_body_comment_body_format ON field_data_comment_body (comment_body_format);
CREATE INDEX field_data_comment_body_deleted ON field_data_comment_body (deleted);
CREATE INDEX field_data_comment_body_entity_id ON field_data_comment_body (entity_id);
CREATE INDEX field_data_comment_body_entity_type ON field_data_comment_body (entity_type);
CREATE INDEX field_data_comment_body_language ON field_data_comment_body (language);
CREATE INDEX field_data_comment_body_revision_id ON field_data_comment_body (revision_id);
CREATE INDEX field_data_field_image_bundle ON field_data_field_image (bundle);
CREATE INDEX field_data_field_image_deleted ON field_data_field_image (deleted);
CREATE INDEX field_data_field_image_entity_id ON field_data_field_image (entity_id);
CREATE INDEX field_data_field_image_entity_type ON field_data_field_image (entity_type);
CREATE INDEX field_data_field_image_field_image_fid ON field_data_field_image (field_image_fid);
CREATE INDEX field_data_field_image_language ON field_data_field_image (language);
CREATE INDEX field_data_field_image_revision_id ON field_data_field_image (revision_id);
CREATE INDEX field_data_field_tags_bundle ON field_data_field_tags (bundle);
CREATE INDEX field_data_field_tags_deleted ON field_data_field_tags (deleted);
CREATE INDEX field_data_field_tags_entity_id ON field_data_field_tags (entity_id);
CREATE INDEX field_data_field_tags_entity_type ON field_data_field_tags (entity_type);
CREATE INDEX field_data_field_tags_field_tags_tid ON field_data_field_tags (field_tags_tid);
CREATE INDEX field_data_field_tags_language ON field_data_field_tags (language);
CREATE INDEX field_data_field_tags_revision_id ON field_data_field_tags (revision_id);
CREATE INDEX field_revision_body_body_format ON field_revision_body (body_format);
CREATE INDEX field_revision_body_bundle ON field_revision_body (bundle);
CREATE INDEX field_revision_body_deleted ON field_revision_body (deleted);
CREATE INDEX field_revision_body_entity_id ON field_revision_body (entity_id);
CREATE INDEX field_revision_body_entity_type ON field_revision_body (entity_type);
CREATE INDEX field_revision_body_language ON field_revision_body (language);
CREATE INDEX field_revision_body_revision_id ON field_revision_body (revision_id);
CREATE INDEX field_revision_comment_body_bundle ON field_revision_comment_body (bundle);
CREATE INDEX field_revision_comment_body_comment_body_format ON field_revision_comment_body (comment_body_format);
CREATE INDEX field_revision_comment_body_deleted ON field_revision_comment_body (deleted);
CREATE INDEX field_revision_comment_body_entity_id ON field_revision_comment_body (entity_id);
CREATE INDEX field_revision_comment_body_entity_type ON field_revision_comment_body (entity_type);
CREATE INDEX field_revision_comment_body_language ON field_revision_comment_body (language);
CREATE INDEX field_revision_comment_body_revision_id ON field_revision_comment_body (revision_id);
CREATE INDEX field_revision_field_image_bundle ON field_revision_field_image (bundle);
CREATE INDEX field_revision_field_image_deleted ON field_revision_field_image (deleted);
CREATE INDEX field_revision_field_image_entity_id ON field_revision_field_image (entity_id);
CREATE INDEX field_revision_field_image_entity_type ON field_revision_field_image (entity_type);
CREATE INDEX field_revision_field_image_field_image_fid ON field_revision_field_image (field_image_fid);
CREATE INDEX field_revision_field_image_language ON field_revision_field_image (language);
CREATE INDEX field_revision_field_image_revision_id ON field_revision_field_image (revision_id);
CREATE INDEX field_revision_field_tags_bundle ON field_revision_field_tags (bundle);
CREATE INDEX field_revision_field_tags_deleted ON field_revision_field_tags (deleted);
CREATE INDEX field_revision_field_tags_entity_id ON field_revision_field_tags (entity_id);
CREATE INDEX field_revision_field_tags_entity_type ON field_revision_field_tags (entity_type);
CREATE INDEX field_revision_field_tags_field_tags_tid ON field_revision_field_tags (field_tags_tid);
CREATE INDEX field_revision_field_tags_language ON field_revision_field_tags (language);
CREATE INDEX field_revision_field_tags_revision_id ON field_revision_field_tags (revision_id);
CREATE INDEX file_managed_status ON file_managed (status);
CREATE INDEX file_managed_timestamp ON file_managed (timestamp);
CREATE INDEX file_managed_uid ON file_managed (uid);
CREATE UNIQUE INDEX file_managed_uri ON file_managed (uri);
CREATE INDEX file_usage_fid_count ON file_usage (fid, count);
CREATE INDEX file_usage_fid_module ON file_usage (fid, module);
CREATE INDEX file_usage_type_id ON file_usage (type, id);
CREATE UNIQUE INDEX filter_format_name ON filter_format (name);
CREATE INDEX filter_format_status_weight ON filter_format (status, weight);
CREATE INDEX filter_list ON filter (weight, module, name);
CREATE INDEX flood_allow ON flood (event, identifier, timestamp);
CREATE INDEX flood_purge ON flood (expiration);
CREATE INDEX history_nid ON history (nid);
CREATE INDEX image_effects_isid ON image_effects (isid);
CREATE INDEX image_effects_weight ON image_effects (weight);
CREATE UNIQUE INDEX image_styles_name ON image_styles (name);
CREATE INDEX languages_list ON languages (weight, name);
CREATE INDEX locales_source_source_context ON locales_source (source, context);
CREATE INDEX locales_target_lid ON locales_target (lid);
CREATE INDEX locales_target_plid ON locales_target (plid);
CREATE INDEX locales_target_plural ON locales_target (plural);
CREATE INDEX menu_links_menu_parents ON menu_links (menu_name, p1, p2, p3, p4, p5, p6, p7, p8, p9);
CREATE INDEX menu_links_menu_plid_expand_child ON menu_links (menu_name, plid, expanded, has_children);
CREATE INDEX menu_links_path_menu ON menu_links (link_path, menu_name);
CREATE INDEX menu_links_router_path ON menu_links (router_path);
CREATE INDEX menu_router_fit ON menu_router (fit);
CREATE INDEX menu_router_tab_parent ON menu_router (tab_parent, weight, title);
CREATE INDEX menu_router_tab_root_weight_title ON menu_router (tab_root, weight, title);
CREATE INDEX node_comment_statistics_comment_count ON node_comment_statistics (comment_count);
CREATE INDEX node_comment_statistics_last_comment_uid ON node_comment_statistics (last_comment_uid);
CREATE INDEX node_comment_statistics_node_comment_timestamp ON node_comment_statistics (last_comment_timestamp);
CREATE INDEX node_node_changed ON node (changed);
CREATE INDEX node_node_created ON node (created);
CREATE INDEX node_node_frontpage ON node (promote, status, sticky, created);
CREATE INDEX node_node_status_type ON node (status, type, nid);
CREATE INDEX node_node_title_type ON node (title, type);
CREATE INDEX node_node_type ON node (type);
CREATE INDEX node_revision_nid ON node_revision (nid);
CREATE INDEX node_revision_uid ON node_revision (uid);
CREATE INDEX node_tnid ON node (tnid);
CREATE INDEX node_translate ON node (translate);
CREATE INDEX node_uid ON node (uid);
CREATE UNIQUE INDEX node_vid ON node (vid);
CREATE INDEX queue_expire ON queue (expire);
CREATE INDEX queue_name_created ON queue (name, created);
CREATE INDEX registry_hook ON registry (type, weight, module);
CREATE UNIQUE INDEX role_name ON role (name);
CREATE INDEX role_name_weight ON role (name, weight);
CREATE INDEX role_permission_permission ON role_permission (permission);
CREATE INDEX search_index_sid_type ON search_index (sid, type);
CREATE INDEX search_node_links_nid ON search_node_links (nid);
CREATE INDEX semaphore_expire ON semaphore (expire);
CREATE INDEX semaphore_value ON semaphore (value);
CREATE INDEX sessions_ssid ON sessions (ssid);
CREATE INDEX sessions_timestamp ON sessions (timestamp);
CREATE INDEX sessions_uid ON sessions (uid);
CREATE INDEX shortcut_set_users_set_name ON shortcut_set_users (set_name);
CREATE INDEX system_system_list ON system (status, bootstrap, type, weight, name);
CREATE INDEX system_type_name ON system (type, name);
CREATE INDEX taxonomy_index_nid ON taxonomy_index (nid);
CREATE INDEX taxonomy_index_term_node ON taxonomy_index (tid, sticky, created);
CREATE INDEX taxonomy_term_data_name ON taxonomy_term_data (name);
CREATE INDEX taxonomy_term_data_taxonomy_tree ON taxonomy_term_data (vid, weight, name);
CREATE INDEX taxonomy_term_data_vid_name ON taxonomy_term_data (vid, name);
CREATE INDEX taxonomy_term_hierarchy_parent ON taxonomy_term_hierarchy (parent);
CREATE INDEX taxonomy_vocabulary_list ON taxonomy_vocabulary (weight, name);
CREATE UNIQUE INDEX taxonomy_vocabulary_machine_name ON taxonomy_vocabulary (machine_name);
CREATE INDEX url_alias_alias_language_pid ON url_alias (alias, language, pid);
CREATE INDEX url_alias_source_language_pid ON url_alias (source, language, pid);
CREATE INDEX users_access ON users (access);
CREATE INDEX users_created ON users (created);
CREATE INDEX users_mail ON users (mail);
CREATE UNIQUE INDEX users_name ON users (name);
CREATE INDEX users_roles_rid ON users_roles (rid);
CREATE INDEX watchdog_type ON watchdog (type);
CREATE INDEX watchdog_uid ON watchdog (uid);
