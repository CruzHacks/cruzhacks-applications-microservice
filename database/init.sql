CREATE USER cruzhacks;
CREATE DATABASE cruzhacks;
GRANT ALL PRIVILEGES ON DATABASE cruzhacks TO cruzhacks;

DROP TABLE IF EXISTS "hackers";

CREATE TABLE "public"."hackers"
(
    "appNum" serial NOT NULL,
    "firstName" character varying(100) NOT NULL,
    "lastName" character varying(100) NOT NULL,
    "email" character varying(254) NOT NULL,
    "portalPass" character varying(72) NOT NULL,
    "age" character varying(3) NOT NULL,
    "gender" character varying(320) NOT NULL,
    "ethnicity" character varying(320),
    "school" character varying(320) NOT NULL,
    "gradYear" character(4),
    "ucscStudent" boolean NOT NULL,
    "ucscCollege" character varying(320),
    "major" character varying(320),
    "linkedin" character varying(320),
    "github" character varying(320),
    "firstHackathon" boolean NOT NULL,
    "firstCruzHacks" boolean NOT NULL,
    "whyParticipate" character varying(500) NOT NULL,
    "techGoals" character varying(500) NOT NULL,
    "whatSee" character varying(500) NOT NULL,
    "haveTeam" boolean NOT NULL,
    "teamNames" character varying(800),
    "teamEmails" character varying(800),
    "dietaryRestrictions" character varying(150),
    "transport" boolean NOT NULL,
    "restPlace" boolean NOT NULL,
    "parking" boolean NOT NULL,
    "accomodations" character varying(150),
    "confirmedUser" boolean DEFAULT false NOT NULL,
    "checkedIn" boolean DEFAULT false NOT NULL,
    CONSTRAINT "hackers_pkey" PRIMARY KEY ("email")
)
WITH (oids = false);


DROP TABLE IF EXISTS "mentors";

CREATE TABLE "public"."mentors"
(
    "appNum" serial NOT NULL,
    "firstName" character varying(100) NOT NULL,
    "lastName" character varying(100) NOT NULL,
    "email" character varying(254) NOT NULL,
    "portalPass" character varying(72) NOT NULL,
    "age" character varying(3) NOT NULL,
    "gender" character varying(320) NOT NULL,
    "ethnicity" character varying(320),
    "schoolOrCompany" character varying(320) NOT NULL,
    "major" character varying(320),
    "linkedin" character varying(320),
    "github" character varying(320),
    "firstCruzHacks" boolean NOT NULL,
    "whyParticipate" character varying(500) NOT NULL,
    "whatSee" character varying(500) NOT NULL,
    "dietaryRestrictions" character varying(150),
    "transport" boolean NOT NULL,
    "restPlace" boolean NOT NULL,
    "parking" boolean NOT NULL,
    "accomodations" character varying(150),
    "confirmedUser" boolean DEFAULT false NOT NULL,
    "checkedIn" boolean DEFAULT false NOT NULL,
    CONSTRAINT "mentors_pkey" PRIMARY KEY ("email")
)
WITH (oids = false);


DROP TABLE IF EXISTS "organizers";
CREATE TABLE "public"."organizers"
(
    "firstName" character varying(100) NOT NULL,
    "lastName" character varying(100) NOT NULL,
    "portalPass" character varying(72) NOT NULL,
    "email" character varying(254) NOT NULL,
    "team" character varying(100) NOT NULL,
    "checkedIn" boolean DEFAULT false NOT NULL,
    CONSTRAINT "organizers_email" PRIMARY KEY ("email")
)
WITH (oids = false);


DROP TABLE IF EXISTS "test";
CREATE TABLE "public"."test"
(
    "testField" text
)
WITH (oids = false);

INSERT INTO "test"
    ("testField")
VALUES
    ('5d270adb0c80e4ea872eddd917125603'),
    ('511101052aceed4cbb3d672b6b19650a'),
    ('a506985f649681a1c65ca1955e59fcc1'),
    ('41e641a19e8fe64bb6a215931e7913da'),
    ('519a717858ab4872febfbfca4db75b27'),
    ('3a152588355a8da6c53ca134b5da8b13'),
    ('e4c51ee73832edcd0266683c9174f10e'),
    ('912ddb79dcd9a708a3a59ea7b86a65ae'),
    ('9ec0594fde5335f832e101fe83d9d9a2'),
    ('e9522028f3f01176df466097a03ad2c3');

DROP TABLE IF EXISTS "volunteers";

CREATE TABLE "public"."volunteers"
(
    "appNum" serial NOT NULL,
    "firstName" character varying(100) NOT NULL,
    "lastName" character varying(100) NOT NULL,
    "email" character varying(254) NOT NULL,
    "portalPass" character varying(72) NOT NULL,
    "cruzID" character varying(254) NOT NULL,
    "age" character varying(3) NOT NULL,
    "gender" character varying(320) NOT NULL,
    "ethnicity" character varying(320),
    "gradYear" character(4),
    "ucscCollege" character varying(320),
    "major" character varying(320),
    "linkedin" character varying(320),
    "github" character varying(320),
    "firstHackathon" boolean NOT NULL,
    "firstCruzHacks" boolean NOT NULL,
    "whyParticipate" character varying(500) NOT NULL,
    "whatSee" character varying(500) NOT NULL,
    "dietaryRestrictions" character varying(150),
    "restPlace" boolean NOT NULL,
    "parking" boolean NOT NULL,
    "accomodations" character varying(150),
    "confirmedUser" boolean DEFAULT false NOT NULL,
    "checkedIn" boolean DEFAULT false NOT NULL,
    CONSTRAINT "volunteers_pkey" PRIMARY KEY ("email")
)
WITH (oids = false);


-- 2019-07-21 05:59:40.711244+00
