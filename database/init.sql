
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

--adding mentors
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Joel', 'Sushams', 'jsushams0@bbb.org', 'YAlcYZ', 26, 'Male', 'Chilean', 'Kaymbo', 'CS', '/bsCjp6', '/FEmaNz', true, 'Nulla ac enim.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Vegetarian', true, false, false, 'Plane', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Lyndell', 'Crittal', 'lcrittal1@mtv.com', 'lffrm2', 19, 'Female', 'Spaniard', 'Rhyloo', 'Other', '/zvPUIk', '/XVxvu7', false, 'Integer tincidunt ante vel ipsum.', 'Sed ante.', 'Vegetarian', true, true, true, 'Hotel', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Berni', 'Pitceathly', 'bpitceathly2@gmpg.org', 'IXWwKx', 21, 'Female', 'Bolivian', 'Quamba', 'Other', '/8O2ReF', '/ouWsgs', false, 'Mauris sit amet eros.', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'None', false, true, false, 'Plane', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Krystyna', 'Bondley', 'kbondley3@utexas.edu', 'EFg7Ad', 20, 'Female', 'Costa Rican', 'Skibox', 'CS', '/X4FYEG', '/XjKLGB', true, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'Etiam justo.', 'Vegetarian', true, false, false, 'None', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Melantha', 'Poker', 'mpoker4@cloudflare.com', 'GNksmC', 26, 'Female', 'Honduran', 'Topiczoom', 'CE', '/zajaQK', '/9VlazQ', true, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'Aliquam non mauris.', 'Vegetarian', false, false, true, 'Hotel', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Whitney', 'Lyven', 'wlyven5@fema.gov', 'xOiqu6', 28, 'Female', 'Chamorro', 'Voonix', 'CS', '/nnSXB5', '/DyKygu', true, 'Fusce posuere felis sed lacus.', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 'Vegetarian', false, true, true, 'Plane', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Eustace', 'Champerlen', 'echamperlen6@nba.com', 'kBdpBP', 18, 'Male', 'Guatemalan', 'Rhyloo', 'Other', '/tV8h9G', '/8GMX3e', true, 'Morbi non quam nec dui luctus rutrum.', 'Sed accumsan felis.', 'None', false, false, false, 'Bus', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Frannie', 'Pena', 'fpena7@yale.edu', 'tDk850', 25, 'Male', 'Cheyenne', 'Oyoloo', 'Other', '/Y0PAfp', '/TUJWPN', false, 'Ut at dolor quis odio consequat varius.', 'Duis aliquam convallis nunc.', 'None', false, false, false, 'None', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('John', 'Listone', 'jlistone8@ox.ac.uk', 'txf2nQ', 28, 'Male', 'Colville', 'Gabspot', 'CE', '/405uq9', '/X7cUiV', false, 'Donec vitae nisi.', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'Vegetarian', true, true, true, 'None', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Bobbye', 'Sutty', 'bsutty9@washington.edu', 'DJeU0W', 24, 'Female', 'Creek', 'Kaymbo', 'CS', '/y8MstQ', '/J0JYWl', false, 'Cras non velit nec nisi vulputate nonummy.', 'Vestibulum ac est lacinia nisi venenatis tristique.', 'None', true, true, false, 'Hotel', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Korry', 'Butcher', 'kbutchera@reference.com', 'yFiX0o', 19, 'Female', 'Sioux', 'Babblestorm', 'CE', '/21TUKm', '/QjLXT7', false, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'Vegetarian', false, false, true, 'Hotel', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Had', 'MacKeogh', 'hmackeoghb@multiply.com', 'y3wCM9', 30, 'Male', 'Creek', 'Realfire', 'CE', '/1i5N0c', '/fedJo2', false, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Maecenas tincidunt lacus at velit.', 'Vegetarian', false, false, false, 'None', false, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Kalli', 'Stock', 'kstockc@so-net.ne.jp', 'hzSNX5', 22, 'Female', 'Pima', 'Wordware', 'Other', '/ylF8S7', '/nCPoUl', true, 'In hac habitasse platea dictumst.', 'Duis mattis egestas metus.', 'Vegan', true, true, true, 'None', false, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Homerus', 'Shelford', 'hshelfordd@nydailynews.com', 'nWAPyT', 29, 'Male', 'Aleut', 'Meevee', 'CS', '/o79rEi', '/ToysgS', true, 'Quisque porta volutpat erat.', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Vegetarian', true, true, false, 'Bus', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Emelina', 'Justice', 'ejusticee@nydailynews.com', 'dFsMOw', 19, 'Female', 'Tongan', 'Browsetype', 'CS', '/LOxMzq', '/PV1mAl', true, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Vegan', true, true, false, 'Plane', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Wendie', 'Quilty', 'wquiltyf@house.gov', 'aljxRh', 28, 'Female', 'Delaware', 'Brainverse', 'CS', '/a4FXBN', '/JlB3xP', true, 'Curabitur at ipsum ac tellus semper interdum.', 'Duis mattis egestas metus.', 'None', true, true, true, 'None', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Vittoria', 'Legging', 'vleggingg@slate.com', 'COYlkv', 24, 'Female', 'Japanese', 'Voonder', 'CE', '/FBHuU6', '/kgKzwo', true, 'Nulla tellus.', 'Vivamus tortor.', 'None', false, true, true, 'Hotel', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Filia', 'Marti', 'fmartih@acquirethisname.com', 'oqV7Uy', 26, 'Female', 'South American', 'Brainsphere', 'CS', '/wOAZDv', '/YODeIL', false, 'Nunc rhoncus dui vel sem.', 'Vivamus vestibulum sagittis sapien.', 'None', true, false, false, 'Bus', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Ernest', 'Teece', 'eteecei@blog.com', 'AlUumn', 20, 'Male', 'Potawatomi', 'Fatz', 'CE', '/jEbY2k', '/3HRfgk', true, 'Pellentesque at nulla.', 'Curabitur at ipsum ac tellus semper interdum.', 'None', false, false, true, 'Hotel', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Micky', 'Emanson', 'memansonj@businessweek.com', 'H8W85P', 19, 'Male', 'Guamanian', 'Brightbean', 'CS', '/q1HIhM', '/cnFun9', true, 'Duis mattis egestas metus.', 'Pellentesque ultrices mattis odio.', 'Vegan', false, false, true, 'Bus', false, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Essie', 'Gymblett', 'egymblettk@squarespace.com', 'adxZ1Y', 23, 'Female', 'Yaqui', 'Livetube', 'CE', '/nCdjCi', '/lq91Vo', true, 'In blandit ultrices enim.', 'Ut tellus.', 'Vegan', false, true, true, 'Bus', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Dorolisa', 'Turbat', 'dturbatl@yahoo.com', 'AKrGPN', 23, 'Female', 'Japanese', 'Photolist', 'CE', '/17Kc40', '/PX8WcG', false, 'Curabitur gravida nisi at nibh.', 'Aliquam quis turpis eget elit sodales scelerisque.', 'Vegan', false, false, true, 'Plane', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Oneida', 'Chicotti', 'ochicottim@spotify.com', 'Bdl1p9', 26, 'Female', 'Alaska Native', 'Flashset', 'Other', '/7QHICN', '/nZxHaQ', false, 'Nulla justo.', 'Aliquam non mauris.', 'None', true, false, true, 'None', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Horton', 'Henken', 'hhenkenn@cnbc.com', 'P7Bvyd', 23, 'Male', 'Indonesian', 'Skalith', 'CS', '/MrTY9f', '/veVFWu', false, 'Proin at turpis a pede posuere nonummy.', 'Curabitur at ipsum ac tellus semper interdum.', 'Vegan', false, true, false, 'Plane', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Shaun', 'Stiger', 'sstigero@springer.com', 'GVmiw3', 27, 'Female', 'Osage', 'Youopia', 'CE', '/eqZHco', '/0nF8OZ', false, 'Suspendisse potenti.', 'Cras non velit nec nisi vulputate nonummy.', 'Vegetarian', true, false, true, 'Plane', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Gilligan', 'Watman', 'gwatmanp@wisc.edu', 'a6mQJJ', 24, 'Female', 'Pakistani', 'Katz', 'CE', '/kt7EYt', '/QPmzi2', true, 'Aliquam quis turpis eget elit sodales scelerisque.', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'None', true, false, true, 'Hotel', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Sinclare', 'Roughley', 'sroughleyq@gnu.org', 'dTGVcc', 25, 'Male', 'Korean', 'Skipstorm', 'Other', '/RfUyjf', '/GQZBXS', true, 'Duis mattis egestas metus.', 'Donec dapibus.', 'Vegetarian', true, true, false, 'Bus', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Jaine', 'Pietersen', 'jpietersenr@jugem.jp', 'srLVlV', 21, 'Female', 'American Indian', 'Linkbridge', 'CE', '/ZxSqPn', '/5REuq9', true, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'Donec ut dolor.', 'None', false, true, false, 'Plane', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Susanna', 'Langfield', 'slangfields@apache.org', 'oAJSrq', 27, 'Female', 'Sioux', 'Rhycero', 'Other', '/wzX78N', '/d4jhfX', true, 'Nunc purus.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Vegetarian', false, true, true, 'Plane', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Arlen', 'Lum', 'alumt@wikimedia.org', 'H0LVtx', 27, 'Male', 'Lumbee', 'Edgewire', 'CS', '/Rp8c2M', '/eXaaU0', true, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'In hac habitasse platea dictumst.', 'None', false, false, true, 'None', false, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Shina', 'Beasleigh', 'sbeasleighu@godaddy.com', 'OP1FPD', 19, 'Female', 'Pueblo', 'JumpXS', 'CE', '/W1pCYN', '/oPzij8', true, 'Mauris sit amet eros.', 'Integer tincidunt ante vel ipsum.', 'Vegetarian', false, false, true, 'Hotel', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Ara', 'MacConnechie', 'amacconnechiev@redcross.org', 'WvAboY', 27, 'Female', 'Chippewa', 'Npath', 'CE', '/2kjqpC', '/Ph4sSf', true, 'Nulla nisl.', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Vegetarian', false, false, true, 'Hotel', false, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Anni', 'Mountlow', 'amountloww@ebay.com', '2xmVDG', 26, 'Female', 'Chamorro', 'Roombo', 'CE', '/5XpVSI', '/hjBoJZ', true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Duis ac nibh.', 'Vegan', false, false, true, 'Hotel', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Jilleen', 'Gosby', 'jgosbyx@java.com', '2IVMfQ', 24, 'Female', 'Eskimo', 'Oodoo', 'CE', '/qitVZZ', '/LZ6rJK', true, 'Ut at dolor quis odio consequat varius.', 'In congue.', 'Vegetarian', false, false, false, 'Bus', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Eilis', 'Noel', 'enoely@whitehouse.gov', '84463S', 20, 'Female', 'Paraguayan', 'Skalith', 'CE', '/bW1sOk', '/RMwVMj', true, 'Praesent blandit lacinia erat.', 'Nulla ut erat id mauris vulputate elementum.', 'Vegan', false, true, false, 'Bus', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Karissa', 'Wilcocke', 'kwilcockez@issuu.com', 'Wi2PzI', 27, 'Female', 'Thai', 'Trupe', 'Other', '/LOov2A', '/6KFXVc', true, 'Maecenas ut massa quis augue luctus tincidunt.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Vegan', true, false, false, 'Plane', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Grover', 'Climar', 'gclimar10@apple.com', 'tXPnOz', 22, 'Male', 'Chickasaw', 'Buzzbean', 'CE', '/Jp1Fmz', '/J2kx40', true, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Nulla facilisi.', 'None', true, false, true, 'None', false, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Fonz', 'Kira', 'fkira11@imdb.com', 'Qy12d2', 24, 'Male', 'Delaware', 'Feedmix', 'Other', '/JLg1o6', '/gbRzpA', true, 'Nullam molestie nibh in lectus.', 'Nulla facilisi.', 'Vegetarian', true, true, false, 'None', false, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Theodosia', 'Creaser', 'tcreaser12@cafepress.com', 'uG92Pl', 24, 'Female', 'Vietnamese', 'Fadeo', 'Other', '/lEZDCl', '/Bfe8nZ', false, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'Vegan', true, true, true, 'None', false, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Pernell', 'Lunney', 'plunney13@flavors.me', 'KOn2YN', 25, 'Male', 'Eskimo', 'Mudo', 'CE', '/WYBNya', '/dBW4fc', true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Donec ut mauris eget massa tempor convallis.', 'Vegetarian', true, false, true, 'Plane', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Maurise', 'Berkley', 'mberkley14@dion.ne.jp', 'U5B742', 21, 'Female', 'Comanche', 'Skipfire', 'CS', '/tgcDju', '/gOOr4t', false, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Vegan', true, true, true, 'Bus', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Inge', 'Matityahu', 'imatityahu15@goo.ne.jp', 'SRUybR', 30, 'Female', 'Puget Sound Salish', 'Eayo', 'Other', '/rZKaLy', '/ciKAHN', false, 'In congue.', 'Morbi vel lectus in quam fringilla rhoncus.', 'Vegetarian', false, true, true, 'Bus', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Derrik', 'McKelvey', 'dmckelvey16@yandex.ru', '2TMFNE', 28, 'Male', 'Mexican', 'Fadeo', 'CE', '/0bXp6f', '/BqyCpM', true, 'Donec semper sapien a libero.', 'Vestibulum sed magna at nunc commodo placerat.', 'None', true, false, false, 'None', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Alfonso', 'Rawling', 'arawling17@rambler.ru', 'KS402H', 25, 'Male', 'Eskimo', 'Browseblab', 'CE', '/Q3okEH', '/t6TSkP', true, 'Mauris lacinia sapien quis libero.', 'Morbi non lectus.', 'None', true, true, true, 'Hotel', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Reuven', 'Maty', 'rmaty18@csmonitor.com', 'n0r6sJ', 24, 'Male', 'Cambodian', 'Oyoyo', 'Other', '/UbGQF5', '/cJPdCF', true, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'Nullam molestie nibh in lectus.', 'Vegetarian', true, false, true, 'Hotel', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Carroll', 'Rendbaek', 'crendbaek19@toplist.cz', 'xi6yrW', 27, 'Male', 'Ecuadorian', 'Dazzlesphere', 'Other', '/p8cLTV', '/rmBXDC', false, 'Nullam molestie nibh in lectus.', 'Fusce consequat.', 'Vegetarian', true, false, false, 'Bus', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Poul', 'Carlow', 'pcarlow1a@goo.gl', 'ismE5L', 28, 'Male', 'Colville', 'Babbleopia', 'Other', '/TjGE59', '/sMWuBe', true, 'Donec dapibus.', 'Suspendisse accumsan tortor quis turpis.', 'Vegan', false, false, true, 'Bus', true, true);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Erhard', 'Faunt', 'efaunt1b@nationalgeographic.com', 'aeRx70', 19, 'Male', 'American Indian', 'Divanoodle', 'Other', '/CrHeLP', '/7WQ0OG', true, 'Pellentesque ultrices mattis odio.', 'Maecenas rhoncus aliquam lacus.', 'Vegan', false, true, true, 'Hotel', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Ronny', 'Wildes', 'rwildes1c@biglobe.ne.jp', 'CocCje', 27, 'Male', 'Houma', 'Mymm', 'Other', '/3pybLQ', '/tSamfB', false, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 'Curabitur at ipsum ac tellus semper interdum.', 'None', true, false, false, 'Plane', true, false);
insert into mentors (firstname, lastname, email, auth0id, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin) values ('Lewes', 'Gorch', 'lgorch1d@msu.edu', '5v6Fbq', 29, 'Male', 'Latin American Indian', 'Skiba', 'Other', '/Lrbh0t', '/0lVw9g', false, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Aliquam erat volutpat.', 'Vegan', true, true, false, 'Plane', true, true);



-- 2019-07-21 05:59:40.711244+00
