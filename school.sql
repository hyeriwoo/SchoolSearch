SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- COLLECE TYPE --

CREATE TABLE `college_type` (
	`college_type_id` int(11) NOT NULL,
	`college_type` varchar(45) NOT NULL
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `college_type` (`college_type_id`, `college_type`) VALUES
(1, 'Private (4 year)'),
(2, 'Public (4 year)'),
(3, 'Community (2 year)'),
(4, 'Trade / Career (2 year)'),
(5, 'Other');

ALTER TABLE `college_type`
	ADD PRIMARY KEY (`college_type_id`);

ALTER TABLE `college_type`
	MODIFY `college_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;




-- SELECTIVITY
CREATE TABLE `selectivity` (
	`selectivity_id` int(11) NOT NULL,
	`selectivity` varchar(45) NOT NULL
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `selectivity` (`selectivity_id`, `selectivity`) VALUES
(1, 'Extremely Selective'),
(2, 'Very Selective'),
(3, 'Selective'),
(4, 'Average'),
(5, 'Not Selective');

ALTER TABLE `selectivity`
	ADD PRIMARY KEY (`selectivity_id`);

ALTER TABLE `selectivity`
	MODIFY `selectivity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;






-- STUDENT SIZE
CREATE TABLE `student_size` (
	`student_size_id` int(11) NOT NULL,
	`student_size` varchar(45) NOT NULL
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `student_size` (`student_size_id`, `student_size`) VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large');

ALTER TABLE `student_size`
	ADD PRIMARY KEY (`student_size_id`);

ALTER TABLE `student_size`
	MODIFY `student_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;



-- LOCATION
CREATE TABLE `location` (
	`location_id` int(11) NOT NULL,
	`location` varchar(45) NOT NULL
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `location` (`location_id`, `location`) VALUES
(1, 'Alabama'),
(2, 'Alaska'),
(3, 'Arizona'),
(4, 'Arkansas'),
(5, 'California'),
(6, 'Colorado'),
(7, 'Connecticut'),
(8, 'Delaware'),
(9, 'District of Columbia'),
(10, 'Florida'),
(11, 'Georgia'),
(12, 'Hawaii'),
(13, 'Idaho'),
(14, 'Illinois'),
(15, 'Indiana'),
(16, 'Iowa'),
(17, 'Kansas'),
(18, 'Kentucky'),
(19, 'Louisiana'),
(20, 'Maine'),
(21, 'Maryland'),
(22, 'Massachusetts'),
(23, 'Michigan'),
(24, 'Minnesota'),
(25, 'Mississippi'),
(26, 'Missouri'),
(27, 'Montana'),
(28, 'Nebraska'),
(29, 'Nevada'),
(30, 'New Hampshire'),
(31, 'New Jersey'),
(32, 'New Mexico'),
(33, 'New York'),
(34, 'North Carolina'),
(35, 'North Dakota'),
(36, 'Ohio'),
(37, 'Oklahoma'),
(38, 'Oregon'),
(39, 'Pennsylvania'),
(40, 'Rhode Island'),
(41, 'South Dakota'),
(42, 'South Carolina'),
(43, 'Tennessee'),
(44, 'Texas'),
(45, 'Utah'),
(46, 'Vermont'),
(47, 'Virginia'),
(48, 'Washington'),
(49, 'West Virginia'),
(50, 'Wisconsin'),
(51, 'Wyoming');


ALTER TABLE `location`
	ADD PRIMARY KEY (`location_id`);

ALTER TABLE `location`
	MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;





-- SCHOOL
CREATE TABLE `school` (
	`school_id` int(11) NOT NULL,
	`name` varchar(100) NOT NULL,
	`location_id` int(11) NOT NULL,
	`description` varchar(1000) NOT NULL,
	`college_type_id` int(11) NOT NULL,
	`student_size` varchar(11) NOT NULL,
	`student_size_id` int(11) NOT NULL,
	`cost` int(11) NOT NULL,
	`acceptance_rate` varchar(45) NOT NULL,
	`selectivity_id` int(11) NOT NULL,
	`website` varchar(45) NOT NULL
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `school` (`school_id`, `name`, `location_id`, `description`, `college_type_id`, 
	`student_size`, `student_size_id`, `cost`, `acceptance_rate`, `selectivity_id`, `website`) VALUES
(1, 'Samford University', 1, 'Find your strength and purpose at Alabama university in rankings by Forbes Inc. and The Wall Street Journal/Times Higher Education. Founded in 1841, Samford is the 87th-oldest institution of higher learning in the United States. U.S. News & World Report ranks Samford 3rd among regional universities in the South. Samford enrolls 5,509 students from 45 states and 30 countries in its 10 academic units: arts, arts and sciences, business, divinity, education, health professions, law, nursing, pharmacy, and public health.',
	1, '3,453', 1, 30594, '82%', 4, 'samford.edu'),
(2, 'University of Mobile', 1, 'You are on a journey to discover Gods purpose for you. At University of Mobile, you are challenged academically and renewed spiritually in a community where you are known. Know yourself. Know your calling. Be Known. University of Mobile is a Christ-centered academic community providing liberal arts and professional programs to renew minds through intellectual and spiritual development for the fulfilling of ones professional calling.',
	1, '1,150', 1, 19779, '47%', 3, 'umobile.edu'),
(3, ' Birmingham-Southern College', 1, 'Birmingham-Southern is an above-average private, Christian college located in Birmingham, Alabama. It is a small institution with an enrollment of 1,261 undergraduate students. Admissions is fairly competitive as the Birmingham-Southern acceptance rate is 57%. Popular majors include Biology, Business, and Psychology. Graduating 68% of students, Birmingham-Southern alumni go on to earn a starting salary of $33,400.',
	1, '1,261', 1, 26863, '57%', 3, 'bsc.edu'),
(4, 'Spring Hill College', 1, 'Founded in 1830, Spring Hill College has educated leaders, influenced careers, inspired life choices and ignited a life-long passion for the greater good. Spring Hill College is the oldest Catholic college in the Southeast and the third oldest Jesuit college in the U.S. Spring Hill students are “Jesuit-educated”, meaning they not only excel academically but also learn the value of the whole person and service for others.',
	1, '1,241', 1, 19779, '66%', 4, 'shc.edu'),
(5, 'Auburn University', 1, 'Welcome to where dreams become a reality, where the practical world meets inspiration. For more than 160 years, an Auburn degree has prepared a new generation of students to innovate and lead. And our results speak for themselves. Forbes calls us a “Best Value College” and Kiplingers named us a “100 Best Values in Public Colleges.” It’s no surprise that Auburn is Alabama’s top university. While some students literally learn to fly here, all are prepared to soar.',
	2, '22,460', 3, 23205, '75%', 4, 'auburn.edu'),
(6, 'The University of Alabama', 1, 'Alabama is a highly rated public university located in Tuscaloosa, Alabama. It is a large institution with an enrollment of 29,586 undergraduate students. Admissions is fairly competitive as the Alabama acceptance rate is 59%. Popular majors include Finance, Business, and Marketing. Graduating 72% of students, Alabama alumni go on to earn a starting salary of $37,400.',
	2, '29,586', 3, 20465, '59%', 3, 'ua.edu'),
(7, 'University of Alabama - Birmingham', 1, 'Alabama - Birmingham is a highly rated public university located in Birmingham, Alabama. It is a large institution with an enrollment of 10,042 undergraduate students. The Alabama - Birmingham acceptance rate is 92%. Popular majors include Nursing, Business, and Psychology. Graduating 58% of students, Alabama - Birmingham alumni go on to earn a starting salary of $35,100.',
	2, '10,042', 2, 16636, '92%', 5, 'uab.edu'),
(8, 'The University of Alabama in Huntsville', 1, 'The University of Alabama in Huntsville is a highly rated public university located in Huntsville, Alabama. It is a mid-size institution with an enrollment of 6,393 undergraduate students. The University of Alabama in Huntsville acceptance rate is 81%. Popular majors include Nursing, Mechanical Engineering, and Business. Graduating 52% of students, The University of Alabama in Huntsville alumni go on to earn a starting salary of $36,200.',
	2, '6,393', 2, 15437, '81%', 4, 'uah.edu'),
(9, 'Marion Military Institute', 1, 'Marion Military is an above-average public college located in Marion, Alabama. It is a small institution with an enrollment of 391 undergraduate students. Admissions is fairly competitive as the Marion Military acceptance rate is 56%. The only major offered is Liberal Arts and Humanities. Graduating 78% of students, Marion Military alumni go on to earn a starting salary of $33,100.',
	3, '391', 1, 11871, '56%', 3, 'marionmilitary.edu'),
(10, 'Wallace Community College - Dothan', 1, 'WCC - Dothan is an above-average public college located in Dothan, Alabama. It is a small institution with an enrollment of 1,795 undergraduate students. The WCC - Dothan acceptance rate is 100%. Popular majors include Liberal Arts and Humanities, Nursing, and Emergency Medical Technician (EMT Paramedic). Graduating 30% of students, WCC - Dothan alumni go on to earn a starting salary of $21,400.',
	4, '1,795', 1, 2031, '100%', 5, 'wallace.edu'),
(11, 'Alaska Pacific University', 2, 'Alaska Pacific is an above-average private, Christian university located in Anchorage, Alaska. It is a small institution with an enrollment of 216 undergraduate students. The Alaska Pacific acceptance rate is 84%. Popular majors include Counseling Psychology, Business, and Parks, Recreation and Leisure Studies. Graduating 56% of students, Alaska Pacific alumni go on to earn a starting salary of $33,200.',
	1, '216', 1, 18932, '84%', 4, 'alaskapacific.edu'),
(12, 'Alaska Bible College', 2, 'Alaska Bible is a private, non-denominational college located in Palmer, Alaska in the Anchorage Area. It is a small institution with an enrollment of 32 undergraduate students. The Alaska Bible acceptance rate is 100%. The only major offered is Biblical Studies. Alaska Bible graduates 38% of its students.',
	1, '32', 1, 19746, '100%', 5, 'akbible.edu'),
(13, 'University of Alaska Southeast', 2, 'Alaska Southeast is an above-average public university located in Juneau, Alaska. It is a small institution with an enrollment of 644 undergraduate students. Admissions is somewhat competitive as the Alaska Southeast acceptance rate is 63%. Popular majors include Police and Criminal Science, Business, and Liberal Arts and Humanities. Graduating 36% of students, Alaska Southeast alumni go on to earn a starting salary of $31,500.',
	2, '644', 1, 8927, '63%', 3, 'uas.alaska.edu'),
(14, 'University of Alaska Fairbanks', 2, 'Alaska Fairbanks is a public university located in College, Alaska. It is a small institution with an enrollment of 2,783 undergraduate students. Admissions is somewhat competitive as the Alaska Fairbanks acceptance rate is 76%. Popular majors include Liberal Arts and Humanities, Business, and Mechanical Engineering. Graduating 32% of students, Alaska Fairbanks alumni go on to earn a starting salary of $30,700.',
	2, '2,783', 1, 10458, '76%', 4, 'uaf.edu'),
(15, 'University of Alaska Anchorage', 2, 'Alaska Anchorage is a public university located in Anchorage, Alaska. It is a mid-size institution with an enrollment of 6,451 undergraduate students. The Alaska Anchorage acceptance rate is 81%. Popular majors include Liberal Arts and Humanities, Nursing, and Accounting. Graduating 30% of students, Alaska Anchorage alumni go on to earn a starting salary of $36,000.',
	2, '6,451', 2, 13288, '81%', 4, 'uaa.alaska.edu'),
(16, 'Embry-Riddle Aeronautical University - Prescott', 3, 'Embry-Riddle Aeronautical University is the nation’s oldest and largest institution dedicated totally to the fields of Aviation, Aerospace, and Security and Intelligence. The university’s Western Campus in Prescott, AZ is surrounded by mountains, lakes and pine trees in the Bradshaw Mountains of Northern Arizona. With over 270 sunny days of flying weather and a 520-acre campus, there are plenty of opportunities to enjoy all that Arizona has to offer without the heat of the deserts to the south. The Prescott Campus is host to the nation’s top ranked Aerospace Engineering program as ranked by US News and World Report, as well as the nation’s first College of Security and Intelligence and the 12-time national champion Golden Eagles Flight Team. The campus offers small class sizes, internship and research opportunities, hands on experiential learning opportunities for all undergraduates, professional mentorship, and 97% in-discipline job placement within a year of graduation.',
	1, '2,592', 1, 33258, '67%', 4, 'prescott.erau.edu'),
(17, 'Grand Canyon University', 3, 'GCU is proud to be ranked as the No. 7 Best College Campus in America by NICHE 2018 Best Colleges. Also, the four-year graduation rate for traditional students has climbed to 58% for the 2014 cohort.',
	1, '17,335', 3, 21403, '73%', 4, 'gcu.edu'),
(18, 'Arizona State University', 3, 'Arizona State is a highly rated public university located in Tempe, Arizona in the Phoenix Area. It is a large institution with an enrollment of 39,396 undergraduate students. The Arizona State acceptance rate is 85%. Popular majors include Business Support Services, Business, and Psychology. Graduating 69% of students, Arizona State alumni go on to earn a starting salary of $38,300.n',
	2, '39,396', 3, 13731, '85%', 4, 'asu.edu'),
(19, 'University of Arizona', 3, 'Arizona is a highly rated public university located in Tucson, Arizona. It is a large institution with an enrollment of 29,027 undergraduate students. The Arizona acceptance rate is 84%. Popular majors include Psychology, Liberal Arts and Humanities, and Physiology and Pathology. Graduating 64% of students, Arizona alumni go on to earn a starting salary of $36,900.',
	2, '29,027', 3, 15594, '84%', 4, 'arizona.edu'),
(20, 'Motorcycle Mechanics Institute - Phoenix', 3, 'MMI - Phoenix is an above-average for-profit college located in Phoenix, Arizona. It is a small institution with an enrollment of 952 undergraduate students. The MMI - Phoenix acceptance rate is 100%. The only major offered is Motorcycle Maintenance and Repair. Graduating 68% of students, MMI - Phoenix alumni go on to earn a starting salary of $31,500.',
	5, '952', 1, 17011, '100%', 5, 'uti.edu/locations/arizona/phoenix'),
(21, 'Hendrix College', 4, 'Hendrix is a highly rated private, Christian college located in Conway, Arkansas in the Little Rock Area. It is a small institution with an enrollment of 1,194 undergraduate students. Admissions is somewhat competitive as the Hendrix acceptance rate is 72%. Popular majors include Biology, Psychology, and Economics. Graduating 71% of students, Hendrix alumni go on to earn a starting salary of $29,200.',
	1, '1,194', 1, 22732, '72%', 4, 'hendrix.edu'),
(22, 'Ouachita Baptist University', 4, 'It iss different here. By choosing Ouachita Baptist University as your college home, you are choosing not only to invest in outstanding academic training and career preparation, but you also are joining a community unlike any other. Our relationships run as deep as our 130-year history, with meaningful traditions and a strong spiritual foundation supporting it all.',
	1, '1,529', 1, 18679, '64%', 4, 'obu.edu'),
(23, 'University of Arkansas', 4, 'Arkansas is a highly rated public university located in Fayetteville, Arkansas. It is a large institution with an enrollment of 21,005 undergraduate students. Admissions is somewhat competitive as the Arkansas acceptance rate is 77%. Popular majors include Nursing, Finance, and Marketing. Graduating 66% of students, Arkansas alumni go on to earn a starting salary of $37,100.',
	2, '21005', 3, 15781, '77%', 4, 'uark.edu'),
(24, 'Arkansas State University', 4, 'Arkansas State is an above-average public university located in Jonesboro, Arkansas. It is a mid-size institution with an enrollment of 6,789 undergraduate students. Admissions is somewhat competitive as the Arkansas State acceptance rate is 77%. Popular majors include Liberal Arts and Humanities, Nursing, and Business. Graduating 48% of students, Arkansas State alumni go on to earn a starting salary of $27,500.',
	2, '6,789', 2, 13459, '77%', 4, 'astate.edu'),
(25, 'University of Arkansas Community College - Morrilton', 4, 'Arkansas Community College - Morrilton is an above-average public college located in Morrilton, Arkansas. It is a small institution with an enrollment of 1,032 undergraduate students. Admissions is somewhat competitive as the Arkansas Community College - Morrilton acceptance rate is 74%. Popular majors include Liberal Arts and Humanities, Information Science, and Licensed Practical Nurse Training (LPN). Graduating 29% of students, Arkansas Community College - Morrilton alumni go on to earn a starting salary of $24,800.',
	1, '1,032', 1, 5370, '74%', 4, 'uaccm.edu'),
(26, 'Stanford University', 5, 'Stanford is an elite private university located in Stanford, California in the San Francisco Bay Area. It is a mid-size institution with an enrollment of 7,087 undergraduate students. Admissions is extremely competitive as the Stanford acceptance rate is only 4%. Popular majors include Computer Science, Biology, and Engineering. Graduating 94% of students, Stanford alumni go on to earn a starting salary of $70,400.',
	1, '7,087', 2, 17271, '4%', 1, 'stanford.edu'),
(27, 'California Institute of Technology', 5, 'Caltech is an elite private college located in Pasadena, California in the Los Angeles Area. It is a small institution with an enrollment of 948 undergraduate students. Admissions is extremely competitive as the Caltech acceptance rate is only 7%. Popular majors include Computer Science, Physics, and Electrical Engineering. Graduating 92% of students, Caltech alumni go on to earn a starting salary of $54,500.',
	1, '948', 1, 26361, '7%', 1, 'caltech.edu'),
(28, 'University of Southern California', 5, 'USC is a highly rated private university located in Los Angeles, California. It is a large institution with an enrollment of 19,194 undergraduate students. Admissions is extremely competitive as the USC acceptance rate is 13%. Popular majors include Business, Communications, and Biology. Graduating 92% of students, USC alumni go on to earn a starting salary of $53,800.',
	1, '19194', 3, 36161, '13%', 1, 'usc.edu'),
(29, 'University of California - Los Angeles', 5, 'UCLA is a highly rated public university located in Los Angeles, California. It is a large institution with an enrollment of 31,009 undergraduate students. Admissions is extremely competitive as the UCLA acceptance rate is 14%. Popular majors include Economics, Political Science and Government, and Sociology. Graduating 91% of students, UCLA alumni go on to earn a starting salary of $44,500.',
	2, '31,009', 3, 15002, '14%', 1, 'ucla.edu'),
(30, 'University of California - Berkeley', 5, 'UC Berkeley is a highly rated public university located in Berkeley, California in the San Francisco Bay Area. It is a large institution with an enrollment of 29,570 undergraduate students. Admissions is extremely competitive as the UC Berkeley acceptance rate is 15%. Popular majors include Economics, Computer Science, and Cellular Biology. Graduating 91% of students, UC Berkeley alumni go on to earn a starting salary of $48,700.',
	2, '29,570', 3, 17862, '15%', 1, 'berkeley.edu'),

(31, 'Colorado College', 6, 'Welcome to the Block Plan, where you’ll take one class at a time for 3 ½ weeks. Prepare to dive into your current passion in small discussion-based classes, where professors will know your name, encourage you to grow, and respect your stride. Master the art of balance with clubs, internships, work, athletics, community service, and adjuncts.',
	1, '2,098', 1,28390, '15%', 1, 'coloradocollege.edu'),
(32, 'University of Denver', 6, '
University of Denver is a highly rated private university located in Denver, Colorado. It is a mid-size institution with an enrollment of 5,563 undergraduate students. Admissions is fairly competitive as the University of Denver acceptance rate is 56%. Popular majors include Finance, Psychology, and International Relations. Graduating 77% of students, University of Denver alumni go on to earn a starting salary of $44,500.',
	1, '5,563', 2, 34337, '56%', 3, 'du.edu'),
(33, 'Colorado School of Mines', 6, 'School of Mines is a highly rated public college located in Golden, Colorado in the Denver Area. It is a small institution with an enrollment of 4,709 undergraduate students. Admissions is fairly competitive as the School of Mines acceptance rate is 49%. Popular majors include Mechanical Engineering, Mining and Petroleum Engineering, and Engineering. Graduating 80% of students, School of Mines alumni go on to earn a starting salary of $69,200.',
	2, '4,709', 1, 25767, '49%', 3, 'mines.edu'),
(34, 'University of Colorado - Boulder', 6, 'University of Colorado is a highly rated public university located in Boulder, Colorado in the Denver Area. It is a large institution with an enrollment of 28,034 undergraduate students. The University of Colorado acceptance rate is 82%. Popular majors include Business, Psychology, and Economics. Graduating 71% of students, University of Colorado alumni go on to earn a starting salary of $39,100.',
	2, '28,034', 3, 21466, '82%', 4, 'colorado.edu'),
(35, 'Pickens Techinical College', 6, 'Pickens Tech is an above-average public college located in Aurora, Colorado in the Denver Area. It is a small institution with an enrollment of 1,157 undergraduate students. The Pickens Tech acceptance rate is 100%. Popular majors include Automotive Mechanics, Medical Assistant, and Machine and Metal Working. Graduating 81% of students, Pickens Tech alumni go on to earn a starting salary of $26,400.',
	3, '1,157', 1, 6543, '100%', 5, 'pickenstech.org'),

(36, 'Yale University', 7, 'Yale is best defined by the word and. Yale is a research university and a liberal arts college. Its scholars are driven by innovation and more than 300 years of tradition. Yale students excel in the arts, humanities, social sciences, sciences, and engineering at the highest levels. Students of all backgrounds, beliefs, identities, and interests join a global community that values a multifaceted approach to undergraduate education.
All Yale undergraduates enroll in a single liberal arts college with 2,000 courses and 80 majors. Students are randomly assigned to Residential Colleges: close-knit communities housed in stunning buildings centered on courtyards. Each is a microcosm of Yale’s diverse student body, while preserving the intimacy of a small college.',
	1, '5,939', 2, 18748, '6%', 1, 'admissions.yale.edu'),
(37, 'Wesleyan University', 7, 'At Wesleyan, our open curriculum challenges and teaches you to think creatively, become intellectually agile, and take meaningful risks. This flexibility prepares you both for success and the inevitable setbacks along the path to discovery.',
	1, 'size', 3, 21236, '17%', 2, 'wesleyan.edu'),
(38, 'University of Connecticut', 7, 'Connecticut is a highly rated public university located in Storrs, Connecticut. It is a large institution with an enrollment of 18,478 undergraduate students. Admissions is fairly competitive as the Connecticut acceptance rate is 49%. Popular majors include Psychology, Economics, and Communications. Graduating 85% of students, Connecticut alumni go on to earn a starting salary of $46,400.',
	2, '18,478', 3, 19650, '49%', 3, 'uconn.edu'),
(39, 'University of Connecticut - Stamford', 7, 'UConn - Stamford is an above-average public university located in Stamford, Connecticut in the New York City Area. It is a small institution with an enrollment of 1,701 undergraduate students. Admissions is somewhat competitive as the UConn - Stamford acceptance rate is 78%. Graduating 67% of students, UConn - Stamford alumni go on to earn a starting salary of $46,400.',
	2, '1,701', 1, 10351, '78%', 4, 'uconn.edu'),
(40, 'Manchester Community College - Connecticut', 7, 'Manchester CC - Connecticut is a public college located in Connecticut. It is a small institution with an enrollment of 2,004 undergraduate students. The Manchester CC - Connecticut acceptance rate is 100%. Popular majors include Liberal Arts and Humanities, Accounting Technician and Bookkeeping, and Police and Criminal Science. Graduating 19% of students, Manchester CC - Connecticut alumni go on to earn a starting salary of $27,800.',
	4, '2,004', 1, 6666, '100%', 5, 'manchestercc.edu'),

(41, 'Goldey-Beacom College', 8, 'An independent, multilevel college, Goldey-Beacom College offers challenging undergraduate and graduate programs. As a teaching-oriented institution of higher learning, the College emphasizes instructional excellence in the classroom and is committed to sustaining faculty who are caring, dedicated and knowledgeable in their respective fields, who motivate their students to realize their full learning potential, and, above all, who represent teaching excellence.',
	1, '655', 1, 15882, '53%', 3, 'gbc.edu'),
(42, 'Wilmington University', 8, 'Wilmington U is a private university located in Wilmington Manor, Delaware in the Philadelphia Area. It is a small institution with an enrollment of 3,433 undergraduate students. The Wilmington U acceptance rate is 100%. Popular majors include Nursing, Behavioral Sciences, and Business. Graduating 24% of students, Wilmington U alumni go on to earn a starting salary of $36,800.',
	1, '3,433', 1, 13814, '100%', 5, 'wilmu.edu'),
(43, 'University of Delaware', 8, 'UD is a highly rated public university located in Newark, Delaware in the Philadelphia Area. It is a large institution with an enrollment of 18,355 undergraduate students. Admissions is somewhat competitive as the UD acceptance rate is 66%. Popular majors include Finance, Liberal Arts and Humanities, and Marketing. Graduating 81% of students, UD alumni go on to earn a starting salary of $46,700.',
	2, '18,355', 3, 15883, '66%', 4, 'udel.edu'),
(44, 'Delaware State University', 8, 'Delaware State is a public university located in Dover, Delaware. As a historically black college, Delaware State has a strong history of and commitment to the education of black Americans. It is a small institution with an enrollment of 3,678 undergraduate students. Admissions is fairly competitive as the Delaware State acceptance rate is 49%. Popular majors include Kinesiology and Exercise Science, Criminology, and Communications. Graduating 40% of students, Delaware State alumni go on to earn a starting salary of $28,200.',
	2, '3,678', 1, 13234, '49%', 3, 'desu.edu'),
(45, 'Harris School of Business - Dover', 8, 'Harris Business - Dover is a for-profit college located in Dover, Delaware. It is a small institution with an enrollment of 148 undergraduate students. The Harris Business - Dover acceptance rate is 100%. Popular majors include Medical Assistant, Massage Therapy and Bodywork, and Medical Insurance Coding. Harris Business - Dover alumni go on to earn a starting salary of $21,100.',
	5, '148', 1, 23297, '100%', 5, 'harrisschool.edu'),

(46, 'Georgetown University', 9, 'Georgetown is a highly rated private, Catholic university located in Washington, D.C. It is a mid-size institution with an enrollment of 6,990 undergraduate students. Admissions is extremely competitive as the Georgetown acceptance rate is 15%. Popular majors include Political Science and Government, International Relations, and Finance. Graduating 94% of students, Georgetown alumni go on to earn a starting salary of $65,200.',
	1, '6,990', 2, 28509,'15%', 1,'georgetown.edu'),
(47, 'George Washington University', 9, 'George Washington is a highly rated private university located in Washington, D.C. It is a large institution with an enrollment of 11,334 undergraduate students. Admissions is fairly competitive as the George Washington acceptance rate is 42%. Popular majors include International Relations, Medical Laboratory Technician, and Political Science and Government. Graduating 82% of students, George Washington alumni go on to earn a starting salary of $53,600.',
	1, '11,334', 2, 39600, '42%', 3, 'gwu.edu'),
(48, 'University of the District of Columbia', 9, 'UDC is a public university located in Washington, D.C. As a historically black college, UDC has a strong history of and commitment to the education of black Americans. It is a small institution with an enrollment of 1,848 undergraduate students. The UDC acceptance rate is 100%. Popular majors include Liberal Arts and Humanities, Business, and Legal Studies. Graduating 24% of students, UDC alumni go on to earn a starting salary of $29,100.',
	2, '1,848', 1, 17350, '100%', 5, 'udc.edu'),
(49, 'American University', 9, 'American is a highly rated private, Christian university located in Washington, D.C. It is a mid-size institution with an enrollment of 7,952 undergraduate students. Admissions is fairly competitive as the American acceptance rate is 32%. Popular majors include International Relations, Business, and Political Science and Government. Graduating 80% of students, American alumni go on to earn a starting salary of $45,600.',
	1, '7,952', 2, 33034, '32%', 2, '.edu'),
(50, 'Career Technical Institute', 9, 'Career Tech Institute is a for-profit college located in Washington, D.C. It is a small institution with an enrollment of 348 undergraduate students. The Career Tech Institute acceptance rate is 100%. Popular majors include Medical Secretary, Information Science, and Medical Assistant. Graduating 75% of students, Career Tech Institute alumni go on to earn a starting salary of $18,700.',
	4, '348', 1, 17824, '100%', 5, 'careertechnical.edu'),

(51, 'University of Miami', 10, 'At the University of Miami, we transform lives through teaching, research, and service. Our students are agents of change who are passionate about learning, eager to contribute to their community, and free to color outside the lines. Ranked No. 47 in the 2019 Wall Street Journal/Times Higher Education College Rankings, the University of Miami is home to 10,000+ degree-seeking undergraduate students across 9 undergraduate schools and colleges.',
	1, '10,484', 2, 43405, '32%', 2, 'miami.edu'),
(52, 'Rollins College', 10, 'When Florida needed a college, we founded one. We’re entrepreneurial like that. More than 130 years later, we’re still hard at work, preparing a new generation of leaders to meet the challenges of the 21st century.',
	1, '2,433', 1, 32826, '67%', 4, 'rollins.edu'),
(53, 'University of Florida', 10, 'Florida is a highly rated public university located in Gainesville, Florida. It is a large institution with an enrollment of 32,209 undergraduate students. Admissions is fairly competitive as the Florida acceptance rate is 39%. Popular majors include Biology, Psychology, and Liberal Arts and Humanities. Graduating 90% of students, Florida alumni go on to earn a starting salary of $42,600.',
	2, '32,209', 3, 11313, '39%', 3, 'ufl.edu'),
(54, 'Florida State University', 10, 'Florida State is a highly rated public university located in Tallahassee, Florida. It is a large institution with an enrollment of 29,040 undergraduate students. Admissions is fairly competitive as the Florida State acceptance rate is 37%. Popular majors include Psychology, Finance, and Marketing. Graduating 83% of students, Florida State alumni go on to earn a starting salary of $36,500.',
	2, '29040', 3, 13318, '37%', 3, 'fsu.edu'),
(55, 'National Aviation Academy', 10, 'NAA- Tampa Bay is an above-average for-profit college located in South Highpoint, Florida in the Tampa Area. It is a small institution with an enrollment of 710 undergraduate students. The NAA- Tampa Bay acceptance rate is 100%. The only major offered is Aircraft Maintenance. Graduating 63% of students, NAA- Tampa Bay alumni go on to earn a starting salary of $36,100.',
	5, '710', 1, 21051, '100%', 5, 'naa.edu'),

(56, 'Emory University', 11, 'Emory is a highly rated private, Christian university located in Atlanta, Georgia. It is a mid-size institution with an enrollment of 6,985 undergraduate students. Admissions is competitive as the Emory acceptance rate is 19%. Popular majors include Business, Nursing, and Biology. Graduating 90% of students, Emory alumni go on to earn a starting salary of $57,500.',
	1, '6,985', 2, 26804, '19%', 2, 'emory.edu'),
(57, 'Spelman College', 11, 'Spelman is a highly rated private college located in Atlanta, Georgia. As a historically black college, Spelman has a strong history of and commitment to the education of black Americans. It is a small institution with an enrollment of 2,123 undergraduate students. Admissions is fairly competitive as the Spelman acceptance rate is 39%. Popular majors include Psychology, Biology, and Political Science and Government. Graduating 75% of students, Spelman alumni go on to earn a starting salary of $31,500.',
	1, '2123', 1, 39822, '39%', 3, 'spelman.edu'),
(58, 'Georgia Institute of Technology', 11, '
Georgia Tech is a highly rated public college located in Atlanta, Georgia. It is a big institution with an enrollment of 14,318 undergraduate students. Admissions is competitive as the Georgia Tech acceptance rate is 22%. Popular majors include Information Science, Mechanical Engineering, and Business. Graduating 87% of students, Georgia Tech alumni go on to earn a starting salary of $65,500.',
	2, '14,318', 2, 16950, '22%', 2, 'gatech.edu'),
(59, 'University of Georgia', 11, 'Georgia is a highly rated public university located in Athens, Georgia. It is a large institution with an enrollment of 27,947 undergraduate students. Admissions is fairly competitive as the Georgia acceptance rate is 49%. Popular majors include Finance, Psychology, and Biology. Graduating 86% of students, Georgia alumni go on to earn a starting salary of $39,900.',
	2, '27,947', 3, 15539, '49%', 3, 'uga.edu'),
(60, 'South Georgia Technical College', 11, 'South Georgia Tech is an above-average public college located in Georgia. It is a small institution with an enrollment of 1,008 undergraduate students. The South Georgia Tech acceptance rate is 100%. Popular majors include Criminal Justice and Safety Studies, Culinary Arts and Food Service, and Data Processing. Graduating 60% of students, South Georgia Tech alumni go on to earn a starting salary of $19,600.',
	3, '1008', 1, 3418, '100%', 5, 'southgatech.edu'),

(61, 'Brigham Young University - Hawaii', 12, 'BYU-Hawaii is an above-average private, Christian university located in Hawaii. It is a small institution with an enrollment of 2,868 undergraduate students. Admissions is fairly competitive as the BYU-Hawaii acceptance rate is 45%. Popular majors include Liberal Arts and Humanities, Hospitality and Tourism Management, and Social Work and Youth Services. Graduating 63% of students, BYU-Hawaii alumni go on to earn a starting salary of $29,000.',
	1, '2,868', 1, 12871, '45%', 3, 'byuh.edu'),
(62, 'Chaminade University of Honolulu', 12, 'Chaminade is an above-average private, Catholic university located in Honolulu, Hawaii. It is a small institution with an enrollment of 1,401 undergraduate students. The Chaminade acceptance rate is 98%. Popular majors include Criminal Justice and Safety Studies, Psychology, and Liberal Arts and Humanities. Graduating 59% of students, Chaminade alumni go on to earn a starting salary of $30,000.',
	1, '1,401', 1, 22913, '98%', 5, 'chaminade.edu'),
(63, 'University of Hawaii at Manoa', 12, 'University of Hawaii is an above-average public university located in Honolulu, Hawaii. It is a large institution with an enrollment of 10,739 undergraduate students. The University of Hawaii acceptance rate is 84%. Popular majors include Psychology, Communications, and Nursing. Graduating 59% of students, University of Hawaii alumni go on to earn a starting salary of $35,700.',
	2, '10,739', 2, 15712, '84%', 4, 'manoa.hawaii.edu'),
(64, 'University of Hawaii - West Oahu', 12, 'Since its inception in 1976, the University of Hawaiʻi–West Oʻahu has been committed to delivering accessible, affordable higher education to residents on the Leeward Coast through dynamic, flexible, and responsive methods.',
	2, '1,711', 1, 9851, '75%', 4, 'westoahu.hawaii.edu'),
(65, 'Kauai Community College', 12, 'Kauai is an above-average public college located in Hawaii. It is a small institution with an enrollment of 328 undergraduate students. The Kauai acceptance rate is 100%. Popular majors include Liberal Arts and Humanities, Culinary Arts and Food Service, and Licensed Practical Nurse Training (LPN). Graduating 32% of students, Kauai alumni go on to earn a starting salary of $25,900.',
	4, '328', 1, 11052, '100%', 5, 'kauai.hawaii.edu'),

(66, 'Northwest Nazarene University', 13, 'Situated 20 minutes from downtown Boise and within arm s reach of Idahos outdoor pursuits, NNUs best-of-all-worlds location shapes your student experience.You will get hands-on experience in and out of the classroom. Whether working in our state-of-the-art engineering labs, shooting on site with the Film School, or performing at local venues in a jazz ensemble, you will be prepared to pursue any career or an advanced degree at a top graduate school.',
	1, '1089', 1, 18786, '71%', 4, 'nnu.edu'),
(67, 'The College of Idaho', 13, 'College of Idaho is an above-average private college located in Caldwell, Idaho in the Boise Area. It is a small institution with an enrollment of 920 undergraduate students. Admissions is fairly competitive as the College of Idaho acceptance rate is 49%. Popular majors include Psychology, Business, and Health Service Preparatory Studies. Graduating 70% of students, College of Idaho alumni go on to earn a starting salary of $30,400.',
	1, '920', 1, 26018, '49%', 3, 'collegeofidaho.edu'),
(68, 'University of Idaho', 13, 'U of I is a highly rated public university located in Moscow, Idaho. It is a mid-size institution with an enrollment of 6,984 undergraduate students. Admissions is somewhat competitive as the U of I acceptance rate is 77%. Popular majors include Psychology, Mechanical Engineering, and Liberal Arts and Humanities. Graduating 59% of students, U of I alumni go on to earn a starting salary of $31,800.',
	2, '6,984', 2, 15061, '77%', 4, 'uidaho.edu'),
(69, 'Boise State University', 13, 'Boise State is an above-average public university located in Boise, Idaho. It is a large institution with an enrollment of 12,787 undergraduate students. The Boise State acceptance rate is 81%. Popular majors include Business, Nursing, and Liberal Arts and Humanities. Graduating 46% of students, Boise State alumni go on to earn a starting salary of $31,000.',
	2, '12,787', 2, 12558, '81%', 4, 'boisestate.edu'),
(70, 'Oliver Finley Academy of Cosmetology', 13, 'Oliver Finley Cosmetology is an above-average for-profit college located in Garden City, Idaho in the Boise Area. It is a small institution with an enrollment of 215 undergraduate students. The Oliver Finley Cosmetology acceptance rate is 100%. Popular majors include Esthetician and Skin Care, Cosmetology, and Nail Technician. Oliver Finley Cosmetology graduates 93% of its students.',
	5, '215', 1, 13299, '100%', 5, 'oliverfinley.com'),

(71, 'Northwestern University', 14, 'Northwestern is an elite private university located in Evanston, Illinois in the Chicago Area. It is a mid-size institution with an enrollment of 8,161 undergraduate students. Admissions is extremely competitive as the Northwestern acceptance rate is only 8%. Popular majors include Economics, Psychology, and Journalism. Graduating 95% of students, Northwestern alumni go on to earn a starting salary of $58,900.',
	1, '8,161', 2, 27540, '8%', 1, 'northwestern.edu'),
(72, 'University of Chicago', 14, 'A private university chartered in 1890 by John D. Rockefeller, the University of Chicago has been shaping higher education and the intellectual lives of undergraduates for more than a century. Boasting a 217-acre campus on the shores of Lake Michigan, UChicago has been home to 92 Nobel laureates, the largest number affiliated with any American university. UChicago scholars were the first to split the atom, to measure the speed of light, and to develop the field of sociology. The College is the largest academic unit of the university, which encompasses 11 graduate divisions and professional schools, including on-campus law, business, molecular engineering, and medical schools.',
	1, '6,600', 2, 33003, '7%', 1, 'uchicago.edu'),
(73, 'University of Illinois at Urbana-Champaign', 14, '
Illinois is a highly rated public university located in Champaign, Illinois. It is a large institution with an enrollment of 32,757 undergraduate students. Admissions is somewhat competitive as the Illinois acceptance rate is 62%. Popular majors include Research and Experimental Psychology, Economics, and Accounting. Graduating 84% of students, Illinois alumni go on to earn a starting salary of $47,100.',
	2, '32,757', 3, 15829, '62%', 4, 'illinois.edu'),
(74, 'University of Illinois at Chicago', 14, 'Illinois at Chicago is an above-average public university located in Chicago, Illinois. It is a large institution with an enrollment of 19,254 undergraduate students. Admissions is somewhat competitive as the Illinois at Chicago acceptance rate is 76%. Popular majors include Psychology, Biology, and Nursing. Graduating 59% of students, Illinois at Chicago alumni go on to earn a starting salary of $39,600.',
	2, '19,252', 3, 12248, '72%', 4, 'uic.edu'),
(75, 'Harper College', 14, 'Harper is an above-average public college located in Palatine, Illinois in the Chicago Area. It is a small institution with an enrollment of 4,606 undergraduate students. The Harper acceptance rate is 100%. Popular majors include Liberal Arts and Humanities, Nursing Assistant, and Natural Sciences. Graduating 44% of students, Harper alumni go on to earn a starting salary of $31,000.',
	3, '4,606', 1, 6938, '100%', 5, 'harpercollege.edu/index.php'),

(76, 'University of Notre Dame', 15, 'Notre Dame is a highly rated private, Catholic university located in Portage Township, Indiana in the South Bend Area. It is a mid-size institution with an enrollment of 8,607 undergraduate students. Admissions is competitive as the Notre Dame acceptance rate is 18%. Popular majors include Finance, Economics, and Mechanical Engineering. Graduating 97% of students, Notre Dame alumni go on to earn a starting salary of $61,800.',
	1, '8,607', 2, 30229, '18%', 2, 'nd.edu'),
(77, 'Purdue University', 15, 'Purdue is a highly rated public university located in Wabash Township, Indiana. It is a large institution with an enrollment of 31,849 undergraduate students. Admissions is fairly competitive as the Purdue acceptance rate is 58%. Popular majors include Business, Mechanical Engineering, and Computer Science. Graduating 81% of students, Purdue alumni go on to earn a starting salary of $44,800.',
	2, '31,849', 3, 11898, '58%', 3, 'purdue.edu'),

(78, 'Grinnell College', 16, 'Grinnell is a highly rated private college located in Grinnell, Iowa. It is a small institution with an enrollment of 1,679 undergraduate students. Admissions is competitive as the Grinnell acceptance rate is 24%. Popular majors include Economics, Computer Science, and Political Science and Government. Graduating 84% of students, Grinnell alumni go on to earn a starting salary of $32,800.',
	1, '1,679', 1, 30808, '24%', 2, 'grinnell.edu'),

(79, 'Iowa State University', 16, 'Iowa State is a highly rated public university located in Ames, Iowa. It is a large institution with an enrollment of 27,929 undergraduate students. The Iowa State acceptance rate is 91%. Popular majors include Mechanical Engineering, Agricultural Business, and Kinesiology and Exercise Science. Graduating 75% of students, Iowa State alumni go on to earn a starting salary of $41,200.',
	2, '27,929', 3, 14643, '91%', 5, 'iastate.edu'),
(80, 'Aveda Institute - Des Moines', 16, 'Aveda - Des Moines is a highly rated for-profit college located in West Des Moines, Iowa in the Des Moines Area. It is a small institution with an enrollment of 147 undergraduate students. The Aveda - Des Moines acceptance rate is 100%. Popular majors include Cosmetology, Esthetician and Skin Care, and Massage Therapy and Bodywork. Aveda - Des Moines graduates 81% of its students.',
	5, '147', 1, 14938, '100%', 5, 'avedainstitutedesmoines.com'),

(81, 'MidAmerica Nazarene University', 17, 'MNU is a private Christian college where professors are mentors, where classmates are friends and where friends are family. With a campus in Olathe, Kansas, just outside of Kansas City, MNU offers 40+ academic programs on a residential campus plus several online and evening degree-completion and masters programs. At MNU, we are here to ensure your investment pays off—with quality academics, small classes, online options and an unflinching commitment to a Christlike mission. MNU is a community of learners who bring out the best in one another, hope the best for one another and light the path for one another. This is MNU.',
	1, '982', 1, 19905, '59%', 3, 'mnu.edu'),
(82, 'University of Kansas', 17, 'Kansas is a highly rated public university located in Lawrence, Kansas. It is a large institution with an enrollment of 17,333 undergraduate students. The Kansas acceptance rate is 92%. Popular majors include Journalism, Psychology, and Finance. Graduating 65% of students, Kansas alumni go on to earn a starting salary of $39,200.',
	2, '17,333', 3, 18415, '92%', 5, 'ku.edu'),

(83, 'Berea College', 18, 'Berea is an above-average private college located in Berea, Kentucky. It is a small institution with an enrollment of 1,631 undergraduate students. Admissions is fairly competitive as the Berea acceptance rate is 38%. Popular majors include Biology, Information Science, and Manufacturing Engineering Technician. Graduating 63% of students, Berea alumni go on to earn a starting salary of $24,600.',
	1, '1,631', 1, 1196, '38%', 3, 'berea.edu'),
(84, 'University of Kentucky', 18, 'Kentucky is a highly rated public university located in Lexington, Kentucky. It is a large institution with an enrollment of 20,484 undergraduate students. The Kentucky acceptance rate is 94%. Popular majors include Marketing, Business, and Nursing. Graduating 66% of students, Kentucky alumni go on to earn a starting salary of $36,900.',
	2, '20,484', 3, 19762, '94%', 5, 'uky.edu'),

(85, 'Tulane University', 19, 'Tulane is a highly rated private university located in New Orleans, Louisiana. It is a mid-size institution with an enrollment of 6,898 undergraduate students. Admissions is competitive as the Tulane acceptance rate is 17%. Popular majors include Finance, Business, and Marketing. Graduating 85% of students, Tulane alumni go on to earn a starting salary of $42,800.',
	1, '6,898', 2, 37692, '17%', 2, 'tulane.edu'),
(86, 'Bowdoin College', 20, 'Bowdoin may surprise you. Situated in a coastal Maine town, we produce leading scholars, innovators, and humanitarians. Alumni include Reed Hastings (CEO/founder of Netflix) and DeRay Mckesson (Black Lives Matter). Students balance rigorous academics with the fun of more than 100 student clubs. Unfamiliar with Maine? We have beaches, mountains, food trucks, and upscale restaurants. We sport L.L.Bean boots while engaging in social justice and community service. Bowdoin students, diverse in backgrounds and interests, are funded by an annual financial aid budget of $45 million.',
	1, '1,825', 1, 24831, '10%', 1, 'bowdoin.edu'),

(87, 'Johns Hopkins University', 21, 'Johns Hopkins is a highly rated private university located in Baltimore, Maryland. It is a mid-size institution with an enrollment of 5,595 undergraduate students. Admissions is extremely competitive as the Johns Hopkins acceptance rate is 11%. Popular majors include Public Health, Neuroscience and Neurobiology, and Bioengineering and Biomedical Engineering. Graduating 93% of students, Johns Hopkins alumni go on to earn a starting salary of $62,700.',
	1, '5,595', 2, 27868, '11%', 1, 'jhu.edu'),
(88, 'Massachusetts Institute of Technology', 22, 'MIT is an elite private college located in Cambridge, Massachusetts in the Boston Area. It is a small institution with an enrollment of 4,557 undergraduate students. Admissions is extremely competitive as the MIT acceptance rate is only 7%. Popular majors include Computer Science, Mechanical Engineering, and Mathematics. Graduating 94% of students, MIT alumni go on to earn a starting salary of $82,200.',
	1, '4557', 1, 18971, '7%', 1, 'web.mit.edu'),

(89, 'University of Michigan - Ann Arbor', 23, 'Michigan is a highly rated public university located in Ann Arbor, Michigan in the Detroit Area. It is a large institution with an enrollment of 29,245 undergraduate students. Admissions is competitive as the Michigan acceptance rate is 23%. Popular majors include Information Science, Business, and Economics. Graduating 92% of students, Michigan alumni go on to earn a starting salary of $49,800.',
	1, '29,245', 3, 16856, '23%', 2, 'umich.edu'),
(90, 'Carleton College', 24, 'We approach learning with enthusiasm, energy, and a distinctly Carleton brand of playfulness. This is a collaborative place where students and professors work together to make sense of the messiness of life. With over 30 majors to choose from, you can explore your interests – and develop new ones.',
	1, '2,077', 1, 32336, '20%', 2, 'carleton.edu/admissions'),

(91, 'Mississippi State University', 25, 'Mississippi State is a highly rated public university located in Mississippi. It is a large institution with an enrollment of 16,839 undergraduate students. Admissions is fairly competitive as the Mississippi State acceptance rate is 57%. Popular majors include Liberal Arts and Humanities, Kinesiology and Exercise Science, and Business. Graduating 58% of students, Mississippi State alumni go on to earn a starting salary of $33,400.',
	2, '16,839', 3, 16670, '57%', 3, 'msstate.edu'),
(92, 'Washington University in St. Louis', 26, 'At WashU, you will draw strength from a community of achievers who inspire each other with their creativity and tenacity. You’ll acquire the confidence and skills to succeed as a professional and as a person, ready to change the world. You’ll learn from faculty leading their fields, and you’ll have the opportunity to work side by side with them on independent projects.',
	1, '7,146', 2, 27931, '15%', 1, 'wustl.edu'),

(93, 'Montana State University', 27, 'Montana State is an above-average public university located in Bozeman, Montana. It is a large institution with an enrollment of 12,516 undergraduate students. The Montana State acceptance rate is 82%. Popular majors include Business, Nursing, and Family Studies and Consumer Sciences. Graduating 57% of students, Montana State alumni go on to earn a starting salary of $33,500',
	2, '12,516', 2, 15801, '82%', 4, 'montana.edu'),
(94, 'University of Nebraska - Lincoln', 28, 'Nebraska is a highly rated public university located in Lincoln, Nebraska. It is a large institution with an enrollment of 19,466 undergraduate students. Admissions is somewhat competitive as the Nebraska acceptance rate is 80%. Popular majors include Business, Psychology, and Public Relations. Graduating 69% of students, Nebraska alumni go on to earn a starting salary of $37,200.',
	2, '19,466', 3, 17315, '80%', 4, 'unl.edu'),

(95, 'University of Nevada - Reno', 29, 'Nevada - Reno is an above-average public university located in Reno, Nevada. It is a large institution with an enrollment of 15,200 undergraduate students. The Nevada - Reno acceptance rate is 88%. Popular majors include Foods, Nutrition, and Wellness Studies, Biology, and Psychology. Graduating 58% of students, Nevada - Reno alumni go on to earn a starting salary of $37,700.',
	2, '15,200', 3, 15723, '88%', 4, 'unr.edu'),
(96, 'Dartmouth College', 30, 'Dartmouth is an elite private college located in Hanover, New Hampshire. It is a small institution with an enrollment of 4,357 undergraduate students. Admissions is extremely competitive as the Dartmouth acceptance rate is only 9%. Popular majors include Economics, Political Science and Government, and Computer Science. Graduating 95% of students, Dartmouth alumni go on to earn a starting salary of $58,900.',
	1, '4,357', 1, 23394, '9%', 1, 'dartmouth.edu'),

(97, 'Princeton University', 31, 'Princeton is an elite private university located in Princeton, New Jersey. It is a mid-size institution with an enrollment of 5,321 undergraduate students. Admissions is extremely competitive as the Princeton acceptance rate is only 5%. Popular majors include Computer Hardware Engineering, Economics, and Public Policy Analysis. Graduating 96% of students, Princeton alumni go on to earn a starting salary of $60,800.',
	1, '5,321', 2, 16192, '5%', 1, 'princeton.edu'),
(98, 'New Mexico Tech', 32, 'New Mexico Tech is a highly rated public college located in Socorro, New Mexico. It is a small institution with an enrollment of 1,269 undergraduate students. Admissions is competitive as the New Mexico Tech acceptance rate is 23%. Popular majors include Mechanical Engineering, Mining and Petroleum Engineering, and Chemical Engineering. Graduating 56% of students, New Mexico Tech alumni go on to earn a starting salary of $43,500.',
	2, '1,269', 1, 14641, '23%', 2, 'nmt.edu'),

(99, 'Columbia University', 33, 'This is a place unlike any other. Where a renowned Core Curriculum is fueled by an incredibly diverse community. 6,000 undergraduate students from all 50 states and more than 100 countries find a home on our residential campus in Morningside Heights: your corner of New York City. Undergraduates in Columbia College and Columbia Engineering can choose from nearly 100 areas of study and enhance their classroom conversations through research at 200+ research centers and institutes. You Columbia education will be the foundation for a lifetime of learning, collaboration, and the unending pursuit of truth and understanding.',
	1, '7666', 2, 21220, '6%', 1, 'columbia.edu'),
(100, 'Duke University', 34, 'Duke is an elite private, Christian university located in Durham, North Carolina in the Raleigh Area. It is a mid-size institution with an enrollment of 6,659 undergraduate students. Admissions is extremely competitive as the Duke acceptance rate is only 9%. Popular majors include Computer Science, Economics, and Public Policy Analysis. Graduating 96% of students, Duke alumni go on to earn a starting salary of $76,300.',
	1, '6,659', 2, 19785, '9%', 1, 'duke.edu'),

(101, 'North Dakota State University', 35, 'NDSU excels in areas of innovative and technology-driven research, with more than $153 million in annual research expenditures as reported in the National Science Foundation’s Higher Education Research and Development Survey. NDSU has been listed in the Top 100 public research universities in the United States for research and development in agricultural sciences, psychology and social sciences, based on reported research expenditures.',
	2, '10,237', 2, 15472, '93%', 5, 'ndsu.edu'),
(102, 'Case Western Reserve University', 36, 'Case Western is a highly rated private university located in Cleveland, Ohio. It is a mid-size institution with an enrollment of 5,095 undergraduate students. Admissions is competitive as the Case Western acceptance rate is 29%. Popular majors include Bioengineering and Biomedical Engineering, Mechanical Engineering, and Biology. Graduating 85% of students, Case Western alumni go on to earn a starting salary of $59,600.',
	1, '5095', 1, 34061, '29%', 2, 'case.edu'),

(103, 'University of Tulsa', 37, 'Tulsa is a highly rated private, Christian university located in Tulsa, Oklahoma. It is a small institution with an enrollment of 3,156 undergraduate students. Admissions is fairly competitive as the Tulsa acceptance rate is 41%. Popular majors include Mining and Petroleum Engineering, Mechanical Engineering, and Finance. Graduating 74% of students, Tulsa alumni go on to earn a starting salary of $39,800.',
	1, '3,156', 1, 25436, '41%', 3, 'utulsa.edu'),
(104, 'Reed College', 38, 'Intellectual. Intense. Inspiring. Transformative. For over 100 years, Reed has sought to provide the finest educational program in the country, offering students an extraordinary environment in which to discover their passions and pursue them with depth and determination.',
	1, '1,453', 1, 31977, '35%', 3, 'reed.edu'),

(105, 'University of Pennsylvania', 39, 'Penn is an elite private university located in Philadelphia, Pennsylvania. It is a large institution with an enrollment of 10,605 undergraduate students. Admissions is extremely competitive as the Penn acceptance rate is only 8%. Popular majors include Finance, Economics, and Nursing. Graduating 95% of students, Penn alumni go on to earn a starting salary of $71,600.',
	1, '10,605', 2, 26266, '8%', 1, 'upenn.edu'),
(106, 'Brown University', 40, 'rown is an elite private university located in Providence, Rhode Island. It is a mid-size institution with an enrollment of 6,735 undergraduate students. Admissions is extremely competitive as the Brown acceptance rate is only 8%. Popular majors include Computer Science, Economics, and Biology. Graduating 95% of students, Brown alumni go on to earn a starting salary of $52,500.',
	1, '6,735', 2, 27238, '8%', 1, 'brown.edu'),

(107, 'Clemson University', 41, 'Clemson is a highly rated public university located in South Carolina. It is a large institution with an enrollment of 18,971 undergraduate students. Admissions is fairly competitive as the Clemson acceptance rate is 47%. Popular majors include Industrial Engineering, Business, and Marketing. Graduating 83% of students, Clemson alumni go on to earn a starting salary of $43,600.',
	1, '18971', 3, 19508, '47%', 3, 'clemson.edu'),
(108, 'Augustana University', 42, 'Augustana University is a comprehensive university located in the heart of Sioux Falls. With 100 majors, minors, and pre-professional programs for undergraduates, the University is committed to enriching lives and fostering development by combining a foundation in the liberal arts with professional skill and advanced study.',
	1, '1,717', 1, 23257, '65%', 4, 'augie.edu'),

(109, 'Vanderbilt University', 43, 'Vanderbilt University includes four undergraduate schools and six graduate schools situated on a beautiful 330-acre campus located in the heart of Nashville, TN. The excellent academic rigor, vibrant campus life, and an urban location attract exceptionally talented students from around the world, consistently earning Vanderbilt a top-20 ranking from U.S. News & World Report. Vanderbilts 6,900 undergraduate and 5,700 graduate students from more than 90 countries are immersed in interdisciplinary research, teaching, and experiential learning that are at the heart of the Vanderbilt community.',
	1, '6,789', 2, 23596, '10%', 1, 'vanderbilt.edu'),
(110, 'Rice University', 44, 'Rice University sits in the heart of Houston on a 300-acre, tree-lined campus next to the Texas Medical Center and the Houston Museum District. Our tight-knit student community, engaging campus life and groundbreaking research opportunities attract talented students from all over the world who choose from more than 50 majors across six schools of study. See how Rice can help you find and follow your passions into a lifelong career.',
	1, '3,899', 1, 23202, '11%', 1, 'rice.edu'),

(111, 'Brigham Young University', 45, 'Brigham Young is a highly rated private, Christian university located in Provo, Utah in the Salt Lake City Area. It is a large institution with an enrollment of 28,253 undergraduate students. Admissions is somewhat competitive as the Brigham Young acceptance rate is 64%. Popular majors include Psychology, Exercise Physiology, and Accounting. Graduating 86% of students, Brigham Young alumni go on to earn a starting salary of $41,100.',
	1, '28253', 3, 13120, '64%', 4, 'byu.edu'),
(112, 'Middlebury College', 46, 'Middlebury College welcomes the bold, the brave, the intelligent, the inquisitive, the global thinkers, the local activists, those who are ready to speak up and speak out. For more than 200 years, exceptional students have come to Middlebury for our progressive thinking, challenging academics, high expectations, and even higher outcomes.',
	1, '2551', 1, 23136, '17%', 2, 'middlebury.edu'),

(113, 'University of Virginia', 47, 'UVA is a highly rated public university located in Charlottesville, Virginia. It is a large institution with an enrollment of 15,990 undergraduate students. Admissions is competitive as the UVA acceptance rate is 26%. Popular majors include Liberal Arts and Humanities, Economics, and Business. Graduating 94% of students, UVA alumni go on to earn a starting salary of $50,300.',
	2, '15,990', 3, 17845, '26%', 2, 'virginia.edu'),
(114, 'University of Washington', 48, 'University of Washington is a highly rated public university located in Seattle, Washington. It is a large institution with an enrollment of 29,496 undergraduate students. Admissions is fairly competitive as the University of Washington acceptance rate is 49%. Popular majors include Research and Experimental Psychology, Communications, and Political Science and Government. Graduating 84% of students, University of Washington alumni go on to earn a starting salary of $44,900',
	2, '29,496', 3, 9765, '49%', 3, 'washington.edu'),

(115, 'West Virginia University', 49, 'WVU is a highly rated public university located in Morgantown, West Virginia. It is a large institution with an enrollment of 19,568 undergraduate students. The WVU acceptance rate is 82%. Popular majors include Liberal Arts and Humanities, Journalism, and Sociology. Graduating 60% of students, WVU alumni go on to earn a starting salary of $34,500.',
	1, '19,568', 3, 12181, '82%', 4, 'wvu.edu'),
(116, 'University of Wisconsin', 50, 'Wisconsin is a highly rated public university located in Madison, Wisconsin. It is a large institution with an enrollment of 29,375 undergraduate students. Admissions is fairly competitive as the Wisconsin acceptance rate is 52%. Popular majors include Biology, Economics, and Information Science. Graduating 87% of students, Wisconsin alumni go on to earn a starting salary of $45,000.',
	2, '29,375', 3, 14169, '52%', 3, 'wisc.edu'),

(117, 'University of Wyoming', 51, 'Wyoming is a highly rated public university located in Laramie, Wyoming. It is a mid-size institution with an enrollment of 8,457 undergraduate students. The Wyoming acceptance rate is 96%. Popular majors include Nursing, Psychology, and Elementary Education. Graduating 57% of students, Wyoming alumni go on to earn a starting salary of $38,700.',
	2, '8,457', 2, 12999, '96%', 5, 'uwyo.edu'),

(118, 'Harvard University', 22, 'Harvard is an elite private university located in Cambridge, Massachusetts in the Boston Area. It is a mid-size institution with an enrollment of 7,210 undergraduate students. Admissions is extremely competitive as the Harvard acceptance rate is only 5%. Popular majors include Economics, Computer Science, and Political Science and Government. Graduating 98% of students, Harvard alumni go on to earn a starting salary of $70,300.',
	1, '7,210', 1, 17590, '5%', 1, 'harvard.edu');








ALTER TABLE `school`
	ADD PRIMARY KEY (`school_id`);

ALTER TABLE `school`
	MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

ALTER TABLE `school`
	ADD CONSTRAINT `school_1` FOREIGN KEY(`location_id`) REFERENCES `location` (`location_id`),
	ADD CONSTRAINT `school_2` FOREIGN KEY(`college_type_id`) REFERENCES `college_type` (`college_type_id`),
	ADD CONSTRAINT `school_3` FOREIGN KEY(`student_size_id`) REFERENCES `student_size` (`student_size_id`),
	ADD CONSTRAINT `school_4` FOREIGN KEY(`selectivity_id`) REFERENCES `selectivity` (`selectivity_id`);



-- REVIEW
CREATE TABLE `review` (
	`review_id` int(11) NOT NULL,
	`school_id` int(11) NOT NULL,
	`review` varchar(1000) NOT NULL,
	`password` varchar(45) NOT NULL
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `review` (`review_id`, `school_id`,`review`, `password`) VALUES
(1, 11, 'Stay away--go to a real university! In my first year, fundamental classes were often cancelled by the professor. Course offerings are very limited. In pursuit of a proper education, I took the courses I needed at UAA, and found them to be more rigorous. The (too) well funded FAST lab generates some good scientists, but many of the students in this lab present thesis work that one would more likely find at the end of a 300 level science course term project. Staff and administration (especially IT) is quirky, but generally effective. Campus is nice.',
'alaskaPacific'),
(2, 16, 'It is not just flight school as many people think. Offers variety of other science field. It is not "party" school, academic is serious, you need to work for it. Cafeteria food is average, campus staff members are friendly and helpful. So come join my college, you will get great education for sure!',
 'embryRiddle'),
(3, 28, 'Being a student at the University of Southern California is like no other. The campus is beautiful and the academics are stellar. The whole school feels like one big family. The athletic programs are top notch and really bring all the students together. I love being able to attend countless games while seeing cheering fans who truly love where they go to school. The best part about the University of Southern California is the Trojan alumni. With over 425,000 Trojan alumni in the world, you are always connected to a Trojan. The wonderful Trojan alumni are there for you beyond your four years. They give opportunities to advance in your desired career field, as well as be there in a new environment. No other university is this connected between current students and alumni. I am proud to attend USC, where academics, athletics and alumni blend together making the ultimate college experience!',
 'USC1'),
(4, 28, 'I had an amazing experience at the University of Southern California! The professors are excellent teachers as well as world class researchers. You will be treated like family, The Trojan Family, and not like a number as many public schools in California treat their students. You will always experience professionalism and respect from administrators. In California, where disrespect and ego run rampant, USC represents a touch of class and elegance. After you step on campus, you will feel like you never want to leave!', 
	'USC2');


ALTER TABLE `review`
	ADD PRIMARY KEY (`review_id`);

ALTER TABLE `review`
	MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

ALTER TABLE `review`
	ADD CONSTRAINT `review_1` FOREIGN KEY(`school_id`) REFERENCES `school` (`school_id`);





















