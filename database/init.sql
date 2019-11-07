
DROP TABLE IF EXISTS hackers;

CREATE TABLE hackers
(
    appNum serial NOT NULL,
    firstName character varying(100) NOT NULL,
    lastName character varying(100) NOT NULL,
    email character varying(254) NOT NULL UNIQUE,
    auth0ID character varying(72) NOT NULL UNIQUE,
    age character varying(3) NOT NULL,
    gender character varying(320) NOT NULL,
    ethnicity character varying(320),
    school character varying(320) NOT NULL,
    gradYear character(4),
    ucscStudent boolean NOT NULL,
    ucscCollege character varying(320),
    major character varying(320),
    linkedin character varying(320),
    github character varying(320),
    firstHackathon boolean NOT NULL,
    firstCruzHacks boolean NOT NULL,
    whyParticipate character varying(500) NOT NULL,
    techGoals character varying(500) NOT NULL,
    whatSee character varying(500) NOT NULL,
    haveTeam boolean NOT NULL,
    teamNames character varying(800),
    teamEmails character varying(800),
    dietaryRestrictions character varying(150),
    transport boolean NOT NULL,
    restPlace boolean NOT NULL,
    parking boolean NOT NULL,
    accomodations character varying(150),
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
    lastName character varying(100) NOT NULL,
    email character varying(254) NOT NULL UNIQUE,
    auth0ID character varying(72) NOT NULL UNIQUE,
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
    auth0ID character varying(72) NOT NULL UNIQUE,
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
    email character varying(254) NOT NULL UNIQUE,
    auth0ID character varying(72) NOT NULL UNIQUE,
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

insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Lucio', 'Trustram', 'ltrustram0@desdev.cn', 'Ine083', 23, 'M', 'Indonesia', 'Universitas Swadaya Gunung Djati', 1994, false, 'Universitas Indonesia', 'eros', './affmvnm', './bllezko', true, true, 'Etiam vel augue. Vestibulum rutrum rutrum neque.', 'Curabitur at ipsum ac tellus semper interdum.', 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', true, 'Yodo', 'ltrustram0@webmd.com', 'In sagittis dui vel nisl.', false, true, true, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', true, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Lovell', 'Sproat', 'lsproat1@wunderground.com', '4ysCzq', 40, 'M', 'Russia', 'Togliatti State University', 2005, false, 'Marij State University', 'ante', './hbgzulv', './hylucab', true, true, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Curabitur at ipsum ac tellus semper interdum.', 'Etiam vel augue.', false, 'Quaxo', 'lsproat1@google.co.jp', 'Nunc rhoncus dui vel sem.', true, false, true, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', false, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Sandye', 'Litherborough', 'slitherborough2@yale.edu', 'sVR3cX', 26, 'F', 'China', 'Chongqing Medical University', 2007, false, 'Northeast University at Qinhuangdao Campus', 'quis', './bxswkcw', './risugnj', false, true, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', false, 'Photolist', 'slitherborough2@printfriendly.com', 'Aliquam non mauris.', false, true, false, 'Proin interdum mauris non ligula pellentesque ultrices.', false, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Eveline', 'Whitsey', 'ewhitsey3@wix.com', 'YC51lu', 39, 'F', 'Costa Rica', 'Universidad de San José', 2013, false, 'Universidad de Iberoamérica', 'libero', './uphzbrp', './fpmmpmg', true, true, 'Donec dapibus.', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'Donec ut dolor.', true, 'Skivee', 'ewhitsey3@xinhuanet.com', 'Proin interdum mauris non ligula pellentesque ultrices.', true, false, false, 'Donec ut dolor.', true, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Kore', 'Kolin', 'kkolin4@paypal.com', 'LT0U5z', 20, 'F', 'Sierra Leone', 'Fourah Bay College, University of Sierra Leone', 2002, true, 'Fourah Bay College, University of Sierra Leone', 'dolor sit', './cshuxyn', './pmwrzbk', true, false, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Donec ut mauris eget massa tempor convallis.', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst.', true, 'Feedfish', 'kkolin4@jigsy.com', 'Phasellus sit amet erat.', true, true, false, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', false, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Ellerey', 'Lyte', 'elyte5@friendfeed.com', '8ONdjl', 37, 'M', 'Honduras', 'Universidad Tecnológica Centroamericana', 2010, true, 'Universidad Católica de Honduras', 'massa', './rgfggmi', './arutfcy', true, true, 'Integer ac leo.', 'Proin risus.', 'Morbi non quam nec dui luctus rutrum.', false, 'Agimba', 'elyte5@cbsnews.com', 'Morbi quis tortor id nulla ultrices aliquet.', false, false, true, 'Donec posuere metus vitae ipsum.', true, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Saundra', 'Cattlow', 'scattlow6@dailymail.co.uk', 'tIAg2Y', 18, 'M', 'Honduras', 'Universidad Tecnológica Centroamericana', 1989, true, 'Escuela Agricola Panamericana Zamorano', 'cursus', './lxkhzve', './zxskfno', true, true, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Nulla tellus. In sagittis dui vel nisl.', 'Pellentesque ultrices mattis odio. Donec vitae nisi.', false, 'Digitube', 'scattlow6@biblegateway.com', 'Praesent lectus.', false, true, false, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', true, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Morey', 'Morde', 'mmorde7@xrea.com', 'Rpbebd', 22, 'M', 'China', 'Xiangtan University', 2004, false, 'Shanghai Sanda University', 'felis eu', './qoduxzl', './hxixkln', true, false, 'Aenean lectus. Pellentesque eget nunc.', 'Etiam faucibus cursus urna. Ut tellus.', 'Vestibulum sed magna at nunc commodo placerat.', true, 'Buzzdog', 'mmorde7@webnode.com', 'Nullam porttitor lacus at turpis.', true, true, true, 'Nulla ut erat id mauris vulputate elementum.', false, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Nesta', 'Merit', 'nmerit8@cam.ac.uk', 'tI7FfB', 30, 'F', 'Indonesia', 'Universitas Sarjanawiyata Tamansiswa', 2005, false, 'Universitas Trilogi', 'massa donec', './ihizgxi', './ygcynxb', true, false, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 'Nulla mollis molestie lorem. Quisque ut erat.', true, 'Realpoint', 'nmerit8@paginegialle.it', 'Morbi vel lectus in quam fringilla rhoncus.', true, true, false, 'Nunc nisl.', false, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Danny', 'Daoust', 'ddaoust9@i2i.jp', 'PhU3U6', 24, 'M', 'China', 'Shanghai University of Science and Technology', 2006, false, 'East China Normal University', 'donec', './ggmypbi', './fhmozrf', false, false, 'In sagittis dui vel nisl. Duis ac nibh.', 'Etiam faucibus cursus urna. Ut tellus.', 'In congue.', true, 'Gabcube', 'ddaoust9@marriott.com', 'Proin risus.', true, false, false, 'Integer tincidunt ante vel ipsum.', false, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Vincenty', 'Hegden', 'vhegdena@house.gov', 'LlPQZ2', 40, 'M', 'China', 'Shanghai Ocean University', 1974, false, 'Jilin Agricultural University', 'nunc', './qotntzf', './omotkqa', false, true, 'Cras in purus eu magna vulputate luctus.', 'In hac habitasse platea dictumst.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', false, 'Demizz', 'vhegdena@fda.gov', 'Duis consequat dui nec nisi volutpat eleifend.', false, false, false, 'Donec posuere metus vitae ipsum.', true, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Rossie', 'Filkov', 'rfilkovb@youku.com', '6aj5yR', 34, 'M', 'Philippines', 'Adventist University of the Philippines', 1992, false, 'Isabela State University', 'dictumst maecenas', './jszaqvp', './znstvbw', true, false, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'Morbi vel lectus in quam fringilla rhoncus.', true, 'Zoombeat', 'rfilkovb@hibu.com', 'Aliquam erat volutpat.', true, true, false, 'Nullam porttitor lacus at turpis.', true, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Glynis', 'Necolds', 'gnecoldsc@netvibes.com', 'TtAs0k', 28, 'F', 'Greece', 'Panteios University of Economics and Political Sciences Athens', 2010, true, 'Technological Education Institute of Halkida, Euboea', 'vestibulum', './kafqkyq', './ldlhqje', true, false, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'Cras non velit nec nisi vulputate nonummy.', 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', true, 'Eazzy', 'gnecoldsc@people.com.cn', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', true, true, true, 'Aliquam non mauris.', true, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Yank', 'Kneeshaw', 'ykneeshawd@stumbleupon.com', '1abfmw', 40, 'M', 'China', 'Hebei Medical University', 1997, false, 'Kunmimg University of Science and Technology', 'nec nisi', './xhqouhx', './qvuyeya', false, true, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'Nulla nisl. Nunc nisl.', 'Pellentesque ultrices mattis odio. Donec vitae nisi.', true, 'Skivee', 'ykneeshawd@baidu.com', 'Proin at turpis a pede posuere nonummy.', true, true, false, 'Suspendisse accumsan tortor quis turpis.', true, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Meryl', 'Stoffer', 'mstoffere@blogtalkradio.com', 'IvTGC8', 36, 'M', 'United States', 'Augustana College', 1991, true, 'Neumann College', 'ipsum', './iarfzir', './htoiiqy', false, false, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', true, 'Trupe', 'mstoffere@cam.ac.uk', 'Fusce posuere felis sed lacus.', false, true, true, 'Ut tellus.', true, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Emmalyn', 'Jeal', 'ejealf@macromedia.com', 'k0WXzx', 31, 'F', 'Sweden', 'Free University Stockholm', 2012, false, 'Chalmers University of Technology', 'aliquam lacus', './bfflcnn', './eldglwl', true, true, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', false, 'Twitternation', 'ejealf@github.io', 'In hac habitasse platea dictumst.', false, false, false, 'Vestibulum sed magna at nunc commodo placerat.', false, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Loleta', 'Hryncewicz', 'lhryncewiczg@netlog.com', 'eGSKqH', 22, 'F', 'United States', 'Touro University', 1990, true, 'Loma Linda University', 'sit', './iwbhmhw', './mxjcalx', false, false, 'Quisque id justo sit amet sapien dignissim vestibulum.', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', true, 'Kanoodle', 'lhryncewiczg@i2i.jp', 'In congue.', true, false, false, 'Duis bibendum.', true, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Marie', 'Bebb', 'mbebbh@ameblo.jp', 'fcfRkl', 33, 'F', 'Sweden', 'School of Design and Crafts', 1995, true, 'Kalmar University College', 'hac', './cbujmod', './ghxgsli', false, true, 'Duis consequat dui nec nisi volutpat eleifend.', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'Mauris sit amet eros.', true, 'Oyoba', 'mbebbh@webnode.com', 'Proin eu mi.', true, true, false, 'Quisque porta volutpat erat.', true, true);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Nell', 'Cornehl', 'ncornehli@bravesites.com', 'ashqtB', 25, 'F', 'Canada', 'University of Waterloo', 2000, true, 'University College of Cape Breton', 'congue diam', './noxwwhi', './kdwsplu', true, true, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'Suspendisse accumsan tortor quis turpis. Sed ante.', false, 'Topdrive', 'ncornehli@rediff.com', 'Aliquam non mauris.', true, true, false, 'Nam nulla.', true, false);
insert into hackers (firstName, lastName, email, auth0ID, age, gender, ethnicity, school, gradYear, ucscStudent, ucscCollege, major, linkedin, github, firstHackathon, firstCruzHacks, whyParticipate, techGoals, whatSee, haveTeam, teamNames, teamEmails, dietaryRestrictions, transport, restPlace, parking, accomodations, confirmedUser, checkedIn) values ('Lian', 'Izac', 'lizacj@vkontakte.ru', 'jNiNwh', 21, 'F', 'Indonesia', 'Politeknik Negeri Jakarta', 1999, false, 'Universitas Mulawarman', 'porttitor', './zcbnfda', './fbzzpcn', false, true, 'Vivamus tortor.', 'Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'Aliquam sit amet diam in magna bibendum imperdiet.', false, 'Yoveo', 'lizacj@newsvine.com', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', false, false, false, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', true, false);


-- 2019-07-21 05:59:40.711244+00
