/*
 * Copyright 1999-2018 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************/
/*   表名称 = config_info                  */
/******************************************/
CREATE TABLE config_info (
                             id BIGSERIAL NOT NULL PRIMARY KEY,
                             data_id VARCHAR(255) NOT NULL,
                             group_id VARCHAR(128) DEFAULT NULL,
                             content TEXT NOT NULL,
                             md5 VARCHAR(32) DEFAULT NULL,
                             gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             src_user TEXT,
                             src_ip VARCHAR(100) DEFAULT NULL,
                             app_name VARCHAR(128) DEFAULT NULL,
                             tenant_id VARCHAR(128) DEFAULT ''::VARCHAR,
                             c_desc VARCHAR(256) DEFAULT NULL,
                             c_use VARCHAR(200) DEFAULT NULL,
                             effect VARCHAR(200) DEFAULT NULL,
                             type VARCHAR(200) DEFAULT NULL,
                             c_schema TEXT,
                             encrypted_data_key VARCHAR(1024) NOT NULL DEFAULT ''::VARCHAR
);

COMMENT ON TABLE config_info IS 'config_info';
COMMENT ON COLUMN config_info.id IS 'id';
COMMENT ON COLUMN config_info.data_id IS 'data_id';
COMMENT ON COLUMN config_info.group_id IS 'group_id';
COMMENT ON COLUMN config_info.content IS 'content';
COMMENT ON COLUMN config_info.md5 IS 'md5';
COMMENT ON COLUMN config_info.gmt_create IS '创建时间';
COMMENT ON COLUMN config_info.gmt_modified IS '修改时间';
COMMENT ON COLUMN config_info.src_user IS 'source user';
COMMENT ON COLUMN config_info.src_ip IS 'source ip';
COMMENT ON COLUMN config_info.app_name IS 'app_name';
COMMENT ON COLUMN config_info.tenant_id IS '租户字段';
COMMENT ON COLUMN config_info.c_desc IS 'configuration description';
COMMENT ON COLUMN config_info.c_use IS 'configuration usage';
COMMENT ON COLUMN config_info.effect IS '配置生效的描述';
COMMENT ON COLUMN config_info.type IS '配置的类型';
COMMENT ON COLUMN config_info.c_schema IS '配置的模式';
COMMENT ON COLUMN config_info.encrypted_data_key IS '密钥';

CREATE UNIQUE INDEX uk_configinfo_datagrouptenant ON config_info (data_id, group_id, tenant_id);


/******************************************/
/*   表名称 = config_info_aggr             */
/******************************************/
CREATE TABLE config_info_aggr (
                                  id BIGSERIAL NOT NULL PRIMARY KEY,
                                  data_id VARCHAR(255) NOT NULL,
                                  group_id VARCHAR(128) NOT NULL,
                                  datum_id VARCHAR(255) NOT NULL,
                                  content TEXT NOT NULL,
                                  gmt_modified TIMESTAMP NOT NULL,
                                  app_name VARCHAR(128) DEFAULT NULL,
                                  tenant_id VARCHAR(128) DEFAULT ''::VARCHAR
);

COMMENT ON TABLE config_info_aggr IS '增加租户字段';
COMMENT ON COLUMN config_info_aggr.id IS 'id';
COMMENT ON COLUMN config_info_aggr.data_id IS 'data_id';
COMMENT ON COLUMN config_info_aggr.group_id IS 'group_id';
COMMENT ON COLUMN config_info_aggr.datum_id IS 'datum_id';
COMMENT ON COLUMN config_info_aggr.content IS '内容';
COMMENT ON COLUMN config_info_aggr.gmt_modified IS '修改时间';
COMMENT ON COLUMN config_info_aggr.app_name IS 'app_name';
COMMENT ON COLUMN config_info_aggr.tenant_id IS '租户字段';

CREATE UNIQUE INDEX uk_configinfoaggr_datagrouptenantdatum ON config_info_aggr (data_id, group_id, tenant_id, datum_id);


/******************************************/
/*   表名称 = config_info_beta             */
/******************************************/
CREATE TABLE config_info_beta (
                                  id BIGSERIAL NOT NULL PRIMARY KEY,
                                  data_id VARCHAR(255) NOT NULL,
                                  group_id VARCHAR(128) NOT NULL,
                                  app_name VARCHAR(128) DEFAULT NULL,
                                  content TEXT NOT NULL,
                                  beta_ips VARCHAR(1024) DEFAULT NULL,
                                  md5 VARCHAR(32) DEFAULT NULL,
                                  gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  src_user TEXT,
                                  src_ip VARCHAR(100) DEFAULT NULL,
                                  tenant_id VARCHAR(128) DEFAULT ''::VARCHAR,
                                  encrypted_data_key VARCHAR(1024) NOT NULL DEFAULT ''::VARCHAR
);

COMMENT ON TABLE config_info_beta IS 'config_info_beta';
COMMENT ON COLUMN config_info_beta.id IS 'id';
COMMENT ON COLUMN config_info_beta.data_id IS 'data_id';
COMMENT ON COLUMN config_info_beta.group_id IS 'group_id';
COMMENT ON COLUMN config_info_beta.app_name IS 'app_name';
COMMENT ON COLUMN config_info_beta.content IS 'content';
COMMENT ON COLUMN config_info_beta.beta_ips IS 'betaIps';
COMMENT ON COLUMN config_info_beta.md5 IS 'md5';
COMMENT ON COLUMN config_info_beta.gmt_create IS '创建时间';
COMMENT ON COLUMN config_info_beta.gmt_modified IS '修改时间';
COMMENT ON COLUMN config_info_beta.src_user IS 'source user';
COMMENT ON COLUMN config_info_beta.src_ip IS 'source ip';
COMMENT ON COLUMN config_info_beta.tenant_id IS '租户字段';
COMMENT ON COLUMN config_info_beta.encrypted_data_key IS '密钥';

CREATE UNIQUE INDEX uk_configinfobeta_datagrouptenant ON config_info_beta (data_id, group_id, tenant_id);


/******************************************/
/*   表名称 = config_info_tag              */
/******************************************/
CREATE TABLE config_info_tag (
                                 id BIGSERIAL NOT NULL PRIMARY KEY,
                                 data_id VARCHAR(255) NOT NULL,
                                 group_id VARCHAR(128) NOT NULL,
                                 tenant_id VARCHAR(128) DEFAULT ''::VARCHAR,
                                 tag_id VARCHAR(128) NOT NULL,
                                 app_name VARCHAR(200) DEFAULT NULL,
                                 content TEXT NOT NULL,
                                 md5 VARCHAR(32) DEFAULT NULL,
                                 gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 src_user TEXT,
                                 src_ip VARCHAR(100) DEFAULT NULL
);

COMMENT ON TABLE config_info_tag IS 'config_info_tag';
COMMENT ON COLUMN config_info_tag.id IS 'id';
COMMENT ON COLUMN config_info_tag.data_id IS 'data_id';
COMMENT ON COLUMN config_info_tag.group_id IS 'group_id';
COMMENT ON COLUMN config_info_tag.tenant_id IS 'tenant_id';
COMMENT ON COLUMN config_info_tag.tag_id IS 'tag_id';
COMMENT ON COLUMN config_info_tag.app_name IS 'app_name';
COMMENT ON COLUMN config_info_tag.content IS 'content';
COMMENT ON COLUMN config_info_tag.md5 IS 'md5';
COMMENT ON COLUMN config_info_tag.gmt_create IS '创建时间';
COMMENT ON COLUMN config_info_tag.gmt_modified IS '修改时间';
COMMENT ON COLUMN config_info_tag.src_user IS 'source user';
COMMENT ON COLUMN config_info_tag.src_ip IS 'source ip';

CREATE UNIQUE INDEX uk_configinfotag_datagrouptenanttag ON config_info_tag (data_id, group_id, tenant_id, tag_id);


/******************************************/
/*   表名称 = config_tags_relation         */
/******************************************/
CREATE TABLE config_tags_relation (
                                      id INT8 NOT NULL,
                                      nid BIGSERIAL NOT NULL PRIMARY KEY,
                                      tag_name VARCHAR(128) NOT NULL,
                                      tag_type VARCHAR(64) DEFAULT NULL,
                                      data_id VARCHAR(255) NOT NULL,
                                      group_id VARCHAR(128) NOT NULL,
                                      tenant_id VARCHAR(128) DEFAULT ''::VARCHAR
);

COMMENT ON TABLE config_tags_relation IS 'config_tag_relation';
COMMENT ON COLUMN config_tags_relation.id IS 'id';
COMMENT ON COLUMN config_tags_relation.tag_name IS 'tag_name';
COMMENT ON COLUMN config_tags_relation.tag_type IS 'tag_type';
COMMENT ON COLUMN config_tags_relation.data_id IS 'data_id';
COMMENT ON COLUMN config_tags_relation.group_id IS 'group_id';
COMMENT ON COLUMN config_tags_relation.tenant_id IS 'tenant_id';
COMMENT ON COLUMN config_tags_relation.nid IS 'nid, 自增长标识';

CREATE UNIQUE INDEX uk_configtagrelation_configidtag ON config_tags_relation (id, tag_name, tag_type);
CREATE INDEX idx_tenant_id ON config_tags_relation (tenant_id);


/******************************************/
/*   表名称 = group_capacity               */
/******************************************/
CREATE TABLE group_capacity (
                                id BIGSERIAL NOT NULL PRIMARY KEY,
                                group_id VARCHAR(128) NOT NULL DEFAULT ''::VARCHAR,
                                quota INT4 NOT NULL DEFAULT 0,
                                usage INT4 NOT NULL DEFAULT 0,
                                max_size INT4 NOT NULL DEFAULT 0,
                                max_aggr_count INT4 NOT NULL DEFAULT 0,
                                max_aggr_size INT4 NOT NULL DEFAULT 0,
                                max_history_count INT4 NOT NULL DEFAULT 0,
                                gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE group_capacity IS '集群、各Group容量信息表';
COMMENT ON COLUMN group_capacity.id IS '主键ID';
COMMENT ON COLUMN group_capacity.group_id IS 'Group ID，空字符表示整个集群';
COMMENT ON COLUMN group_capacity.quota IS '配额，0表示使用默认值';
COMMENT ON COLUMN group_capacity.usage IS '使用量';
COMMENT ON COLUMN group_capacity.max_size IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN group_capacity.max_aggr_count IS '聚合子配置最大个数，，0表示使用默认值';
COMMENT ON COLUMN group_capacity.max_aggr_size IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN group_capacity.max_history_count IS '最大变更历史数量';
COMMENT ON COLUMN group_capacity.gmt_create IS '创建时间';
COMMENT ON COLUMN group_capacity.gmt_modified IS '修改时间';

CREATE UNIQUE INDEX uk_group_id ON group_capacity (group_id);


/******************************************/
/*   表名称 = his_config_info              */
/******************************************/
CREATE TABLE his_config_info (
                                 id INT8 NOT NULL,
                                 nid BIGSERIAL NOT NULL PRIMARY KEY,
                                 data_id VARCHAR(255) NOT NULL,
                                 group_id VARCHAR(128) NOT NULL,
                                 app_name VARCHAR(128) DEFAULT NULL,
                                 content TEXT NOT NULL,
                                 md5 VARCHAR(32) DEFAULT NULL,
                                 gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 src_user TEXT,
                                 src_ip VARCHAR(50) DEFAULT NULL,
                                 op_type CHAR(10) DEFAULT NULL,
                                 tenant_id VARCHAR(128) DEFAULT ''::VARCHAR,
                                 encrypted_data_key VARCHAR(1024) NOT NULL DEFAULT ''::VARCHAR
);

COMMENT ON TABLE his_config_info IS '多租户改造';
COMMENT ON COLUMN his_config_info.id IS 'id';
COMMENT ON COLUMN his_config_info.nid IS 'nid, 自增标识';
COMMENT ON COLUMN his_config_info.data_id IS 'data_id';
COMMENT ON COLUMN his_config_info.group_id IS 'group_id';
COMMENT ON COLUMN his_config_info.app_name IS 'app_name';
COMMENT ON COLUMN his_config_info.content IS 'content';
COMMENT ON COLUMN his_config_info.md5 IS 'md5';
COMMENT ON COLUMN his_config_info.gmt_create IS '创建时间';
COMMENT ON COLUMN his_config_info.gmt_modified IS '修改时间';
COMMENT ON COLUMN his_config_info.src_user IS 'source user';
COMMENT ON COLUMN his_config_info.src_ip IS 'source ip';
COMMENT ON COLUMN his_config_info.op_type IS 'operation type';
COMMENT ON COLUMN his_config_info.tenant_id IS '租户字段';
COMMENT ON COLUMN his_config_info.encrypted_data_key IS '密钥';

CREATE INDEX idx_gmt_create ON his_config_info (gmt_create);
CREATE INDEX idx_gmt_modified ON his_config_info (gmt_modified);
CREATE INDEX idx_did ON his_config_info (data_id);


/******************************************/
/*   表名称 = tenant_capacity              */
/******************************************/
CREATE TABLE tenant_capacity (
                                 id BIGSERIAL NOT NULL PRIMARY KEY,
                                 tenant_id VARCHAR(128) NOT NULL DEFAULT ''::VARCHAR,
                                 quota INT4 NOT NULL DEFAULT 0,
                                 usage INT4 NOT NULL DEFAULT 0,
                                 max_size INT4 NOT NULL DEFAULT 0,
                                 max_aggr_count INT4 NOT NULL DEFAULT 0,
                                 max_aggr_size INT4 NOT NULL DEFAULT 0,
                                 max_history_count INT4 NOT NULL DEFAULT 0,
                                 gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE tenant_capacity IS '租户容量信息表';
COMMENT ON COLUMN tenant_capacity.id IS '主键ID';
COMMENT ON COLUMN tenant_capacity.tenant_id IS 'Tenant ID';
COMMENT ON COLUMN tenant_capacity.quota IS '配额，0表示使用默认值';
COMMENT ON COLUMN tenant_capacity.usage IS '使用量';
COMMENT ON COLUMN tenant_capacity.max_size IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN tenant_capacity.max_aggr_count IS '聚合子配置最大个数';
COMMENT ON COLUMN tenant_capacity.max_aggr_size IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN tenant_capacity.max_history_count IS '最大变更历史数量';
COMMENT ON COLUMN tenant_capacity.gmt_create IS '创建时间';
COMMENT ON COLUMN tenant_capacity.gmt_modified IS '修改时间';

CREATE UNIQUE INDEX uk_tenant_id ON tenant_capacity (tenant_id);


/******************************************/
/*   表名称 = tenant_info                  */
/******************************************/
CREATE TABLE tenant_info (
                             id BIGSERIAL NOT NULL PRIMARY KEY,
                             kp VARCHAR(128) NOT NULL,
                             tenant_id VARCHAR(128) DEFAULT ''::VARCHAR,
                             tenant_name VARCHAR(128) DEFAULT ''::VARCHAR,
                             tenant_desc VARCHAR(256) DEFAULT NULL,
                             create_source VARCHAR(32) DEFAULT NULL,
                             gmt_create INT8 NOT NULL,
                             gmt_modified INT8 NOT NULL
);

COMMENT ON TABLE tenant_info IS 'tenant_info';
COMMENT ON COLUMN tenant_info.id IS 'id';
COMMENT ON COLUMN tenant_info.kp IS 'kp';
COMMENT ON COLUMN tenant_info.tenant_id IS 'tenant_id';
COMMENT ON COLUMN tenant_info.tenant_name IS 'tenant_name';
COMMENT ON COLUMN tenant_info.tenant_desc IS 'tenant_desc';
COMMENT ON COLUMN tenant_info.create_source IS 'create_source';
COMMENT ON COLUMN tenant_info.gmt_create IS '创建时间';
COMMENT ON COLUMN tenant_info.gmt_modified IS '修改时间';

CREATE UNIQUE INDEX uk_tenant_info_kptenantid ON tenant_info (kp, tenant_id);


/******************************************/
/*   表名称 = users                        */
/******************************************/
CREATE TABLE users (
                       username VARCHAR(50) NOT NULL PRIMARY KEY,
                       password VARCHAR(500) NOT NULL,
                       enabled BOOLEAN NOT NULL
);

COMMENT ON TABLE users IS 'users';
COMMENT ON COLUMN users.username IS 'username';
COMMENT ON COLUMN users.password IS 'password';
COMMENT ON COLUMN users.enabled IS 'enabled';


/******************************************/
/*   表名称 = roles                        */
/******************************************/
CREATE TABLE roles (
                       username VARCHAR(50) NOT NULL,
                       role VARCHAR(50) NOT NULL
);

COMMENT ON TABLE roles IS 'roles';
COMMENT ON COLUMN roles.username IS 'username';
COMMENT ON COLUMN roles.role IS 'role';

CREATE UNIQUE INDEX idx_user_role ON roles (username, role);


/******************************************/
/*   表名称 = permissions                  */
/******************************************/
CREATE TABLE permissions (
                             role VARCHAR(50) NOT NULL,
                             resource VARCHAR(128) NOT NULL,
                             action VARCHAR(50) NOT NULL
);

COMMENT ON TABLE permissions IS 'permissions';
COMMENT ON COLUMN permissions.role IS 'role';
COMMENT ON COLUMN permissions.resource IS 'resource';
COMMENT ON COLUMN permissions.action IS 'action';

CREATE UNIQUE INDEX uk_role_permission ON permissions (role, resource, action);
INSERT INTO users(username,password,enabled) VALUES ('nacos','$2a$10$r2yeAwNzUsaSFZWAkmWeXuX.SnwgBaoUC.RjOOtzHGNpzHoq0CtT2','true');
INSERT INTO roles(username,role ) VALUES ('nacos','ROLE_ADMIN');