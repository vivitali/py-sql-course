-- ----------------------------
--  Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS "public"."items";
CREATE TABLE "public"."items" (
	"name" varchar(255) NOT NULL COLLATE "default",
	"id" int4 NOT NULL,
	"price" numeric(10,2)
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of items
-- ----------------------------
BEGIN;
INSERT INTO "public"."items" VALUES ('Pen', '1', '5.00');
INSERT INTO "public"."items" VALUES ('Fountain Pen', '2', '11.30');
INSERT INTO "public"."items" VALUES ('Ink', '3', '3.50');
INSERT INTO "public"."items" VALUES ('Laptop', '4', '899.00');
INSERT INTO "public"."items" VALUES ('Screen', '5', '275.50');
INSERT INTO "public"."items" VALUES ('Hard Drive', '6', '89.99');
COMMIT;

-- ----------------------------
--  Primary key structure for table items
-- ----------------------------
ALTER TABLE "public"."items" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  updats
-- ----------------------------

UPDATE items  SET price=4.00 where id=3;
DELETE FROM purchases WHERE item_id=4
DELETE FROM items WHERE id=4

create table public.users (
	id integer PRIMARY KEY,
	name character varying(100) NOT NULL,
)

create table public.videos (
	id integer PRIMARY KEY,
	user_id integer REFERENCES public.users,
	name character varying(255) NOT NULL
)
insert into public.users(id, name)
VALUES(1, 'marismith')
insert into public.users(id, name)
VALUES(2, 'johnsmith')
insert into public.users(id, name)
VALUES(3, 'josesalvatierra')

CREATE SEQUENCE user_id_seq start 3;

ALTER TABLE public.users
ALTER COLUMN id
SET DEFAULT nextval('user_id_seq')

ALTER SEQUENCE user_id_sec owned by public.users.id
INSERT INTO public.users(name)
values('jasonsalvatierra')

create index users_name_index on public.users(name)
create index index_name on public.videos(id, user_id)

DROP TABLE public.users CASCADE 