
DROP TABLE IF EXISTS hackers;

CREATE TABLE hackers
(
    appNum serial NOT NULL,
    firstName character varying(100) NOT NULL,
    lastName character varying(100) NOT NULL,
    phone CHARACTER VARYING(20) NOT NULL UNIQUE,
    email character varying(254) NOT NULL UNIQUE,
    authOID character varying(72) NOT NULL UNIQUE,
    age character varying(3) NOT NULL,
    gender character varying(320) NOT NULL,
    ethnicity character varying(320),
    school character varying(320) NOT NULL,
    gradYear character(4) NOT NULL,
    ucscStudent boolean NOT NULL,
    ucscCollegeAffiliation character varying(320),
    major character varying(320) NOT NULL,
    linkedinUrl character varying(320),
    githubUrl character varying(320),
    firstHackathon boolean NOT NULL,
    firstCruzHacks boolean NOT NULL,
    participateQuestion character varying(500) NOT NULL,
    technologyQuestion character varying(500) NOT NULL,
    seeAtCruzhacks character varying(500) NOT NULL,
    haveTeam boolean,
    teamNames character varying(800),
    teamEmails character varying(800),
    dietaryRestrictions character varying(150),
    transportation boolean NOT NULL,
    placeToSleep boolean NOT NULL,
    placeToPark boolean NOT NULL,
    specialAccomodations character varying(150),
    confirmedUser boolean DEFAULT false NOT NULL,
    checkedIn boolean DEFAULT false NOT NULL,
    CONSTRAINT hackers_pkey PRIMARY KEY (email)
)
WITH (oids = false);


DROP TABLE IF EXISTS mentors;

CREATE TABLE mentors
(
    appNum serial NOT NULL,
    firstName character varying(100) NOT NULL,
    phone CHARACTER VARYING(20) NOT NULL UNIQUE,
    lastName character varying(100) NOT NULL,
    email character varying(254) NOT NULL UNIQUE,
    authOID character varying(72) NOT NULL UNIQUE,
    age character varying(3) NOT NULL,
    gender character varying(320) NOT NULL,
    ethnicity character varying(320),
    schoolOrCompany character varying(320) NOT NULL,
    major character varying(320),
    linkedin character varying(320),
    github character varying(320),
    firstCruzHacks boolean NOT NULL,
    whyParticipate character varying(500) NOT NULL,
    whatSee character varying(500) NOT NULL,
    dietaryRestrictions character varying(150),
    transport boolean NOT NULL,
    restPlace boolean NOT NULL,
    parking boolean NOT NULL,
    accomodations character varying(150),
    confirmedUser boolean DEFAULT false NOT NULL,
    checkedIn boolean DEFAULT false NOT NULL,
    CONSTRAINT mentors_pkey PRIMARY KEY (email)
)
WITH (oids = false);


DROP TABLE IF EXISTS organizers;
CREATE TABLE organizers
(
    firstName character varying(100) NOT NULL,
    lastName character varying(100) NOT NULL,
    phone CHARACTER VARYING(20) NOT NULL UNIQUE,
    authOID character varying(72) NOT NULL UNIQUE,
    email character varying(254) NOT NULL UNIQUE,
    team character varying(100) NOT NULL,
    checkedIn boolean DEFAULT false NOT NULL,
    CONSTRAINT organizers_email PRIMARY KEY (email)
)
WITH (oids = false);


DROP TABLE IF EXISTS test;
CREATE TABLE test
(
    testField text
)
WITH (oids = false);

INSERT INTO test
    (testField)
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

DROP TABLE IF EXISTS volunteers;

CREATE TABLE volunteers
(
    appNum serial NOT NULL,
    firstName character varying(100) NOT NULL,
    lastName character varying(100) NOT NULL,
    phone CHARACTER VARYING(20) NOT NULL UNIQUE,
    email character varying(254) NOT NULL UNIQUE,
    authOID character varying(72) NOT NULL UNIQUE,
    cruzID character varying(254) NOT NULL,
    age character varying(3) NOT NULL,
    gender character varying(320) NOT NULL,
    ethnicity character varying(320),
    gradYear character(4),
    ucscCollege character varying(320),
    major character varying(320),
    linkedin character varying(320),
    github character varying(320),
    firstHackathon boolean NOT NULL,
    firstCruzHacks boolean NOT NULL,
    whyParticipate character varying(500) NOT NULL,
    whatSee character varying(500) NOT NULL,
    dietaryRestrictions character varying(150),
    restPlace boolean NOT NULL,
    parking boolean NOT NULL,
    accomodations character varying(150),
    confirmedUser boolean DEFAULT false NOT NULL,
    checkedIn boolean DEFAULT false NOT NULL,
    CONSTRAINT volunteers_pkey PRIMARY KEY (email)
)
WITH (oids = false);

-- -- insert mock data for hackers here
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Lucio', 'Trustram', 'ltrustram0@desdev.cn', 'Ine083', 23, 'M', 'Indonesia', 'Universitas Swadaya Gunung Djati', 1994, false, 'Universitas Indonesia', 'eros', './affmvnm', './bllezko', true, true, 'Etiam vel augue. Vestibulum rutrum rutrum neque.', 'Curabitur at ipsum ac tellus semper interdum.', 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', true, 'Yodo', 'ltrustram0@webmd.com', 'In sagittis dui vel nisl.', false, true, true, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', true, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Lovell', 'Sproat', 'lsproat1@wunderground.com', '4ysCzq', 40, 'M', 'Russia', 'Togliatti State University', 2005, false, 'Marij State University', 'ante', './hbgzulv', './hylucab', true, true, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Curabitur at ipsum ac tellus semper interdum.', 'Etiam vel augue.', false, 'Quaxo', 'lsproat1@google.co.jp', 'Nunc rhoncus dui vel sem.', true, false, true, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', false, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Sandye', 'Litherborough', 'slitherborough2@yale.edu', 'sVR3cX', 26, 'F', 'China', 'Chongqing Medical University', 2007, false, 'Northeast University at Qinhuangdao Campus', 'quis', './bxswkcw', './risugnj', false, true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', false, 'Photolist', 'slitherborough2@printfriendly.com', 'Aliquam non mauris.', false, true, false, 'Proin interdum mauris non ligula pellentesque ultrices.', false, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Eveline', 'Whitsey', 'ewhitsey3@wix.com', 'YC51lu', 39, 'F', 'Costa Rica', 'Universidad de San José', 2013, false, 'Universidad de Iberoamérica', 'libero', './uphzbrp', './fpmmpmg', true, true, 'Donec dapibus.', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'Donec ut dolor.', true, 'Skivee', 'ewhitsey3@xinhuanet.com', 'Proin interdum mauris non ligula pellentesque ultrices.', true, false, false, 'Donec ut dolor.', true, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Kore', 'Kolin', 'kkolin4@paypal.com', 'LT0U5z', 20, 'F', 'Sierra Leone', 'Fourah Bay College, University of Sierra Leone', 2002, true, 'Fourah Bay College, University of Sierra Leone', 'dolor sit', './cshuxyn', './pmwrzbk', true, false, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Donec ut mauris eget massa tempor convallis.', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst.', true, 'Feedfish', 'kkolin4@jigsy.com', 'Phasellus sit amet erat.', true, true, false, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', false, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Ellerey', 'Lyte', 'elyte5@friendfeed.com', '8ONdjl', 37, 'M', 'Honduras', 'Universidad Tecnológica Centroamericana', 2010, true, 'Universidad Católica de Honduras', 'massa', './rgfggmi', './arutfcy', true, true, 'Integer ac leo.', 'Proin risus.', 'Morbi non quam nec dui luctus rutrum.', false, 'Agimba', 'elyte5@cbsnews.com', 'Morbi quis tortor id nulla ultrices aliquet.', false, false, true, 'Donec posuere metus vitae ipsum.', true, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Saundra', 'Cattlow', 'scattlow6@dailymail.co.uk', 'tIAg2Y', 18, 'M', 'Honduras', 'Universidad Tecnológica Centroamericana', 1989, true, 'Escuela Agricola Panamericana Zamorano', 'cursus', './lxkhzve', './zxskfno', true, true, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Nulla tellus. In sagittis dui vel nisl.', 'Pellentesque ultrices mattis odio. Donec vitae nisi.', false, 'Digitube', 'scattlow6@biblegateway.com', 'Praesent lectus.', false, true, false, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', true, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Morey', 'Morde', 'mmorde7@xrea.com', 'Rpbebd', 22, 'M', 'China', 'Xiangtan University', 2004, false, 'Shanghai Sanda University', 'felis eu', './qoduxzl', './hxixkln', true, false, 'Aenean lectus. Pellentesque eget nunc.', 'Etiam faucibus cursus urna. Ut tellus.', 'Vestibulum sed magna at nunc commodo placerat.', true, 'Buzzdog', 'mmorde7@webnode.com', 'Nullam porttitor lacus at turpis.', true, true, true, 'Nulla ut erat id mauris vulputate elementum.', false, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Nesta', 'Merit', 'nmerit8@cam.ac.uk', 'tI7FfB', 30, 'F', 'Indonesia', 'Universitas Sarjanawiyata Tamansiswa', 2005, false, 'Universitas Trilogi', 'massa donec', './ihizgxi', './ygcynxb', true, false, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 'Nulla mollis molestie lorem. Quisque ut erat.', true, 'Realpoint', 'nmerit8@paginegialle.it', 'Morbi vel lectus in quam fringilla rhoncus.', true, true, false, 'Nunc nisl.', false, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Danny', 'Daoust', 'ddaoust9@i2i.jp', 'PhU3U6', 24, 'M', 'China', 'Shanghai University of Science and Technology', 2006, false, 'East China Normal University', 'donec', './ggmypbi', './fhmozrf', false, false, 'In sagittis dui vel nisl. Duis ac nibh.', 'Etiam faucibus cursus urna. Ut tellus.', 'In congue.', true, 'Gabcube', 'ddaoust9@marriott.com', 'Proin risus.', true, false, false, 'Integer tincidunt ante vel ipsum.', false, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Vincenty', 'Hegden', 'vhegdena@house.gov', 'LlPQZ2', 40, 'M', 'China', 'Shanghai Ocean University', 1974, false, 'Jilin Agricultural University', 'nunc', './qotntzf', './omotkqa', false, true, 'Cras in purus eu magna vulputate luctus.', 'In hac habitasse platea dictumst.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', false, 'Demizz', 'vhegdena@fda.gov', 'Duis consequat dui nec nisi volutpat eleifend.', false, false, false, 'Donec posuere metus vitae ipsum.', true, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Rossie', 'Filkov', 'rfilkovb@youku.com', '6aj5yR', 34, 'M', 'Philippines', 'Adventist University of the Philippines', 1992, false, 'Isabela State University', 'dictumst maecenas', './jszaqvp', './znstvbw', true, false, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'Morbi vel lectus in quam fringilla rhoncus.', true, 'Zoombeat', 'rfilkovb@hibu.com', 'Aliquam erat volutpat.', true, true, false, 'Nullam porttitor lacus at turpis.', true, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Glynis', 'Necolds', 'gnecoldsc@netvibes.com', 'TtAs0k', 28, 'F', 'Greece', 'Panteios University of Economics and Political Sciences Athens', 2010, true, 'Technological Education Institute of Halkida, Euboea', 'vestibulum', './kafqkyq', './ldlhqje', true, false, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'Cras non velit nec nisi vulputate nonummy.', 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', true, 'Eazzy', 'gnecoldsc@people.com.cn', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', true, true, true, 'Aliquam non mauris.', true, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Yank', 'Kneeshaw', 'ykneeshawd@stumbleupon.com', '1abfmw', 40, 'M', 'China', 'Hebei Medical University', 1997, false, 'Kunmimg University of Science and Technology', 'nec nisi', './xhqouhx', './qvuyeya', false, true, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'Nulla nisl. Nunc nisl.', 'Pellentesque ultrices mattis odio. Donec vitae nisi.', true, 'Skivee', 'ykneeshawd@baidu.com', 'Proin at turpis a pede posuere nonummy.', true, true, false, 'Suspendisse accumsan tortor quis turpis.', true, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Meryl', 'Stoffer', 'mstoffere@blogtalkradio.com', 'IvTGC8', 36, 'M', 'United States', 'Augustana College', 1991, true, 'Neumann College', 'ipsum', './iarfzir', './htoiiqy', false, false, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', true, 'Trupe', 'mstoffere@cam.ac.uk', 'Fusce posuere felis sed lacus.', false, true, true, 'Ut tellus.', true, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Emmalyn', 'Jeal', 'ejealf@macromedia.com', 'k0WXzx', 31, 'F', 'Sweden', 'Free University Stockholm', 2012, false, 'Chalmers University of Technology', 'aliquam lacus', './bfflcnn', './eldglwl', true, true, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', false, 'Twitternation', 'ejealf@github.io', 'In hac habitasse platea dictumst.', false, false, false, 'Vestibulum sed magna at nunc commodo placerat.', false, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Loleta', 'Hryncewicz', 'lhryncewiczg@netlog.com', 'eGSKqH', 22, 'F', 'United States', 'Touro University', 1990, true, 'Loma Linda University', 'sit', './iwbhmhw', './mxjcalx', false, false, 'Quisque id justo sit amet sapien dignissim vestibulum.', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', true, 'Kanoodle', 'lhryncewiczg@i2i.jp', 'In congue.', true, false, false, 'Duis bibendum.', true, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Marie', 'Bebb', 'mbebbh@ameblo.jp', 'fcfRkl', 33, 'F', 'Sweden', 'School of Design and Crafts', 1995, true, 'Kalmar University College', 'hac', './cbujmod', './ghxgsli', false, true, 'Duis consequat dui nec nisi volutpat eleifend.', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'Mauris sit amet eros.', true, 'Oyoba', 'mbebbh@webnode.com', 'Proin eu mi.', true, true, false, 'Quisque porta volutpat erat.', true, true);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Nell', 'Cornehl', 'ncornehli@bravesites.com', 'ashqtB', 25, 'F', 'Canada', 'University of Waterloo', 2000, true, 'University College of Cape Breton', 'congue diam', './noxwwhi', './kdwsplu', true, true, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'Suspendisse accumsan tortor quis turpis. Sed ante.', false, 'Topdrive', 'ncornehli@rediff.com', 'Aliquam non mauris.', true, true, false, 'Nam nulla.', true, false);
-- insert into hackers
--     (firstName, lastName, email, authOID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn)
-- values
--     ('Lian', 'Izac', 'lizacj@vkontakte.ru', 'jNiNwh', 21, 'F', 'Indonesia', 'Politeknik Negeri Jakarta', 1999, false, 'Universitas Mulawarman', 'porttitor', './zcbnfda', './fbzzpcn', false, true, 'Vivamus tortor.', 'Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'Aliquam sit amet diam in magna bibendum imperdiet.', false, 'Yoveo', 'lizacj@newsvine.com', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', false, false, false, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', true, false);

-- -- Insert mock data for mentors here
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Joel', 'Sushams', 'jsushams0@bbb.org', 'YAlcYZ', 26, 'Male', 'Chilean', 'Kaymbo', 'CS', '/bsCjp6', '/FEmaNz', true, 'Nulla ac enim.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Vegetarian', true, false, false, 'Plane', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Lyndell', 'Crittal', 'lcrittal1@mtv.com', 'lffrm2', 19, 'Female', 'Spaniard', 'Rhyloo', 'Other', '/zvPUIk', '/XVxvu7', false, 'Integer tincidunt ante vel ipsum.', 'Sed ante.', 'Vegetarian', true, true, true, 'Hotel', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Berni', 'Pitceathly', 'bpitceathly2@gmpg.org', 'IXWwKx', 21, 'Female', 'Bolivian', 'Quamba', 'Other', '/8O2ReF', '/ouWsgs', false, 'Mauris sit amet eros.', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'None', false, true, false, 'Plane', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Krystyna', 'Bondley', 'kbondley3@utexas.edu', 'EFg7Ad', 20, 'Female', 'Costa Rican', 'Skibox', 'CS', '/X4FYEG', '/XjKLGB', true, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'Etiam justo.', 'Vegetarian', true, false, false, 'None', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Melantha', 'Poker', 'mpoker4@cloudflare.com', 'GNksmC', 26, 'Female', 'Honduran', 'Topiczoom', 'CE', '/zajaQK', '/9VlazQ', true, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'Aliquam non mauris.', 'Vegetarian', false, false, true, 'Hotel', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Whitney', 'Lyven', 'wlyven5@fema.gov', 'xOiqu6', 28, 'Female', 'Chamorro', 'Voonix', 'CS', '/nnSXB5', '/DyKygu', true, 'Fusce posuere felis sed lacus.', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 'Vegetarian', false, true, true, 'Plane', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Eustace', 'Champerlen', 'echamperlen6@nba.com', 'kBdpBP', 18, 'Male', 'Guatemalan', 'Rhyloo', 'Other', '/tV8h9G', '/8GMX3e', true, 'Morbi non quam nec dui luctus rutrum.', 'Sed accumsan felis.', 'None', false, false, false, 'Bus', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Frannie', 'Pena', 'fpena7@yale.edu', 'tDk850', 25, 'Male', 'Cheyenne', 'Oyoloo', 'Other', '/Y0PAfp', '/TUJWPN', false, 'Ut at dolor quis odio consequat varius.', 'Duis aliquam convallis nunc.', 'None', false, false, false, 'None', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('John', 'Listone', 'jlistone8@ox.ac.uk', 'txf2nQ', 28, 'Male', 'Colville', 'Gabspot', 'CE', '/405uq9', '/X7cUiV', false, 'Donec vitae nisi.', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'Vegetarian', true, true, true, 'None', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Bobbye', 'Sutty', 'bsutty9@washington.edu', 'DJeU0W', 24, 'Female', 'Creek', 'Kaymbo', 'CS', '/y8MstQ', '/J0JYWl', false, 'Cras non velit nec nisi vulputate nonummy.', 'Vestibulum ac est lacinia nisi venenatis tristique.', 'None', true, true, false, 'Hotel', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Korry', 'Butcher', 'kbutchera@reference.com', 'yFiX0o', 19, 'Female', 'Sioux', 'Babblestorm', 'CE', '/21TUKm', '/QjLXT7', false, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'Vegetarian', false, false, true, 'Hotel', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Had', 'MacKeogh', 'hmackeoghb@multiply.com', 'y3wCM9', 30, 'Male', 'Creek', 'Realfire', 'CE', '/1i5N0c', '/fedJo2', false, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Maecenas tincidunt lacus at velit.', 'Vegetarian', false, false, false, 'None', false, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Kalli', 'Stock', 'kstockc@so-net.ne.jp', 'hzSNX5', 22, 'Female', 'Pima', 'Wordware', 'Other', '/ylF8S7', '/nCPoUl', true, 'In hac habitasse platea dictumst.', 'Duis mattis egestas metus.', 'Vegan', true, true, true, 'None', false, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Homerus', 'Shelford', 'hshelfordd@nydailynews.com', 'nWAPyT', 29, 'Male', 'Aleut', 'Meevee', 'CS', '/o79rEi', '/ToysgS', true, 'Quisque porta volutpat erat.', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Vegetarian', true, true, false, 'Bus', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Emelina', 'Justice', 'ejusticee@nydailynews.com', 'dFsMOw', 19, 'Female', 'Tongan', 'Browsetype', 'CS', '/LOxMzq', '/PV1mAl', true, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Vegan', true, true, false, 'Plane', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Wendie', 'Quilty', 'wquiltyf@house.gov', 'aljxRh', 28, 'Female', 'Delaware', 'Brainverse', 'CS', '/a4FXBN', '/JlB3xP', true, 'Curabitur at ipsum ac tellus semper interdum.', 'Duis mattis egestas metus.', 'None', true, true, true, 'None', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Vittoria', 'Legging', 'vleggingg@slate.com', 'COYlkv', 24, 'Female', 'Japanese', 'Voonder', 'CE', '/FBHuU6', '/kgKzwo', true, 'Nulla tellus.', 'Vivamus tortor.', 'None', false, true, true, 'Hotel', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Filia', 'Marti', 'fmartih@acquirethisname.com', 'oqV7Uy', 26, 'Female', 'South American', 'Brainsphere', 'CS', '/wOAZDv', '/YODeIL', false, 'Nunc rhoncus dui vel sem.', 'Vivamus vestibulum sagittis sapien.', 'None', true, false, false, 'Bus', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Ernest', 'Teece', 'eteecei@blog.com', 'AlUumn', 20, 'Male', 'Potawatomi', 'Fatz', 'CE', '/jEbY2k', '/3HRfgk', true, 'Pellentesque at nulla.', 'Curabitur at ipsum ac tellus semper interdum.', 'None', false, false, true, 'Hotel', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Micky', 'Emanson', 'memansonj@businessweek.com', 'H8W85P', 19, 'Male', 'Guamanian', 'Brightbean', 'CS', '/q1HIhM', '/cnFun9', true, 'Duis mattis egestas metus.', 'Pellentesque ultrices mattis odio.', 'Vegan', false, false, true, 'Bus', false, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Essie', 'Gymblett', 'egymblettk@squarespace.com', 'adxZ1Y', 23, 'Female', 'Yaqui', 'Livetube', 'CE', '/nCdjCi', '/lq91Vo', true, 'In blandit ultrices enim.', 'Ut tellus.', 'Vegan', false, true, true, 'Bus', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Dorolisa', 'Turbat', 'dturbatl@yahoo.com', 'AKrGPN', 23, 'Female', 'Japanese', 'Photolist', 'CE', '/17Kc40', '/PX8WcG', false, 'Curabitur gravida nisi at nibh.', 'Aliquam quis turpis eget elit sodales scelerisque.', 'Vegan', false, false, true, 'Plane', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Oneida', 'Chicotti', 'ochicottim@spotify.com', 'Bdl1p9', 26, 'Female', 'Alaska Native', 'Flashset', 'Other', '/7QHICN', '/nZxHaQ', false, 'Nulla justo.', 'Aliquam non mauris.', 'None', true, false, true, 'None', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Horton', 'Henken', 'hhenkenn@cnbc.com', 'P7Bvyd', 23, 'Male', 'Indonesian', 'Skalith', 'CS', '/MrTY9f', '/veVFWu', false, 'Proin at turpis a pede posuere nonummy.', 'Curabitur at ipsum ac tellus semper interdum.', 'Vegan', false, true, false, 'Plane', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Shaun', 'Stiger', 'sstigero@springer.com', 'GVmiw3', 27, 'Female', 'Osage', 'Youopia', 'CE', '/eqZHco', '/0nF8OZ', false, 'Suspendisse potenti.', 'Cras non velit nec nisi vulputate nonummy.', 'Vegetarian', true, false, true, 'Plane', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Gilligan', 'Watman', 'gwatmanp@wisc.edu', 'a6mQJJ', 24, 'Female', 'Pakistani', 'Katz', 'CE', '/kt7EYt', '/QPmzi2', true, 'Aliquam quis turpis eget elit sodales scelerisque.', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'None', true, false, true, 'Hotel', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Sinclare', 'Roughley', 'sroughleyq@gnu.org', 'dTGVcc', 25, 'Male', 'Korean', 'Skipstorm', 'Other', '/RfUyjf', '/GQZBXS', true, 'Duis mattis egestas metus.', 'Donec dapibus.', 'Vegetarian', true, true, false, 'Bus', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Jaine', 'Pietersen', 'jpietersenr@jugem.jp', 'srLVlV', 21, 'Female', 'American Indian', 'Linkbridge', 'CE', '/ZxSqPn', '/5REuq9', true, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'Donec ut dolor.', 'None', false, true, false, 'Plane', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Susanna', 'Langfield', 'slangfields@apache.org', 'oAJSrq', 27, 'Female', 'Sioux', 'Rhycero', 'Other', '/wzX78N', '/d4jhfX', true, 'Nunc purus.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Vegetarian', false, true, true, 'Plane', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Arlen', 'Lum', 'alumt@wikimedia.org', 'H0LVtx', 27, 'Male', 'Lumbee', 'Edgewire', 'CS', '/Rp8c2M', '/eXaaU0', true, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'In hac habitasse platea dictumst.', 'None', false, false, true, 'None', false, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Shina', 'Beasleigh', 'sbeasleighu@godaddy.com', 'OP1FPD', 19, 'Female', 'Pueblo', 'JumpXS', 'CE', '/W1pCYN', '/oPzij8', true, 'Mauris sit amet eros.', 'Integer tincidunt ante vel ipsum.', 'Vegetarian', false, false, true, 'Hotel', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Ara', 'MacConnechie', 'amacconnechiev@redcross.org', 'WvAboY', 27, 'Female', 'Chippewa', 'Npath', 'CE', '/2kjqpC', '/Ph4sSf', true, 'Nulla nisl.', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Vegetarian', false, false, true, 'Hotel', false, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Anni', 'Mountlow', 'amountloww@ebay.com', '2xmVDG', 26, 'Female', 'Chamorro', 'Roombo', 'CE', '/5XpVSI', '/hjBoJZ', true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Duis ac nibh.', 'Vegan', false, false, true, 'Hotel', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Jilleen', 'Gosby', 'jgosbyx@java.com', '2IVMfQ', 24, 'Female', 'Eskimo', 'Oodoo', 'CE', '/qitVZZ', '/LZ6rJK', true, 'Ut at dolor quis odio consequat varius.', 'In congue.', 'Vegetarian', false, false, false, 'Bus', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Eilis', 'Noel', 'enoely@whitehouse.gov', '84463S', 20, 'Female', 'Paraguayan', 'Skalith', 'CE', '/bW1sOk', '/RMwVMj', true, 'Praesent blandit lacinia erat.', 'Nulla ut erat id mauris vulputate elementum.', 'Vegan', false, true, false, 'Bus', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Karissa', 'Wilcocke', 'kwilcockez@issuu.com', 'Wi2PzI', 27, 'Female', 'Thai', 'Trupe', 'Other', '/LOov2A', '/6KFXVc', true, 'Maecenas ut massa quis augue luctus tincidunt.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Vegan', true, false, false, 'Plane', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Grover', 'Climar', 'gclimar10@apple.com', 'tXPnOz', 22, 'Male', 'Chickasaw', 'Buzzbean', 'CE', '/Jp1Fmz', '/J2kx40', true, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Nulla facilisi.', 'None', true, false, true, 'None', false, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Fonz', 'Kira', 'fkira11@imdb.com', 'Qy12d2', 24, 'Male', 'Delaware', 'Feedmix', 'Other', '/JLg1o6', '/gbRzpA', true, 'Nullam molestie nibh in lectus.', 'Nulla facilisi.', 'Vegetarian', true, true, false, 'None', false, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Theodosia', 'Creaser', 'tcreaser12@cafepress.com', 'uG92Pl', 24, 'Female', 'Vietnamese', 'Fadeo', 'Other', '/lEZDCl', '/Bfe8nZ', false, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'Vegan', true, true, true, 'None', false, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Pernell', 'Lunney', 'plunney13@flavors.me', 'KOn2YN', 25, 'Male', 'Eskimo', 'Mudo', 'CE', '/WYBNya', '/dBW4fc', true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Donec ut mauris eget massa tempor convallis.', 'Vegetarian', true, false, true, 'Plane', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Maurise', 'Berkley', 'mberkley14@dion.ne.jp', 'U5B742', 21, 'Female', 'Comanche', 'Skipfire', 'CS', '/tgcDju', '/gOOr4t', false, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Vegan', true, true, true, 'Bus', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Inge', 'Matityahu', 'imatityahu15@goo.ne.jp', 'SRUybR', 30, 'Female', 'Puget Sound Salish', 'Eayo', 'Other', '/rZKaLy', '/ciKAHN', false, 'In congue.', 'Morbi vel lectus in quam fringilla rhoncus.', 'Vegetarian', false, true, true, 'Bus', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Derrik', 'McKelvey', 'dmckelvey16@yandex.ru', '2TMFNE', 28, 'Male', 'Mexican', 'Fadeo', 'CE', '/0bXp6f', '/BqyCpM', true, 'Donec semper sapien a libero.', 'Vestibulum sed magna at nunc commodo placerat.', 'None', true, false, false, 'None', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Alfonso', 'Rawling', 'arawling17@rambler.ru', 'KS402H', 25, 'Male', 'Eskimo', 'Browseblab', 'CE', '/Q3okEH', '/t6TSkP', true, 'Mauris lacinia sapien quis libero.', 'Morbi non lectus.', 'None', true, true, true, 'Hotel', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Reuven', 'Maty', 'rmaty18@csmonitor.com', 'n0r6sJ', 24, 'Male', 'Cambodian', 'Oyoyo', 'Other', '/UbGQF5', '/cJPdCF', true, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'Nullam molestie nibh in lectus.', 'Vegetarian', true, false, true, 'Hotel', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Carroll', 'Rendbaek', 'crendbaek19@toplist.cz', 'xi6yrW', 27, 'Male', 'Ecuadorian', 'Dazzlesphere', 'Other', '/p8cLTV', '/rmBXDC', false, 'Nullam molestie nibh in lectus.', 'Fusce consequat.', 'Vegetarian', true, false, false, 'Bus', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Poul', 'Carlow', 'pcarlow1a@goo.gl', 'ismE5L', 28, 'Male', 'Colville', 'Babbleopia', 'Other', '/TjGE59', '/sMWuBe', true, 'Donec dapibus.', 'Suspendisse accumsan tortor quis turpis.', 'Vegan', false, false, true, 'Bus', true, true);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Erhard', 'Faunt', 'efaunt1b@nationalgeographic.com', 'aeRx70', 19, 'Male', 'American Indian', 'Divanoodle', 'Other', '/CrHeLP', '/7WQ0OG', true, 'Pellentesque ultrices mattis odio.', 'Maecenas rhoncus aliquam lacus.', 'Vegan', false, true, true, 'Hotel', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Ronny', 'Wildes', 'rwildes1c@biglobe.ne.jp', 'CocCje', 27, 'Male', 'Houma', 'Mymm', 'Other', '/3pybLQ', '/tSamfB', false, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 'Curabitur at ipsum ac tellus semper interdum.', 'None', true, false, false, 'Plane', true, false);
-- insert into mentors
--     (firstname, lastname, email, authOid, age, gender, ethnicity, schoolorcompany, major, linkedin, github, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, transport, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Lewes', 'Gorch', 'lgorch1d@msu.edu', '5v6Fbq', 29, 'Male', 'Latin American Indian', 'Skiba', 'Other', '/Lrbh0t', '/0lVw9g', false, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Aliquam erat volutpat.', 'Vegan', true, true, false, 'Plane', true, true);
-- --mock data for volunteers
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Darby', 'Walrond', 'dwalrond0@nhs.uk', 'DYoULV', 'hvlwxc', 18, 'Female', 'Mexican', 2022, 'Stevenson', 'CS', '/ypptusg', '/qblbioi', false, false, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'Pellentesque viverra pede ac diam.', 'Sed ante.', false, true, 'Morbi non lectus.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Nils', 'Hardeman', 'nhardeman1@fastcompany.com', 'M5lXmX', 'fodlna', 26, 'Male', 'Paraguayan', 2021, 'Rachel Carson', 'Other', '/vwotcom', '/dsjndcd', true, false, 'Fusce consequat.', 'Nam nulla.', 'Maecenas ut massa quis augue luctus tincidunt.', true, true, 'Donec ut dolor.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Obadiah', 'Cocozza', 'ococozza2@moonfruit.com', 'pNXsGN', 'yhjldo', 22, 'Male', 'Indonesian', 2021, 'College 10', 'CE', '/namuiki', '/nezavch', false, false, 'Integer ac neque.', 'Nulla tempus.', 'Nulla justo.', true, true, 'Nulla ut erat id mauris vulputate elementum.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Hartwell', 'Vowells', 'hvowells3@nps.gov', 'Tg5HMm', 'xcfsbs', 28, 'Male', 'Osage', 2021, 'Porter', 'CS', '/gdnicgg', '/ntyzvvg', true, false, 'Proin eu mi.', 'Etiam justo.', 'Quisque ut erat.', true, true, 'Fusce consequat.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Araldo', 'Wessel', 'awessel4@feedburner.com', 'QTYhja', 'awpcin', 30, 'Male', 'Cheyenne', 2020, 'Oakes', 'CE', '/vddrhit', '/sayphaa', true, true, 'Suspendisse accumsan tortor quis turpis.', 'Ut tellus.', 'Nam nulla.', true, false, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Augustus', 'Millhouse', 'amillhouse5@goo.gl', 'cmCswL', 'dkesnr', 18, 'Male', 'Cheyenne', 2021, 'Merril', 'Other', '/qpdhumm', '/ivnuznp', false, false, 'Donec posuere metus vitae ipsum.', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Nullam molestie nibh in lectus.', false, true, 'Cras pellentesque volutpat dui.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Britte', 'Jovasevic', 'bjovasevic6@apple.com', '2yS0gi', 'rxsdzq', 19, 'Female', 'Japanese', 2020, 'Kresge', 'CS', '/mrewcfv', '/nrufaou', false, true, 'Fusce posuere felis sed lacus.', 'Etiam justo.', 'Duis mattis egestas metus.', true, true, 'In hac habitasse platea dictumst.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Ferris', 'Berns', 'fberns7@springer.com', 'sPmyqb', 'gomffm', 26, 'Male', 'Cheyenne', 2020, 'College 10', 'CE', '/plppilf', '/ftwkagh', true, false, 'Nullam molestie nibh in lectus.', 'Fusce posuere felis sed lacus.', 'Etiam justo.', false, false, 'Ut at dolor quis odio consequat varius.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Elwira', 'Burtonwood', 'eburtonwood8@4shared.com', 'ht2TmK', 'rbdfat', 30, 'Female', 'Creek', 2021, 'Rachel Carson', 'Other', '/jednroz', '/pmmzrpo', false, true, 'Curabitur in libero ut massa volutpat convallis.', 'Pellentesque ultrices mattis odio.', 'Proin interdum mauris non ligula pellentesque ultrices.', true, true, 'Etiam justo.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Tina', 'Coton', 'tcoton9@tripod.com', '58fvIH', 'cncbgr', 30, 'Female', 'Tlingit-Haida', 2020, 'Stevenson', 'CE', '/byijgsk', '/qgkdurg', false, false, 'Nullam sit amet turpis elementum ligula vehicula consequat.', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'In hac habitasse platea dictumst.', false, true, 'Fusce consequat.', true, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Evangelina', 'Grindle', 'egrindlea@huffingtonpost.com', 'cstboo', 'wgceyz', 20, 'Female', 'Latin American Indian', 2021, 'Porter', 'Other', '/xlzlpjd', '/jnnezyp', true, false, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'Integer a nibh.', 'Aenean sit amet justo.', false, true, 'Donec dapibus.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Leigha', 'Maty', 'lmatyb@deliciousdays.com', 'DjG3u7', 'zuocyl', 27, 'Female', 'Uruguayan', 2021, 'Oakes', 'CS', '/tuwcxui', '/psuxdkh', true, true, 'Suspendisse potenti.', 'Duis consequat dui nec nisi volutpat eleifend.', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', true, true, 'Integer ac neque.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Mariquilla', 'Champkins', 'mchampkinsc@nature.com', 'UQelKL', 'lxsdhk', 21, 'Female', 'Tongan', 2020, 'Stevenson', 'Other', '/qzyjkyi', '/kodirfg', false, false, 'Pellentesque viverra pede ac diam.', 'Suspendisse potenti.', 'Duis aliquam convallis nunc.', false, false, 'Etiam vel augue.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Bale', 'Baigrie', 'bbaigried@blogs.com', 'ajT7yl', 'aicpay', 22, 'Male', 'Yaqui', 2021, 'College 10', 'Other', '/rfbinpv', '/kgwvsdk', false, false, 'Praesent lectus.', 'Etiam justo.', 'Proin risus.', false, true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Theodor', 'BrogNOT', 'tbrogNOTe@squidoo.com', 'TBhrgH', 'yaqmlg', 20, 'Male', 'Polynesian', 2019, 'Oakes', 'Other', '/bazlcfk', '/rlqawzw', true, false, 'Duis ac nibh.', 'Duis consequat dui nec nisi volutpat eleifend.', 'Integer non velit.', false, false, 'Fusce consequat.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Myrtie', 'Swanton', 'mswantonf@diigo.com', 'bDlnWJ', 'kbqwge', 17, 'Female', 'Yuman', 2019, 'College 10', 'CS', '/vtyanla', '/lzzwplg', true, true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Vestibulum rutrum rutrum neque.', 'Vivamus in felis eu sapien cursus vestibulum.', true, false, 'Nullam sit amet turpis elementum ligula vehicula consequat.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Jorey', 'Reasce', 'jreasceg@csmonitor.com', 'z5nP7Z', 'zfghcr', 16, 'Female', 'Crow', 2019, 'Kresge', 'CS', '/yzzvjtm', '/eevuxfr', true, false, 'Praesent blandit lacinia erat.', 'Cras in purus eu magna vulputate luctus.', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', true, true, 'Praesent blandit.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Tabb', 'Tomsett', 'ttomsetth@goo.gl', 'LvfM4f', 'ckvndt', 24, 'Male', 'Apache', 2019, 'Oakes', 'Other', '/fjfyaze', '/qlqbmfq', false, true, 'Pellentesque ultrices mattis odio.', 'In sagittis dui vel nisl.', 'Donec semper sapien a libero.', true, false, 'Integer ac leo.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Skipp', 'Wickman', 'swickmani@fc2.com', 'DvjCSm', 'ebztup', 21, 'Male', 'Cheyenne', 2019, 'Porter', 'Other', '/mgwrwvc', '/oovryhx', true, true, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'Morbi a ipsum.', 'Vivamus vel nulla eget eros elementum pellentesque.', true, true, 'Phasellus sit amet erat.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Melosa', 'Howett', 'mhowettj@squidoo.com', 'yLO8iH', 'dwtxgw', 30, 'Female', 'Thai', 2021, 'College 10', 'CE', '/kllnwap', '/azhpfes', true, true, 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Nulla tellus.', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', true, false, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Rad', 'Dalbey', 'rdalbey0@vkontakte.ru', 'vM5xfw', 'ogrtkz', 24, 'Male', 'Creek', 2021, 'Stevenson', 'CE', '/zobxhfz', '/pgbdxvb', false, false, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'Vivamus vestibulum sagittis sapien.', 'Vivamus vel nulla eget eros elementum pellentesque.', true, true, 'Integer a nibh.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Tiffanie', 'Isles', 'tisles1@rambler.ru', 'vpw7MX', 'marjkd', 17, 'Female', 'Venezuelan', 2019, 'Porter', 'CS', '/fcqnoiy', '/belbxfo', false, false, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'Mauris ullamcorper purus sit amet nulla.', 'Vestibulum rutrum rutrum neque.', false, true, 'Sed accumsan felis.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Halimeda', 'Holborn', 'hholborn2@macromedia.com', 'AkjLFY', 'fabmyw', 27, 'Female', 'Japanese', 2020, 'Rachel Carson', 'CE', '/wqkdbnq', '/weflmej', false, true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Donec posuere metus vitae ipsum.', 'Vestibulum ac est lacinia nisi venenatis tristique.', false, true, 'In hac habitasse platea dictumst.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Englebert', 'Bare', 'ebare3@amazon.co.jp', 'SGRXBd', 'cljxgz', 19, 'Male', 'Guatemalan', 2019, 'College 10', 'Other', '/pdhqcph', '/ivnlqio', false, true, 'Curabitur convallis.', 'Nulla mollis molestie lorem.', 'Nulla nisl.', false, true, 'Vivamus vel nulla eget eros elementum pellentesque.', true, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Aristotle', 'Hollebon', 'ahollebon4@wiley.com', 'tPhc6M', 'ppsaja', 30, 'Male', 'Uruguayan', 2020, 'College 9', 'CS', '/tdaauuf', '/ubdoxuw', true, true, 'Quisque porta volutpat erat.', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'In hac habitasse platea dictumst.', true, true, 'Quisque id justo sit amet sapien dignissim vestibulum.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Bel', 'Castells', 'bcastells5@apple.com', 'k7CEGC', 'ouxyrh', 16, 'Female', 'Melanesian', 2019, 'College 10', 'CS', '/bbywzno', '/ygmndyk', true, false, 'Proin risus.', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', true, false, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Sollie', 'Carbin', 'scarbin6@ihg.com', 'PDc1NP', 'ifrtlm', 28, 'Male', 'Paiute', 2019, 'Oakes', 'CE', '/vuxxbug', '/ewslqsc', true, true, 'Praesent id massa id nisl venenatis lacinia.', 'Cras non velit nec nisi vulputate nonummy.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', true, false, 'Aenean lectus.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Stephannie', 'Baybutt', 'sbaybutt7@gov.uk', 'mu6FmQ', 'kzsmfh', 17, 'Female', 'Asian', 2022, 'Rachel Carson', 'CE', '/pvwxrva', '/jrdfiqp', false, true, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', false, true, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Cori', 'Yven', 'cyven8@cyberchimps.com', 'GxIbF7', 'ravcog', 25, 'Female', 'Osage', 2021, 'Kresge', 'CE', '/mjmqavf', '/xtweonw', false, true, 'Aliquam erat volutpat.', 'Praesent blandit lacinia erat.', 'Donec ut mauris eget massa tempor convallis.', true, false, 'Morbi ut odio.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Lethia', 'Borleace', 'lborleace9@bravesites.com', '95ySI5', 'ixsqac', 18, 'Female', 'Cherokee', 2019, 'College 9', 'Other', '/vwqkqql', '/nfdwjrx', false, true, 'Aenean auctor gravida sem.', 'Nulla nisl.', 'Morbi ut odio.', true, false, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Bidget', 'Colrein', 'bcolreina@illinois.edu', 'ikySGO', 'ejlfyf', 29, 'Female', 'Cheyenne', 2021, 'College 10', 'Other', '/chndhxm', '/yjxnxrl', true, false, 'Aenean auctor gravida sem.', 'Duis ac nibh.', 'Sed vel enim sit amet nunc viverra dapibus.', false, true, 'Duis aliquam convallis nunc.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Earl', 'Treadwell', 'etreadwellb@oakley.com', 'eLqqwn', 'yoeyai', 21, 'Male', 'Native Hawaiian', 2019, 'Porter', 'Other', '/vhztpsl', '/huqulit', false, false, 'Nullam varius.', 'Pellentesque viverra pede ac diam.', 'Morbi non lectus.', true, false, 'Nulla justo.', true, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Myra', 'Blowen', 'mblowenc@geocities.jp', '8ptqm8', 'khmyuk', 22, 'Female', 'Peruvian', 2020, 'Kresge', 'Other', '/furvjxd', '/whmfjus', false, true, 'Donec vitae nisi.', 'Vestibulum sed magna at nunc commodo placerat.', 'Nam tristique tortor eu pede.', true, true, 'Vivamus tortor.', true, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Billye', 'Leaning', 'bleaningd@friendfeed.com', 'Ftc4Tl', 'shsdha', 23, 'Female', 'Sioux', 2019, 'Porter', 'CE', '/geaflvz', '/ppemrmo', true, false, 'Duis ac nibh.', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', true, false, 'Suspendisse ornare consequat lectus.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Faith', 'Marchetti', 'fmarchettie@wix.com', 'tVCLTg', 'edxtek', 19, 'Female', 'Potawatomi', 2021, 'College 9', 'CE', '/limmlyw', '/mhuhxer', true, true, 'Nullam molestie nibh in lectus.', 'Cras in purus eu magna vulputate luctus.', 'Integer non velit.', false, true, 'Etiam pretium iaculis justo.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Natka', 'Essberger', 'nessbergerf@ustream.tv', 'hNJYig', 'gmjcyl', 29, 'Female', 'Tohono O''Odham', 2020, 'College 9', 'CS', '/xcascpz', '/tonhvrh', false, true, 'Suspendisse accumsan tortor quis turpis.', 'Duis mattis egestas metus.', 'Donec ut mauris eget massa tempor convallis.', true, true, 'Phasellus in felis.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Matthaeus', 'Lambertazzi', 'mlambertazzig@topsy.com', 'K44hMS', 'zuidlm', 19, 'Male', 'Polynesian', 2019, 'Porter', 'Other', '/zfyyzvp', '/fxmevrr', true, true, 'Integer ac leo.', 'Etiam justo.', 'Phasellus id sapien in sapien iaculis congue.', false, false, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Christoph', 'Randales', 'crandalesh@jigsy.com', '7Xs1o9', 'llgspk', 20, 'Male', 'Mexican', 2022, 'Oakes', 'CS', '/vwltuus', '/bgsyzlg', false, true, 'Nam tristique tortor eu pede.', 'Morbi vel lectus in quam fringilla rhoncus.', 'Maecenas rhoncus aliquam lacus.', true, false, 'Maecenas tincidunt lacus at velit.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Aldon', 'Digger', 'adiggeri@gravatar.com', 'VZhR3i', 'qoyfvl', 18, 'Male', 'Yaqui', 2021, 'College 9', 'Other', '/pswvdog', '/skceiub', false, false, 'Aenean lectus.', 'Integer tincidunt ante vel ipsum.', 'Phasellus sit amet erat.', true, false, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Gleda', 'Fagge', 'gfaggej@cpanel.net', 'royVz0', 'zdvgsx', 17, 'Female', 'Filipino', 2019, 'Kresge', 'CS', '/rtaqkqf', '/jvzcwfl', true, true, 'Curabitur in libero ut massa volutpat convallis.', 'Nam tristique tortor eu pede.', 'Duis bibendum.', true, false, 'Curabitur convallis.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Dulcea', 'Giddens', 'dgiddensk@redcross.org', 'LKA8V9', 'fifbuq', 26, 'Female', 'Pima', 2019, 'Stevenson', 'CE', '/uiyoris', '/ihynelv', false, false, 'Etiam faucibus cursus urna.', 'Aliquam erat volutpat.', 'Morbi porttitor lorem id ligula.', false, true, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Kathleen', 'Snoddy', 'ksnoddyl@imdb.com', 'txBSto', 'bvxdwo', 20, 'Female', 'Yaqui', 2019, 'Oakes', 'CE', '/caphaeo', '/xtvcnys', true, false, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'Vivamus in felis eu sapien cursus vestibulum.', 'Nunc purus.', true, true, 'Donec ut mauris eget massa tempor convallis.', true, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Gasper', 'Di Bartolommeo', 'gdibartolommeom@unblog.fr', '2OyDbt', 'fdnzna', 27, 'Male', 'Fijian', 2020, 'College 9', 'Other', '/gjmwxpv', '/tunzwpm', true, false, 'Nunc purus.', 'Proin eu mi.', 'In blandit ultrices enim.', false, false, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', false, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Alameda', 'Temblett', 'atemblettn@feedburner.com', '83E7re', 'nashlb', 28, 'Female', 'Melanesian', 2019, 'Merril', 'Other', '/gexajhn', '/acqrvqs', true, true, 'Mauris ullamcorper purus sit amet nulla.', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 'Aenean sit amet justo.', false, true, 'Nulla nisl.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Sheff', 'Bocking', 'sbockingo@xrea.com', '70OWdB', 'uingct', 16, 'Male', 'Nicaraguan', 2022, 'Merril', 'Other', '/ffryzfw', '/ahqpeky', true, true, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Vivamus vestibulum sagittis sapien.', false, true, 'Morbi a ipsum.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Flint', 'Stollberger', 'fstollbergerp@chronoengine.com', 'L2Qs3k', 'wgyamk', 27, 'Male', 'Nicaraguan', 2022, 'College 10', 'Other', '/opcourk', '/krtragf', false, true, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 'Morbi porttitor lorem id ligula.', false, true, 'Sed accumsan felis.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Byrann', 'Corona', 'bcoronaq@cyberchimps.com', 'tvXkbu', 'wqvesv', 23, 'Male', 'Tohono O''Odham', 2022, 'Oakes', 'CS', '/efkfiqv', '/vgxmozb', true, true, 'Nullam varius.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Integer ac neque.', false, false, 'Nulla suscipit ligula in lacus.', true, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Nadia', 'Riteley', 'nriteleyr@nymag.com', 'Jt63e6', 'aotdhj', 19, 'Female', 'Chamorro', 2021, 'Porter', 'CS', '/djmbugf', '/ewhmopa', false, true, 'Aliquam erat volutpat.', 'Donec semper sapien a libero.', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', false, false, 'Nullam sit amet turpis elementum ligula vehicula consequat.', true, true);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Riley', 'Billin', 'rbillins@privacy.gov.au', 'oO4USk', 'lxqudi', 25, 'Male', 'Central American', 2022, 'Stevenson', 'CS', '/lalfcmu', '/srxkbdc', true, false, 'Integer non velit.', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'Donec vitae nisi.', true, true, 'Proin eu mi.', false, false);
-- insert into volunteers
--     (firstname, lastname, email, authOid, cruzid, age, gender, ethnicity, gradyear, ucsccollege, major, linkedin, github, firsthackathon, firstcruzhacks, whyparticipate, whatsee, dietaryrestrictions, restplace, parking, accomodations, confirmeduser, checkedin)
-- values
--     ('Madonna', 'Kettlesting', 'mkettlestingt@alibaba.com', 'OqMPbL', 'myixhl', 17, 'Female', 'Eskimo', 2019, 'College 10', 'CS', '/pvkxrax', '/qubhocp', false, false, 'Quisque id justo sit amet sapien dignissim vestibulum.', 'Etiam vel augue.', 'Maecenas tincidunt lacus at velit.', true, false, 'Nulla facilisi.', true, false);

-- -- mock organizer data
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Sherry', 'Burne', '3YJTweL', 'sburne0@phpbb.com', 'President', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Dorolice', 'Edon', 'yIIN5Ah', 'dedon1@zimbio.com', 'Engineering', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Pietro', 'Roe', 'bhBrtMh', 'proe2@ted.com', 'Sponsorship', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Aube', 'Thomann', 'BZewLyL', 'athomann3@google.it', 'Engineering', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Briny', 'Manie', 'X33qU0z', 'bmanie4@time.com', 'President', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Uta', 'Kelinge', 'I2SwrZU', 'ukelinge5@etsy.com', 'Design', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Rowena', 'Wharby', 'OmL5ZxA', 'rwharby6@sun.com', 'Engineering', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Salomone', 'La Padula', '7r7OqRV', 'slapadula7@sogou.com', 'President', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Alia', 'Carthy', 'yaL9vY6', 'acarthy8@nasa.gov', 'Engineering', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Korrie', 'McCarver', 'wyMCOhD', 'kmccarver9@theglobeandmail.com', 'Sponsorship', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Shurwood', 'Clayborn', 'KCMrfZu', 'sclayborna@indiatimes.com', 'Design', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Gerta', 'Brassington', 'eZlThI7', 'gbrassingtonb@aboutads.info', 'Engineering', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Elisha', 'Bambrough', 'GGO3u7g', 'ebambroughc@cocolog-nifty.com', 'Sponsorship', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Mariann', 'Junkinson', 'NrG8Psw', 'mjunkinsond@springer.com', 'Logistics', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Rooney', 'Baukham', 'WpIPDU2', 'rbaukhame@twitpic.com', 'Design', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Claire', 'Anstis', 'k9ohNdL', 'canstisf@twitpic.com', 'Engineering', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Gustave', 'Websdale', 'cp3YdUD', 'gwebsdaleg@google.ru', 'Engineering', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Darryl', 'Margrem', 'zOzLpal', 'dmargremh@wufoo.com', 'Logistics', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Celka', 'Tipple', 'qv58p97', 'ctipplei@wikispaces.com', 'President', false);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Dominick', 'Thorneley', 'CtaGfTC', 'dthorneleyj@a8.net', 'President', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Pru', 'Huggan', '0jREPlz', 'phuggank@geocities.com', 'Design', true);
-- insert into organizers
--     (firstname, lastname, authOid, email, team, checkedin)
-- values
--     ('Kalil', 'Schimek', '4dFJcM7', 'kschimekl@cdbaby.com', 'Logistics', false);

-- -- 2019-07-21 05:59:40.711244+00