-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 15 juin 2021 à 15:24
-- Version du serveur :  8.0.25-0ubuntu0.20.04.1
-- Version de PHP : 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `wild-series`
--

-- --------------------------------------------------------

--
-- Structure de la table `actor`
--

CREATE TABLE `actor` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actor`
--

INSERT INTO `actor` (`id`, `name`) VALUES
(1, 'Andrew Lincoln'),
(2, 'Norman Reedus'),
(3, 'Lauren Cohan'),
(4, 'Danai Gurira'),
(5, 'Jim Parsons'),
(6, 'Kaley Cuoco');

-- --------------------------------------------------------

--
-- Structure de la table `actor_program`
--

CREATE TABLE `actor_program` (
  `actor_id` int NOT NULL,
  `program_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actor_program`
--

INSERT INTO `actor_program` (`actor_id`, `program_id`) VALUES
(1, 1),
(1, 6),
(2, 1),
(3, 1),
(4, 1),
(5, 7),
(6, 7);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Horreur'),
(2, 'Science Fiction'),
(3, 'Policier'),
(4, 'Comédie');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `episode`
--

CREATE TABLE `episode` (
  `id` int NOT NULL,
  `season_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `episode`
--

INSERT INTO `episode` (`id`, `season_id`, `title`, `number`, `summary`) VALUES
(1, 1, 'Unaired Pilot', 0, '\n    The first Pilot of what will become The Big Bang Theory. Leonard and Sheldon are two awkward scientists who share an apartment. They meet a drunk girl called Katie and invite her to stay at their place, because she has nowhere to stay. The two guys have a female friend, also a scientist, called Gilda.    '),
(2, 1, 'Pilot', 1, '\n    A pair of socially awkward theoretical physicists meet their new neighbor Penny, who is their polar opposite.    '),
(3, 1, 'The Big Bran Hypothesis', 2, '\n    Penny is furious with Leonard and Sheldon when they sneak into her apartment and clean it while she is sleeping.    '),
(4, 1, 'The Fuzzy Boots Corollary', 3, '\n    Leonard gets upset when he discovers that Penny is seeing a new guy, so he tries to trick her into going on a date with him.    '),
(5, 1, 'The Luminous Fish Effect', 4, '\n    Sheldon\'s mother is called to intervene when he delves into numerous obsessions after being fired for being disrespectful to his new boss.    '),
(6, 1, 'The Hamburger Postulate', 5, '\n    Leslie seduces Leonard, but afterwards tells him that she is only interested in a one-night stand.    '),
(7, 1, 'The Middle Earth Paradigm', 6, '\n    The guys are invited to Penny\'s Halloween party, where Leonard has yet another run-in with Penny\'s ex-boyfriend Kurt.    '),
(8, 1, 'The Dumpling Paradox', 7, '\n    When Howard hooks up with Penny\'s old friend, his absence in the gang causes problems for the rest of the guys.    '),
(9, 1, 'The Grasshopper Experiment', 8, '\n    When Raj\'s parents set him up on a blind date, he finds he can talk to women with the aid of alcohol.    '),
(10, 1, 'The Cooper-Hofstadter Polarization', 9, '\n    Leonard and Sheldon\'s friendship is put to the test when Leonard wants to present a paper they co-authored at a physics convention, but Sheldon doesn\'t.    '),
(11, 1, 'The Loobenfeld Decay', 10, '\n    Leonard lies to Penny so that he and Sheldon can get out of watching her perform. However, Sheldon believes that the lie has too many loose ends, so he comes up with a new, unnecessarily complex one to replace it.    '),
(12, 1, 'The Pancake Batter Anomaly', 11, '\n    When Sheldon gets sick, Leonard, Howard and Raj go AWOL, leaving a reluctant Penny to deal with him.    '),
(13, 1, 'The Jerusalem Duality', 12, '\n    Sheldon decides to give up his work and focus on other tasks when a 15-year-old prodigy joins the university, so the other guys come up with a plan to get rid of him.    '),
(14, 1, 'The Bat Jar Conjecture', 13, '\n    Sheldon becomes so intent on demonstrating his intellectual superiority over the other guys that they kick him off the Physics Bowl team and replace him with his nemesis, Leslie.    '),
(15, 1, 'The Nerdvana Annihilation', 14, '\n    Penny gets mad at the guys when their full scale model of a time machine causes her to miss work, which prompts Leonard to give up all of his nerd memorabilia.    '),
(16, 1, 'The Pork Chop Indeterminacy', 15, '\n    Leonard, Howard and Raj fight over Sheldon\'s twin sister when she arrives in town. Raj takes part in a drug trial to suppress his selective mutism.    '),
(17, 1, 'The Peanut Reaction', 16, '\n    When Penny learns that Leonard has never had a birthday party, she and the rest of the guys plan a surprise party for him.    '),
(18, 1, 'The Tangerine Factor', 17, '\n    After a bad breakup, Penny finally agrees to go out on a date with Leonard, however they both develop doubts and turn to Sheldon for advice.    '),
(19, 2, 'The Bad Fish Paradigm', 1, '\n    Leonard becomes concerned when his date with Penny ends abruptly and she starts blowing him off. When told the truth, Sheldon would rather move out than keep Penny\'s reasons a secret from Leonard.    '),
(20, 2, 'The Codpiece Topology', 2, '\n    Sheldon is annoyed when Leonard turns to Leslie for comfort after seeing Penny with another guy.    '),
(21, 2, 'The Barbarian Sublimation', 3, '\n    Sheldon introduces Penny to online gaming, however she refuses to quit after becoming addicted.    '),
(22, 2, 'The Griffin Equivalency', 4, '\n    The guys struggle to cope with Raj\'s arrogance after he is featured in a People magazine article.    '),
(23, 2, 'The Euclid Alternative', 5, '\n    Sheldon annoys the gang when Leonard can\'t drive him to and from work, so they try to teach him how to drive.    '),
(24, 2, 'The Cooper-Nowitzki Theorem', 6, '\n    Sheldon is flattered when a graduate student takes a shine to him, however her extreme devotion becomes too much to handle.    '),
(25, 2, 'The Panty Piñata Polarization', 7, '\n    Penny plans revenge when Sheldon bans her from his and Leonards apartment, while Howard and Raj use the latest technology to try to find the house being used in America\'s Next Top Model.'),
(26, 2, 'The Lizard-Spock Expansion', 8, '\n    Leonard and Howard\'s friendship is jeopardised when Leonard steals a girl from Howard.    '),
(27, 2, 'The White Asparagus Triangulation', 9, '\n    Sheldon believes that Leonard will wreck his relationship with Stephanie, so he decides to take matters into his own hands.    '),
(28, 2, 'The Vartabedian Conundrum', 10, '\n    Leonard tries to slow down his relationship with Stephanie when he realizes that they are living together, while Sheldon becomes convinced that he has an untraceable disease.    '),
(29, 2, 'The Bath Item Gift Hypothesis', 11, '\n    Leonard is disappointed when Penny develops an interest in an attractive physicist at the university. Meanwhile, Sheldon struggles to find an appropriate Christmas gift for Penny.    '),
(30, 2, 'The Killer Robot Instability', 12, '\n    Howard becomes depressed after Penny makes a cruel statement about his love life, while the rest of the guys prepare for a grudge killer robot duel against an obnoxious colleague at the university.    '),
(31, 2, 'The Friendship Algorithm', 13, '\n    Sheldon tries to make friends with Kripke in the hope that it will get him access to a coveted computer at the university.    '),
(32, 2, 'The Financial Permeability', 14, '\n    Leonard and Sheldon try to help out Penny when she can\'t afford to pay her rent.    '),
(33, 2, 'The Maternal Capacitance', 15, '\n    Sheldon hits it off with Leonard\'s psychoanalyst mother, but she drives Leonard and Penny to the bottle.    '),
(34, 2, 'The Cushion Saturation', 16, '\n    Howard hooks up with Leslie, while Penny accidentally ruins Sheldon\'s spot on the couch.    '),
(35, 2, 'The Terminator Decoupling', 17, '\n    On a train to San Francisco, Howard, Raj and Leonard fight for the affections of sci-fi star Summer Glau, while Sheldon is forced to turn to Penny for help when he leaves his flash drive behind.    '),
(36, 2, 'The Work Song Nanocluster', 18, '\n    Sheldon\'s assistance with Penny\'s home-based business leads to chaos.    '),
(37, 2, 'The Dead Hooker Juxtaposition', 19, '\n    Penny becomes jealous when a gorgeous new neighbor attracts the guys\' attention.    '),
(38, 2, 'The Hofstadter Isotope', 20, '\n    Leonard is upset when the owner of the comic book store goes on a date with Penny, so he convinces Howard and Raj to take him to a bar so that he can pick up a woman of his own.    '),
(39, 2, 'The Vegas Renormalization', 21, '\n    After being dumped by Leslie, Howard heads to Las Vegas with Leonard and Raj. Meanwhile, Penny is forced to take in Sheldon after he locks himself out of his apartment.    '),
(40, 2, 'The Classified Materials Turbulence', 22, '\n    Penny\'s second date with Stuart has significant implications for Leonard. Howard enlists the guys\' help with one of his NASA projects.    '),
(41, 2, 'The Monopolar Expedition', 23, '\n    Penny gets upset when she finds out Leonard and the guys plan to work at the North Pole for the summer.    '),
(42, 3, 'The Electric Can Opener Fluctuation', 1, '\n    After returning from the North Pole, a conflict among the guys sends Sheldon back to Texas and interferes with Leonard\'s reunion with Penny.    '),
(43, 3, 'The Jiminy Conjecture', 2, '\n    Leonard and Penny\'s first night together goes awkwardly. Sheldon and Howard wager on the species of a cricket.    '),
(44, 3, 'The Gothowitz Deviation', 3, '\n    Sheldon attempts to covertly alter Penny\'s habits, while Howard and Raj try their luck meeting women at a Goth-style club.    '),
(45, 3, 'The Pirate Solution', 4, '\n    When Raj has to find a new job or be sent back to India, Sheldon\'s solution leaves Leonard and Penny dealing with Howard as the third wheel.    '),
(46, 3, 'The Creepy Candy Coating Corollary', 5, '\n    Leonard is forced to ask Penny to set Howard up with one of her friends, while Sheldon seeks payback against sci-fi star Wil Wheaton.    '),
(47, 3, 'The Cornhusker Vortex', 6, '\n    Leonard tries to learn about football to fit in with Penny\'s friends. Meanwhile, a loss in a kite war threatens to end Raj and Howard\'s friendship.    '),
(48, 3, 'The Guitarist Amplification', 7, '\n    Sheldon is caught in the middle when Leonard and Penny argue about Penny\'s friend staying at her apartment.    '),
(49, 3, 'The Adhesive Duck Deficiency', 8, '\n    Penny is forced to turn to Sheldon for help when she dislocates her shoulder in the bathtub. Meanwhile, the rest of the guys accidentally get stoned in the desert while waiting for a meteor shower.    '),
(50, 3, 'The Vengeance Formulation', 9, '\n    Sheldon plans revenge after Kripke humiliates him on the radio. Howard develops doubts about his relationship with Bernadette.    '),
(51, 3, 'The Gorilla Experiment', 10, '\n    Sheldon attempts to help Penny understand physics to impress Leonard, while Howard becomes jealous when Bernadette takes an interest in Leonard\'s research.    '),
(52, 3, 'The Maternal Congruence', 11, '\n    Leonard\'s mother makes a visit to his dismay and Sheldon\'s delight.    '),
(53, 3, 'The Psychic Vortex', 12, '\n    Raj talks Sheldon into being his wingman at a university mixer. Leonard has trouble dealing with Penny consulting a psychic.    '),
(54, 3, 'The Bozeman Reaction', 13, '\n    When their apartment is robbed, Leonard and Sheldon turn to Howard and Raj to create a state-of-the-art security system.    '),
(55, 3, 'The Einstein Approximation', 14, '\n    Sheldon wreaks havoc when he is stumped by a difficult physics question.    '),
(56, 3, 'The Large Hadron Collision', 15, '\n    When Leonard is offered a trip to Switzerland on Valentine\'s Day to visit the CERN laboratory, Sheldon uses any and all means to be his guest instead of Penny.    '),
(57, 3, 'The Excelsior Acquisition', 16, '\n    Sheldon misses an opportunity to get Stan Lee\'s autograph because he has to make an appearance in traffic court.    '),
(58, 3, 'The Precious Fragmentation', 17, '\n    The guys\' friendship is threatened when they find a ring from the Lord of the Rings trilogy.    '),
(59, 3, 'The Pants Alternative', 18, '\n    Sheldon seeks help from the rest of the gang in overcoming his fear of public speaking when he receives an award.    '),
(60, 3, 'The Wheaton Recurrence', 19, '\n    Sheldon takes on Wil Wheaton in a game of bowling. Leonard and Penny\'s relationship comes to a crossroad.    '),
(61, 3, 'The Spaghetti Catalyst', 20, '\n    Sheldon is forced to go behind Leonard\'s back to spend time with Penny following their breakup.    '),
(62, 3, 'The Plimpton Stimulation', 21, '\n    Chaos ensues when a nymphomaniac physicist visiting Sheldon hooks up with Leonard.    '),
(63, 3, 'The Staircase Implementation', 22, '\n    Leonard tells Penny about how he and Sheldon became roommates and what happened to the elevator.    '),
(64, 3, 'The Lunar Excitation', 23, '\n    Penny has a night of angry, drunken sex with Leonard, much to his confusion. Meanwhile, Howard and Raj search for Sheldon\'s perfect match online.    '),
(65, 4, 'The Robotic Manipulation', 1, '\n    Penny ends up tagging along on Sheldon\'s first ever date with Amy, while Howard finds an unusual use for a robotic arm.    '),
(66, 4, 'The Cruciferous Vegetable Amplification', 2, '\n    When Sheldon calculates the technology to download his consciousness into a robot won\'t be invented soon enough, he desperately tries to find a way to increase his lifespan.    '),
(67, 4, 'The Zazzy Substitution', 3, '\n    Following his \'breakup\' with Amy, the gang become concerned with Sheldon\'s obsessive search for non-human companionship and call his mother to intervene.    '),
(68, 4, 'The Hot Troll Deviation', 4, '\n    Howard tries to get Penny\'s help in winning back Bernadette, but first has to confess the embarrassing reason why they broke up in the first place. Raj and Sheldon clash over a desk.    '),
(69, 4, 'The Desperation Emanation', 5, '\n    Sheldon is scared that he is in a relationship when Amy asks him to meet her mother, and Leonard asks Howard and Bernadette to set him up because he is the only person in the group without a girlfriend.    '),
(70, 4, 'The Irish Pub Formulation', 6, '\n    Leonard tries to keep everyone from finding out that he spent the night with Raj\'s sister, but Sheldon finds out and concocts an elaborate story to help him keep the secret from Raj.    '),
(71, 4, 'The Apology Insufficiency', 7, '\n    An FBI agent interviews the guys when Howard needs to obtain a security clearance.    '),
(72, 4, 'The 21-Second Excitation', 8, '\n    The guys camp out all night waiting to see an extended cut of Indiana Jones, while Amy joins in on girls\' night with Penny and Bernadette.    '),
(73, 4, 'The Boyfriend Complexity', 9, '\n    Penny asks Leonard to pose as her boyfriend when her father visits. Howard, Raj and Bernadette have an awkward encounter when they spend the evening together.    '),
(74, 4, 'The Alien Parasite Hypothesis', 10, '\n    Amy finds she has sexual feelings for Penny\'s ex-boyfriend Zack, while Raj and Howard try to prove who would be the better superhero.    '),
(75, 4, 'The Justice League Recombination', 11, '\n    The guys enter a costume contest as members of the Justice League and convince Penny and Zack to join them.    '),
(76, 4, 'The Bus Pants Utilization', 12, '\n    Leonard has an idea for a new smartphone app and asks the guys for help, however Sheldon tries to take over the project, and Leonard fires him.    '),
(77, 4, 'The Love Car Displacement', 13, '\n    Chaos ensues when the gang spend the weekend together at a science convention.    '),
(78, 4, 'The Thespian Catalyst', 14, '\n    To improve his skills as an instructor, Sheldon asks Penny to give him acting lessons. Meanwhile, Raj begins having impure fantasies about Bernadette.    '),
(79, 4, 'The Benefactor Factor', 15, '\n    To secure needed funding for the university, Sheldon convinces Leonard to get friendly with a wealthy benefactor.    '),
(80, 4, 'The Cohabitation Formulation', 16, '\n    Bernadette makes Howard choose between herself and his mother, while Penny and Raj become upset when Priya returns to town and resumes her relationship with Leonard.    '),
(81, 4, 'The Toast Derivation', 17, '\n    Sheldon becomes concerned when everybody begins to hang out at Raj\'s apartment and discovers Leonard is the center of the group.    '),
(82, 4, 'The Prestidigitation Approximation', 18, '\n    Priya forces Leonard to choose between a relationship with her or a friendship with Penny. A magic trick by Howard has Sheldon fooled.    '),
(83, 4, 'The Zarnecki Incursion', 19, '\n    The guys go all out to help Sheldon find the person responsible for hacking his online gaming account, while the girls\' hatred for Priya increases.    '),
(84, 4, 'The Herb Garden Germination', 20, '\n    Sheldon and Amy secretly experiment on the gang by spreading rumors when they hear that Bernadette is thinking about breaking up with Howard.    '),
(85, 4, 'The Agreement Dissection', 21, '\n    When Priya finds a loophole in the roommate agreement to throw Sheldon out for the night, Penny, Amy and Bernadette take him to a nightclub.    '),
(86, 4, 'The Wildebeest Implementation', 22, '\n    Sheldon invents a three-player chess game, Penny and Amy use Bernadette to spy on Leonard and Priya, and Raj tries a new drug to treat his social anxiety.    '),
(87, 4, 'The Engagement Reaction', 23, '\n    Howard believes that his mom suffered a heart attack because he told her that he\'s marrying Bernadette, Sheldon freaks out over germs, and Penny and Priya compare notes on Leonard.    '),
(88, 4, 'The Roommate Transmogrification', 24, '\n    Raj moves in with Sheldon after hearing Leonard and Priya engage in a Star Trek fantasy in his apartment. Bernadette receives her doctorate.    '),
(89, 5, 'The Skank Reflex Analysis', 1, '\n    The gang deal with the fallout from Penny and Raj\'s night together.    '),
(90, 5, 'The Infestation Hypothesis', 2, '\n    Amy gets inadvertently caught in the middle of a fight between Sheldon and Penny over a chair. Leonard tries to add some spice to his long-distance relationship with Priya.    '),
(91, 5, 'The Pulled Groin Extrapolation', 3, '\n    Leonard accompanies Amy to a colleague\'s wedding. Howard tries to convince Bernadette to live with his mother after they get married.    '),
(92, 5, 'The Wiggly Finger Catalyst', 4, '\n    Penny sets up Raj with a deaf friend, not knowing that she\'s actually a gold digger, and Sheldon decides to let his minor decisions rest on the roll of the dice.    '),
(93, 5, 'The Russian Rocket Reaction', 5, '\n    Sheldon takes offense when Leonard wants to attend a party with Wil Wheaton, while Bernadette tries to block Howard\'s opportunity to go into outer space.    '),
(94, 5, 'The Rhinitis Revelation', 6, '\n    Sheldon gets upset when his mother comes to visit but refuses to cook for him and attend physics lectures.    '),
(95, 5, 'The Good Guy Fluctuation', 7, '\n    Sheldon tries to get into the spirit of Halloween by trying to scare the guys after they prank him. Leonard seeks Penny\'s advice when an attractive comic book artist takes an interest in him.    '),
(96, 5, 'The Isolation Permutation', 8, '\n    Amy is hurt when Penny and Bernadette go bridesmaid dress shopping without her, so she turns to a reluctant Sheldon for comfort.    '),
(97, 5, 'The Ornithophobia Diffusion', 9, '\n    Sheldon tries to overcome his fear of birds, while Leonard and Penny attempt to hang out together strictly as friends.    '),
(98, 5, 'The Flaming Spittoon Acquisition', 10, '\n    When Stuart asks Amy on a date, Sheldon considers having a more serious relationship with her. Meanwhile, the guys become obsessed with a new card game involving Wild West heroes and witches.    '),
(99, 5, 'The Speckerman Recurrence', 11, '\n    Leonard confronts the man who bullied him in high school, while Penny realizes she did her fair share of tormenting in the past.    '),
(100, 5, 'The Shiny Trinket Maneuver', 12, '\n    Penny helps Sheldon work on his relationship with Amy when he trivializes one of her accomplishments. Howard is irked by Bernadette\'s dislike of children.    '),
(101, 5, 'The Recombination Hypothesis', 13, '\n    Leonard and Penny contemplate reviving their romantic relationship.    '),
(102, 5, 'The Beta Test Initiation', 14, '\n    Leonard and Penny develop a system to ensure their dates go smoothly. Raj finally finds a woman he can talk to - the virtual assistant on his mobile phone.    '),
(103, 5, 'The Friendship Contraction', 15, '\n    Leonard signs out of his roommate agreement, reducing himself and Sheldon to mere acquaintances, while Howard tries to think of a cool astronaut nickname for himself.    '),
(104, 5, 'The Vacation Solution', 16, '\n    When the university forces Sheldon to use vacation days, he decides to hang out in Amy\'s lab. Howard becomes upset when he hears Bernadette wants him to sign a prenuptial agreement.    '),
(105, 5, 'The Rothman Disintegration', 17, '\n    Sheldon battles Kripke for a coveted office at the university. Penny receives a very unusual gift from Amy.    '),
(106, 5, 'The Werewolf Transformation', 18, '\n    Sheldon wreaks havoc when he tries to get a haircut from his regular barber, who is ill. Howard runs into a few problems with astronaut training.    '),
(107, 5, 'The Weekend Vortex', 19, '\n    Sheldon has to choose between joining Amy at her aunt\'s birthday party or playing videogames all weekend with the guys.    '),
(108, 5, 'The Transporter Malfunction', 20, '\n    Raj gets quite a surprise when he asks his parents to set him up on a date. Penny buys Leonard and Sheldon a pair of Star Trek keepsake collectibles.    '),
(109, 5, 'The Hawking Excitation', 21, '\n    Sheldon uses any and all means to meet his hero, Dr. Stephen Hawking.    '),
(110, 5, 'The Stag Convergence', 22, '\n    The guys throw Howard a bachelor party, and some embarrassing details about his life get posted on the Internet.    '),
(111, 5, 'The Launch Acceleration', 23, '\n    NASA cancel, and later reinstate Howard\'s mission into space, coinciding with his wedding. Leonard inadvertently jeopardizes his relationship with Penny.    '),
(112, 5, 'The Countdown Reflection', 24, '\n    As Howard prepares for his mission into space, flashbacks show the recent events leading up to his and Bernadette\'s wedding.    '),
(113, 6, 'The Date Night Variable', 1, '\n    Raj crashes Sheldon and Amy\'s second anniversary and interferes in Leonard and Penny\'s relationship. Howard gets caught in the middle of an argument between Bernadette and his mother.    '),
(114, 6, 'The Decoupling Fluctuation', 2, '\n    Penny continues to have doubts about her relationship with Leonard. Meanwhile, Howard becomes the target of practical jokes on the space station.    '),
(115, 6, 'The Higgs Boson Observation', 3, '\n    When Sheldon hires a female grad student to assist him, a jealous Amy asks Penny to help her spy on them. On the space station, Howard begins behaving erratically.    '),
(116, 6, 'The Re-Entry Minimization', 4, '\n    Howard is offended when his return from space is met with little fanfare. Penny and Amy take on Sheldon and Leonard during game night.    '),
(117, 6, 'The Holographic Excitation', 5, '\n    While Raj plans Stuart\'s Halloween party at the comic book store, Howard annoys the rest of the gang by constantly talking about space, and Penny tries to take more of an interest in Leonard\'s work.    '),
(118, 6, 'The Extract Obliteration', 6, '\n    Penny enrolls in a college class and keeps it a secret from Leonard. Sheldon causes conflict with Dr. Stephen Hawking over an online game.    '),
(119, 6, 'The Habitation Configuration', 7, '\n    Howard makes a decision whether or not to move out of his mother\'s house, while Sheldon is caught in the middle of an argument between Amy and Wil Wheaton.    '),
(120, 6, 'The 43 Peculiarity', 8, '\n    Leonard feels threatened after hearing about Penny\'s study partner at school, while Howard and Raj become determined to find out one of Sheldon\'s secrets.    '),
(121, 6, 'The Parking Spot Escalation', 9, '\n    The gang are drawn into a fight between Howard and Sheldon over Sheldon\'s vacant parking spot at the university.    '),
(122, 6, 'The Fish Guts Displacement', 10, '\n    Howard tries to bond with Bernadette\'s father during a fishing trip. When Sheldon is obligated to take care of a sick Amy, she finds ways to take advantage of the situation.    '),
(123, 6, 'The Santa Simulation', 11, '\n    The girls take Raj out to a nightclub to find him a date. A game of Dungeons and Dragons rekindle old memories of Santa for Sheldon.    '),
(124, 6, 'The Egg Salad Equivalency', 12, '\n    When Penny finds out Alex has a crush on Leonard, Sheldon gets himself and the rest of the guys in trouble with Human Resources whilst trying to solve the problem.    '),
(125, 6, 'The Bakersfield Expedition', 13, '\n    The guys are stranded in the middle of nowhere when Leonard\'s car is stolen on the way to the Bakersfield Comic-Con. Back home, the girls try to figure out why the guys are so fascinated with comic books.    '),
(126, 6, 'The Cooper/Kripke Inversion', 14, '\n    Sheldon is forced to work with Kripke on a project and must concoct an elaborate lie when he can\'t hold up his end of the work. Howard and Raj get superhero figurines made of themselves.    '),
(127, 6, 'The Spoiler Alert Segmentation', 15, '\n    Leonard moves in with Penny after a fight with Sheldon, which causes Amy to want to move in with Sheldon. Meanwhile, Raj has a frightening experience with Howard\'s mother.    '),
(128, 6, 'The Tangible Affection Proof', 16, '\n    Sheldon gets Alex to buy a Valentine\'s Day gift for Amy. Leonard, Penny, Howard and Bernadette have a disastrous dinner together. Raj and Stuart host a \'Lonely People party\' at the comic book store.    '),
(129, 6, 'The Monster Isolation', 17, '\n    Raj falls apart after his date sneaks out on him, and Sheldon reluctantly returns the favor after Penny helps him out with his \'Fun With Flags\' program.    '),
(130, 6, 'The Contractual Obligation Implementation', 18, '\n    Leonard, Sheldon and Howard give lectures on science to junior high students. The girls ditch work to go to Disneyland. Raj devises a date for Lucy that fixes their social anxiety problems.    '),
(131, 6, 'The Closet Reconfiguration', 19, '\n    Howard becomes upset when Sheldon finds a letter from his estranged father whilst cleaning out his and Bernadette\'s closet.    '),
(132, 6, 'The Tenure Turbulence', 20, '\n    Leonard, Sheldon, Raj and Kripke battle for tenure at the university.    '),
(133, 6, 'The Closure Alternative', 21, '\n    Amy tries to help a depressed Sheldon find closure when one of his favorite TV shows is canceled. Raj becomes paranoid when he finds Lucy\'s blog.    '),
(134, 6, 'The Proton Resurgence', 22, '\n    Bernadette and Howard offer to watch Raj\'s dog and live to regret it. Leonard and Sheldon hire their favorite childhood star to make an appearance.    '),
(135, 6, 'The Love Spell Potential', 23, '\n    A date between Raj and Lucy takes both of them out of their comfort zones. After a trip to Las Vegas goes awry, the girls join in on a Dungeons and Dragons game, which causes Amy and Sheldon to re-evaluate their relationship.    '),
(136, 6, 'The Bon Voyage Reaction', 24, '\n    Penny is thrown for a loop when Leonard is offered a job overseas, but the news is an even bigger shock to Sheldon. Raj and Lucy\'s relationship comes to a crossroad.    '),
(137, 7, 'The Hofstadter Insufficiency', 1, '\n    Sheldon and Penny bond over missing Leonard. Howard tries to help Raj get over his breakup with Lucy. Amy and Bernadette take a trip together to a biology convention.    '),
(138, 7, 'The Deception Verification', 2, '\n    Sheldon feels betrayed when Leonard returns from the North Sea and wants to spend his time with Penny instead of him. Howard\'s latest foray into helping his mother has some disastrous side effects.    '),
(139, 7, 'The Scavenger Vortex', 3, '\n    The gang get competitive when they are forced to take part in Raj\'s scavenger hunt.    '),
(140, 7, 'The Raiders Minimization', 4, '\n    Sheldon gets mad at Amy for ruining one of his favorite movies, Raj and Stuart try to make their online dating profiles more appealing, and Leonard tries to play the sympathy card with Penny.    '),
(141, 7, 'The Workplace Proximity', 5, '\n    After a fight with Bernadette, Howard ends up on Raj\'s couch. Sheldon and Amy clash when Amy takes a job at the university.    '),
(142, 7, 'The Romance Resonance', 6, '\n    Howard plans something special to celebrate the anniversary of his first date with Bernadette. Sheldon is conflicted when he makes a major scientific breakthrough but some details have to be corrected.    '),
(143, 7, 'The Proton Displacement', 7, '\n    Sheldon seeks payback when Arthur \'Professor Proton\' Jeffries asks Leonard for help on a project instead of him. Raj gets upset at Howard for crashing his night with the girls.    '),
(144, 7, 'The Itchy Brain Simulation', 8, '\n    Sheldon demands Leonard make up for a mistake from their past. Penny confronts Raj\'s ex-girlfriend, Lucy.    '),
(145, 7, 'The Thanksgiving Decoupling', 9, '\n    The gang spend Thanksgiving at Mrs. Wolowitz\'s house. Howard tries to bond with his father-in-law, and a mistake from Penny\'s past comes back to haunt her.    '),
(146, 7, 'The Discovery Dissipation', 10, '\n    Leonard has to deal with the fallout of disproving Sheldon\'s new scientific discovery. Raj spends a week at Howard and Bernadette\'s apartment.    '),
(147, 7, 'The Cooper Extraction', 11, '\n    While Sheldon is at home in Texas, the rest of the gang decorate for Christmas and think about how much he has affected their lives.    '),
(148, 7, 'The Hesitation Ramification', 12, '\n    After Leonard tries to help Penny following a failed role on a TV show, she makes an important decision. Meanwhile, Raj and Stuart try to practice their social skills, and Sheldon navigates the intricacies of being funny.    '),
(149, 7, 'The Occupation Recalibration', 13, '\n    Sheldon tries to relax after he is forced to take a vacation. Leonard struggles to be supportive of Penny after she quits her job. Amy receives unwanted attention from a co-worker. Bernadette seeks Stuart\'s help in replacing one of Howard\'s comic books.    '),
(150, 7, 'The Convention Conundrum', 14, '\n    When the guys can\'t get hold of any Comic-Con tickets, Sheldon tries to hold his own convention and ends up spending a wild night with James Earl Jones. Meanwhile, the girls try to feel more mature by going to a fancy hotel for tea.    '),
(151, 7, 'The Locomotive Manipulation', 15, '\n    Sheldon and Amy take a train ride to Napa Valley with Howard and Bernadette on Valentine\'s Day. Leonard and Penny take Raj\'s dog to the vet when she accidentally eats some chocolate.    '),
(152, 7, 'The Table Polarization', 16, '\n    Leonard\'s purchase of a dining room table causes Sheldon to reevaluate the changes in his life. Meanwhile, Howard is offered a chance to go back to space and Bernadette struggles with whether or not to encourage him.    '),
(153, 7, 'The Friendship Turbulence', 17, '\n    After arguing with Sheldon, Howard tries to make amends by taking him to NASA headquarters in Houston. Penny has second thoughts about quitting her waitressing job when her car dies. Amy gets involved in trying to find Raj a date.    '),
(154, 7, 'The Mommy Observation', 18, '\n    When Sheldon visits his mother in Houston, he is forced to confront a new reality. Back in Pasadena, the rest of the gang reluctantly take part in Raj\'s Murder Mystery party.    '),
(155, 7, 'The Indecision Amalgamation', 19, '\n    While Raj is wracked with guilt when he tries to date Lucy and Emily at the same time, Penny wrestles with whether to take a role in a cheesy movie and Sheldon is torn trying to choose between two gaming systems.    '),
(156, 7, 'The Relationship Diremption', 20, '\n    Penny tries to help Sheldon when he reconsiders his \'relationship\' with String Theory. During a dinner with Howard and Bernadette, Raj discovers Howard once embarrassed himself on a date with Emily.    '),
(157, 7, 'The Anything Can Happen Recurrence', 21, '\n    When Sheldon tries to be spontaneous, it leads to unexpected friction between the girls. Meanwhile, Raj seeks Howard\'s help in preparing for a date with Emily.    '),
(158, 7, 'The Proton Transmogrification', 22, '\n    As the gang celebrate Star Wars Day, Sheldon has difficulty dealing with the recent death of Arthur \'Professor Proton\' Jeffries.    '),
(159, 7, 'The Gorilla Dissolution', 23, '\n    Penny gets fired from her movie and takes a serious look at her life. Raj sees Emily on a date with another man at the movies. Howard and Bernadette have to take care of his mother after she breaks her leg.    '),
(160, 7, 'The Status Quo Combustion', 24, '\n    Sheldon gets upset about his career, the destruction of the comic book store and Leonard and Penny\'s future living arrangements. Howard and Bernadette struggle to keep hold of a caregiver for Mrs. Wolowitz.    '),
(161, 8, 'The Locomotion Interruption', 1, '\n    Sheldon\'s trip comes to an end when he is robbed, Penny interviews for a job at Bernadette\'s company, and Howard is weirded out by his mother\'s relationship with Stuart.    '),
(162, 8, 'The Junior Professor Solution', 2, '\n    Sheldon is forced to teach a class as a Junior Professor. Meanwhile, Amy plays both sides when tension arises between Penny and Bernadette.    '),
(163, 8, 'The First Pitch Insufficiency', 3, '\n    Howard becomes nervous after NASA asks him to throw out the first pitch at a Los Angeles Angels game. Meanwhile, Leonard and Penny try to prove Sheldon wrong when he says that he and Amy have a \'superior\' relationship.    '),
(164, 8, 'The Hook-up Reverberation', 4, '\n    Raj\'s honesty about his past comes back to haunt him after Emily takes a dislike to Penny. Meanwhile, the guys consider investing in the comic book store.    '),
(165, 8, 'The Focus Attenuation', 5, '\n    The girls head to Las Vegas, while the guys try to invent something cool, but only come up with new ways to procrastinate.    '),
(166, 8, 'The Expedition Approximation', 6, '\n    Sheldon and Raj test whether they could survive a dark-matter research expedition in a salt mine by simulating the conditions in a steam tunnel. Meanwhile, Leonard and Penny seek advice from Howard and Bernadette when they argue about money.    '),
(167, 8, 'The Misinterpretation Agitation', 7, '\n    The guys befriend one of Penny\'s clients when he shows up at her apartment. Meanwhile, Bernadette gets upset when Amy torpedoes an article about her for a local magazine.    '),
(168, 8, 'The Prom Equivalency', 8, '\n    The girls decide to re-enact their high school proms with the guys. While Sheldon feels under pressure to commit to his relationship with Amy, Howard worries about who Stuart will bring as his date.    '),
(169, 8, 'The Septum Deviation', 9, '\n    Sheldon panics when Leonard announces he has to go into the hospital for surgery. Raj discovers his parents have divorced.    '),
(170, 8, 'The Champagne Reflection', 10, '\n    While Sheldon retires \'Fun With Flags\', Leonard, Howard and Raj look for something significant in a dead professor\'s research, and Bernadette finds out what her colleagues really think of her.    '),
(171, 8, 'The Clean Room Infiltration', 11, '\n    Amy hosts a traditional Victorian Christmas Eve dinner as Raj\'s father comes to visit, while the guys try to shoo out a bird they let into the university clean room.    '),
(172, 8, 'The Space Probe Disintegration', 12, '\n    Raj worries a probe he designed will not work in outer space, while Leonard and Sheldon go shopping with Penny and Amy.    '),
(173, 8, 'The Anxiety Optimization', 13, '\n    When Sheldon becomes stuck in a rut with his work, the gang try to help him by raising his stress levels. Howard teases Raj with a game called \'Emily or Cinnamon.\'    '),
(174, 8, 'The Troll Manifestation', 14, '\n    Leonard and Sheldon defend themselves against criticism from an online bully, while the girls confront embarrassing moments from their pasts.    '),
(175, 8, 'The Comic Book Store Regeneration', 15, '\n    Howard receives some shocking news as everyone prepares for the re-opening of the comic book store. Meanwhile, Penny tries to teach Sheldon how to \'let it go,\' but can\'t follow her own advice when she learns something infuriating about Amy.    '),
(176, 8, 'The Intimacy Acceleration', 16, '\n    Sheldon and Penny agree to participate in an unusual experiment. Leonard, Amy, Raj and Emily spend the evening trying to escape a room with a \'zombie\'. Howard and Bernadette run into trouble at the airport after returning from Mrs. Wolowitz\'s funeral.    '),
(177, 8, 'The Colonization Application', 17, '\n    A trip to the pet store ends in a fight after Amy learns Sheldon has applied for a one-way mission to colonize Mars. Meanwhile, Leonard surprises Penny with a very \'adult\' purchase, and Raj gets into trouble when he snoops around Emily\'s apartment.    '),
(178, 8, 'The Leftover Thermalization', 18, '\n    Tension arises when a magazine fails to mention Leonard in an article about the paper he co-wrote with Sheldon, and a blackout at Mrs. Wolowitz\'s home leads to a final family dinner in her honor.    '),
(179, 8, 'The Skywalker Incursion', 19, '\n    When Leonard and Sheldon are invited to speak at UC Berkeley, they take a detour to try and meet one of their idols. Meanwhile, while cleaning out Mrs. Wolowitz\'s house, a ping pong battle ensues when Howard and Bernadette argue over the fate of his TARDIS.    '),
(180, 8, 'The Fortification Implementation', 20, '\n    Howard meets the half-brother he never knew he had. Penny is invited to appear on Wil Wheaton\'s podcast.    '),
(181, 8, 'The Communication Deterioration', 21, '\n    When Raj is asked to create a message on the off chance a NASA mission discovers alien life, the guys fight over what he should do, while Penny contemplates returning to acting.    '),
(182, 8, 'The Graduation Transmission', 22, '\n    Howard questions his engineering abilities when he and Sheldon can\'t get a toy drone to fly. A cancelled flight nearly prevents Leonard from giving the commencement address at his former high school. Raj pits his parents against each other when his father cuts him off financially.    '),
(183, 8, 'The Maternal Combustion', 23, '\n    Personalities collide when Leonard and Sheldon\'s mothers meet for the first time. Bernadette reaches her limit with Howard and Stuart.    '),
(184, 8, 'The Commitment Determination', 24, '\n    As Sheldon presses Leonard and Penny to set a wedding date, he encounters major changes in his relationship with Amy. Meanwhile, Raj wonders if he should break up with Emily, and Howard and Bernadette struggle to ask Stuart to move out.    '),
(185, 9, 'The Matrimonial Momentum', 1, '\n    Penny struggles with Leonard\'s confession that he kissed another woman as they prepare to get married in Las Vegas. Meanwhile, Sheldon doesn\'t know what to do after Amy pushes pause on their relationship.    '),
(186, 9, 'The Separation Oscillation', 2, '\n    Leonard and Penny try to work through their marital issues. Meanwhile, Sheldon films a special episode of \'Fun with Flag\' after his breakup with Amy, and Bernadette feels guilty about withholding a secret from Penny.    '),
(187, 9, 'The Bachelor Party Corrosion', 3, '\n    The guys\'s skills are put to the test when they get a flat tire on the way to Mexico for Leonard\'s bachelor party. The girls throw Penny a mini-bachelorette party.    '),
(188, 9, 'The 2003 Approximation', 4, '\n    An impending change to his living arrangements inspires Sheldon to revert to 2003, before he met Penny and Leonard. Raj and Howard form a band for the comic book store.    '),
(189, 9, 'The Perspiration Implementation', 5, '\n    Kripke expresses interest in Amy while leading a fencing lesson for the guys. Meanwhile, Stuart seeks help from the girls in getting more women interested in the comic book store.    '),
(190, 9, 'The Helium Insufficiency', 6, '\n    Leonard and Sheldon go to great lengths to secure the helium they need during a nation-wide shortage. Meanwhile, the rest of the gang try to find Amy a new boyfriend on a dating app.    '),
(191, 9, 'The Spock Resonance', 7, '\n    While being interviewed for a documentary about Spock from Star Trek (1966), Sheldon struggles to suppress his emotions about his recent break-up from Amy. Meanwhile, Howard and Bernadette butt heads over renovating his mother\'s house.    '),
(192, 9, 'The Mystery Date Observation', 8, '\n    Sheldon, Howard and Raj post an ad online to find a new girlfriend for Sheldon. Penny and Bernadette decide to spy when Amy is secretive about who she is dating.    '),
(193, 9, 'The Platonic Permutation', 9, '\n    On Thanksgiving, Sheldon and Amy try to spend time together as friends and go to an aquarium, Howard reluctantly agrees to volunteer at the soup kitchen with Bernadette, Raj and Emily, and Penny discovers that Leonard knows more about her than she thought.    '),
(194, 9, 'The Earworm Reverberation', 10, '\n    Sheldon has a revelation when he realizes why a song was stuck in his head. Meanwhile, Amy invites Dave over for dinner despite their previously awkward date, and Howard and Raj become obsessed with a fan of their band.    '),
(195, 9, 'The Opening Night Excitation', 11, '\n    Leonard, Howard and Raj have to decide who will take their extra Star Wars movie ticket, while Sheldon plans something special for Amy\'s birthday.    '),
(196, 9, 'The Sales Call Sublimation', 12, '\n    Penny gets more than she bargained for when Leonard agrees to meet with a psychiatrist on her behalf to make a sale. Meanwhile, Sheldon and Raj collaborate on an astronomical discovery, and Howard and Bernadette\'s happiness is short-lived after Stuart moves out.    '),
(197, 9, 'The Empathy Optimization', 13, '\n    After being forced to deal with a sick Sheldon, the rest of the gang try to treat themselves to a Sheldon-free weekend.    '),
(198, 9, 'The Meemaw Materialization', 14, '\n    Sheldon is thrilled when his Meemaw comes to visit, but his excitement quickly fades when she butts heads with Amy. Meanwhile, Raj meets a girl at the comic book store who makes him question his relationship with Emily.    '),
(199, 9, 'The Valentino Submergence', 15, '\n    Sheldon and Amy host a Valentine\'s Day episode of \'Fun with Flags\', Leonard and Penny grapple with getting older, Howard and Bernadette find a surprise in their hot tub and Raj is torn between Emily and Claire.    '),
(200, 9, 'The Positive Negative Reaction', 16, '\n    Bernadette reveals her pregnancy to Howard and the rest of the gang.    '),
(201, 9, 'The Celebration Experimentation', 17, '\n    The gang convince Sheldon to celebrate his birthday and throw him a party.    '),
(202, 9, 'The Application Deterioration', 18, '\n    Leonard, Sheldon, and Howard run into problems when they file for a patent for their infinite persistence gyroscope. Meanwhile, the girls give Raj dating advice when Emily reaches out to him after their breakup.    '),
(203, 9, 'The Solder Excursion Diversion', 19, '\n    Amy is shocked at a revelation from Sheldon after she buys him a new laptop. Meanwhile, Raj sells out Leonard and Howard after they lie to their wives in order to attend an early screening of a movie.    '),
(204, 9, 'The Big Bear Precipitation', 20, '\n    Secrets are revealed when Amy and Sheldon join Penny and Leonard on a weekend cabin trip. Raj is more excited about Howard\'s and Bernadette\'s impending parenthood than they are.    '),
(205, 9, 'The Viewing Party Combustion', 21, '\n    The gang pick sides when a small argument between Leonard and Sheldon erupts into a heated fight during a \'Game of Thrones\' viewing party.    '),
(206, 9, 'The Fermentation Bifurcation', 22, '\n    Sheldon and Bernadette spend the evening together while the rest of the gang go to a wine tasting party, but things get uncomfortable for Raj when Penny\'s ex-boyfriend Zack shows up and takes an interest in Claire.    '),
(207, 9, 'The Line Substitution Solution', 23, '\n    Sheldon hires Stuart to spend the day with Amy when he would rather go to the movies. Meanwhile, Penny struggles to make a connection with Leonard\'s mother when she comes to visit.    '),
(208, 9, 'The Convergence Convergence', 24, '\n    Leonard and Penny try to have a wedding ceremony that everyone can attend, but it creates serious conflict among Sheldon\'s mother and Leonard\'s divorced parents. Meanwhile, Howard and Raj become convinced the government is out to get them.    '),
(209, 10, 'Recap', 0, '\n    A collection of some of last season\'s hilarious and most memorable moments.    '),
(210, 10, 'The Conjugal Conjecture', 1, '\n    As Leonard and Penny attempt to hold another wedding ceremony everyone can attend, they have to deal with Penny\'s family arriving and Leonard\'s father spending the night with Sheldon\'s mother.    '),
(211, 10, 'The Military Miniaturization', 2, '\n    Howard is visited by an Air Force colonel regarding his invention. Penny accidentally lets it slip about Bernadette\'s pregnancy to their co-workers.    '),
(212, 10, 'The Dependence Transcendence', 3, '\n    Bernadette confesses to Raj that she isn\'t sure if she\'s ready to be a mother, Penny accompanies Amy to a university mixer, and Sheldon goes to unusual extremes to assist Howard with his military project.    '),
(213, 10, 'The Cohabitation Experimentation', 4, '\n    When Amy must vacate her apartment for repairs, living arrangements are made with Leonard, Sheldon, and Penny. Howard and Bernadette don\'t want to know the sex of their baby, but Raj finds out.    '),
(214, 10, 'The Hot Tub Contamination', 5, '\n    Sheldon and Amy go through a period of adjustment with their new living arrangement. Howard and Bernadette are forced to vacation at home when she falls ill and keep it a secret, unaware Raj and Stuart planned to use their hot tub.    '),
(215, 10, 'The Fetal Kick Catalyst', 6, '\n    Sheldon and Amy host a brunch. Penny is surprised by her popularity when her movie, \'Serial Ape-Ist\' is featured at a Van Nuys comic book convention. Howard starts to freak out about parenthood after feeling the baby kick for the first time.    '),
(216, 10, 'The Veracity Elasticity', 7, '\n    Amy doesn\'t tell Sheldon her apartment has been repaired. Leonard finds out Penny is slowly moving all of his collectible toys into storage.    '),
(217, 10, 'The Brain Bowl Incubation', 8, '\n    A successful gene experimentation leaves Sheldon excited to procreate with Amy, and he pulls out all stops to get her on board. Meanwhile, Raj takes an interest in the cleaning lady at the university.    '),
(218, 10, 'The Geology Elevation', 9, '\n    Sheldon can\'t contain his jealousy when Bert wins a grant for his geology research. A distasteful toy built by Howard faces judgement from the gang.    '),
(219, 10, 'The Property Division Collision', 10, '\n    Dividing up their possessions becomes an all-out war between Leonard and Sheldon. Stuart asks to live with Howard and Bernadette and tries to supplant Raj\'s efforts to help with the new baby.    '),
(220, 10, 'The Birthday Synchronicity', 11, '\n    Amy\'s desire to have an intimate night with Sheldon on her birthday is interrupted by Bernadette going into labor.    '),
(221, 10, 'The Holiday Summation', 12, '\n    After spending the holidays apart, the gang get together to hear about Sheldon\'s and Amy\'s trip to Texas, Leonard\'s and Penny\'s Christmas tree adventure, and Howard\'s and Bernadette\'s first days as parents.    '),
(222, 10, 'The Romance Recalibration', 13, '\n    Leonard and Penny ask for Sheldon\'s and Amy\'s help on putting the romance back in their marriage. Howard and Raj go to extreme lengths to stop the floor in Halley\'s bedroom from making noise.    '),
(223, 10, 'The Emotion Detection Automation', 14, '\n    Penny wants to help her brother get a job with her company. Sheldon learns of a machine that will help him understand human emotions. Raj reunites some of his old girlfriends to figure out why he is still single.    '),
(224, 10, 'The Locomotion Reverberation', 15, '\n    Leonard and Howard\'s attempt to keep Sheldon away from their Air Force project by sending him on a train trip backfires. Penny and Amy take Bernadette for her first night out since having the baby.    '),
(225, 10, 'The Allowance Evaporation', 16, '\n    Sheldon and Amy have their first fight since moving in together. Meanwhile Raj is shocked at the reality of financial independence when he stops receiving support from his father.    '),
(226, 10, 'The Comic-Con Conundrum', 17, '\n    The guys\' annual trip to Comic Con is in doubt when Raj can\'t afford to go.    '),
(227, 10, 'The Escape Hatch Identification', 18, '\n    When the gang offer places for Raj to live, it creates unexpected conflict among everyone.    '),
(228, 10, 'The Collaboration Fluctuation', 19, '\n    Leonard, Penny and Raj adjust to their new living arrangements, Sheldon expresses an interest in Amy\'s work.    '),
(229, 10, 'The Recollection Dissipation', 20, '\n    Sheldon reaches his limit when he works on projects with Leonard, Howard and Amy in one day. Bernadette has doubts about leaving Halley when she goes back to work.    '),
(230, 10, 'The Separation Agitation', 21, '\n    Howard and Bernadette have a hard time leaving Halley in daycare when Bernadette returns to work. Bert introduces the gang to his new girlfriend.    '),
(231, 10, 'The Cognition Regeneration', 22, '\n    Leonard is less than thrilled when Penny considers accepting a job offer from her ex-boyfriend, Zack. Sheldon worries that he hasn\'t reached his full potential soon enough.    '),
(232, 10, 'The Gyroscopic Collapse', 23, '\n    After celebrating the completion of the top-secret Air Force project, Leonard, Sheldon and Howard get an unwelcome surprise, Amy receives an offer for a summer position at Princeton as a visiting researcher.    '),
(233, 10, 'The Long Distance Dissonance', 24, '\n    The gang become concerned when Sheldon\'s former admirer, Ramona Nowitzki, resurfaces while Amy is away at Princeton.    '),
(234, 11, 'The Proposal Proposal', 1, '\n    Amy has trouble deciding whether or not she should marry Sheldon. Meanwhile, Bernadette confides in Penny when she finds out some huge news.    '),
(235, 11, 'The Retraction Reaction', 2, '\n    Leonard angers the University and the Physics Community when he gives an embarrassing radio interview. Bernadette and Amy compare their successes at work.    '),
(236, 11, 'The Relaxation Integration', 3, '\n    Sheldon and Amy struggle with picking a wedding date. Meanwhile, Stuart and Raj fight over one of Bernadette\'s co-workers for a date.    '),
(237, 11, 'The Explosion Implosion', 4, '\n    Howard and Bernadette are disappointed when they find out the sex of the baby. Leonard is annoyed when his mother befriends Penny.    ');
INSERT INTO `episode` (`id`, `season_id`, `title`, `number`, `summary`) VALUES
(238, 11, 'The Collaboration Contamination', 5, '\n    Amy and Howard work in the lab together causing Sheldon, Bernadette and Raj to feel jealous and lonely. Penny starts using a parenting book to control Sheldon\'s behavior.    '),
(239, 11, 'The Proton Regeneration', 6, '\n    Sheldon and Wil Wheaton both go head-to-head for the role of the new Professor Proton, Meanwhile Penny takes care of Halley when Bernadette and Howard are on bed rest.    '),
(240, 11, 'The Geology Methodology', 7, '\n    When Bert asks Sheldon to collaborate on a project with him, Sheldon becomes worried about others finding out because he thinks geology is beneath him. Raj seeks advice after reconnecting with Ruchi.    '),
(241, 11, 'The Tesla Recoil', 8, '\n    Howard and Leonard become upset after they discover that Sheldon has been working with the military without telling them, Bernadette asks Raj to investigate her suspicions that Ruchi is attempting to take her job away from her.    '),
(242, 11, 'The Bitcoin Entanglement', 9, '\n    Sheldon tries to teach the other guys a lesson after they cut him out of a potentially valuable Bitcoin investment seven years ago.    '),
(243, 11, 'The Confidence Erosion', 10, '\n    Sheldon and Amy try to eliminate stress from wedding planning by applying math to the process. Raj and Howard come to blows when Raj begins to feel like Howard hurts his confidence.    '),
(244, 11, 'The Celebration Reverberation', 11, '\n    Raj and Howard\'s feud continues as the gang plan Halley\'s first birthday party. Sheldon\'s surprise for Amy\'s birthday goes awry when they get food poisoning.    '),
(245, 11, 'The Matrimonial Metric', 12, '\n    Sheldon and Amy pick their best-man and maid of honor by experimenting on the gang. Meanwhile, Leonard\'s self-confidence is still badly damaged after reading his brother\'s Christmas letter.    '),
(246, 11, 'The Solo Oscillation', 13, '\n    Sheldon kicks Amy out of the apartment to work solo, and she and Leonard end up bonding during a series of science experiments, Howard is replaced by Bert in Footprints on the Moon.    '),
(247, 11, 'The Separation Triangulation', 14, '\n    Raj meets a girl at the Planetarium, but soon after finds out she is married. Sheldon rents out his old room to use for his work.    '),
(248, 11, 'The Novelization Correlation', 15, '\n    Leonard\'s book raises questions, and Amy guest stars on the new Professor Proton show.    '),
(249, 11, 'The Neonatal Nomenclature', 16, '\n    When Bernadette won\'t go into labor, the gang try different tactics to get things started. Also, Wolowitz confronts Bernadette after Amy accidentally reveals she\'s already chosen their son\'s name.    '),
(250, 11, 'The Athenaeum Allocation', 17, '\n    Leonard jumps through hoops to help secure the perfect wedding venue for Sheldon and Amy. Also, Bernadette and Wolowitz have a hard time deciding who should stay at home with the kids and who should go back to work.    '),
(251, 11, 'The Gates Excitation', 18, '\n    Leonard, Howard and Raj try to meet Bill Gates, who\'s meeting with Penny to merge their companies, Sheldon thinks he\'s the victim of an April Fool\'s prank.    '),
(252, 11, 'The Tenant Disassociation', 19, '\n    Leonard runs against Sheldon to be president of the tenants association, Wolowitz and Koothrappali find a drone in the backyard.    '),
(253, 11, 'The Reclusive Potential', 20, '\n    Sheldon takes the guys to a cabin in the middle of nowhere to meet a reclusive scientist, Penny and Bernadette improvise Amy\'s bachelorette party.    '),
(254, 11, 'The Comet Polarization', 21, '\n    Sheldon\'s comic book store experience changes when writer Neil Gaiman puts Stuart\'s store on the map, friendships are threatened when Koothrappali takes credit for Penny\'s astronomical discovery.    '),
(255, 11, 'The Monetary Insufficiency', 22, '\n    Sheldon goes to Vegas to win money for science. Also, Penny and Bernadette take Amy wedding dress shopping, but her terrible choice entangles them in a web of lies.    '),
(256, 11, 'The Sibling Realignment', 23, '\n    Sheldon and Leonard make a road trip to wrangle a reluctant wedding guest.    '),
(257, 11, 'The Bow Tie Asymmetry', 24, '\n    When Amy\'s parents and Sheldon\'s family arrive, everybody is focused to make sure all wedding arrangements go according to plan - everyone except the bride and groom.    '),
(258, 12, 'The Conjugal Configuration', 1, '\n    After their wedding, Amy and Sheldon go on their honeymoon.    '),
(259, 12, 'The Wedding Gift Wormhole', 2, '\n    Leonard and Penny give Sheldon and Amy a baffling wedding gift.    '),
(260, 12, 'The Procreation Calculation', 3, '\n    The Wolowitzes\' life gets complicated when Stuart starts bringing his new girlfriend home. Also, Penny and Leonard talk about starting a family while Koothrappali explores an arranged marriage.    '),
(261, 12, 'The Tam Turbulence', 4, '\n    Sheldon won\'t tell anyone why he\'s never mentioned Tam, his childhood best friend, so Leonard takes matters into his own hands. Also, Bernadette and Penny take out Raj\'s fiancée, Anu, for dinner to get the skinny on her.    '),
(262, 12, 'The Planetarium Collision', 5, '\n    Amy doesn\'t have time to work with Sheldon on super asymmetry, so he goes to great lengths to ensure she\'s available. Koothrappali doesn\'t want Wolowitz to join him in hosting a show at the planetarium.    '),
(263, 12, 'The Imitation Perturbation', 6, '\n    When Wolowitz dresses up as Sheldon for Halloween, Sheldon seeks retaliation at Leonard and Penny\'s Halloween party. Also, Leonard is shocked that Penny doesn\'t remember their first kiss.    '),
(264, 12, 'The Grant Allocation Derivation', 7, '\n    Leonard is caught between a rock and a hard place when he\'s responsible for distributing extra grant money. Also, Bernadette turns the backyard playhouse into a hideaway from her husband and kids.    '),
(265, 12, 'The Consummation Deviation', 8, '\n    Sheldon tries to bond with Amy\'s father, but when Wolowitz lures Mr. Fowler away with magic tricks, Sheldon has no choice but to bond with Mrs. Fowler. Also, Koothrappali and Anu try to get physical for the first time.    '),
(266, 12, 'The Citation Negation', 9, '\n    Sheldon and Amy are devastated after learning from a Russian paper that super asymmetry has already been theorized and disproved. Bernadette wants to beat Howard in a popular video game.    '),
(267, 12, 'The VCR Illumination', 10, '\n    A VHS tape from Sheldon\'s past inspires him and Amy not to give up when they\'re still feeling down about their theory being disproven. Bernadette turns into a pageant mom when she tries to help Howard with his Magic Castle audition.    '),
(268, 12, 'The Paintball Scattering', 11, '\n    Penny and Leonard organize a paintball game, which results in mayhem when Sheldon becomes jealous of Amy. Raj catches Anu with her ex-boyfriend. Stuart doesn\'t want to move in with Denise.    '),
(269, 12, 'The Propagation Proposition', 12, '\n    Penny\'s ex-boyfriend Zack learns that he is infertile, so he asks Leonard for help, Koothrappali attempts to mend things with his ex-fiancee Anu.    '),
(270, 12, 'The Confirmation Polarization', 13, '\n    Sheldon and Amy are thrilled when their super asymmetry theory is proven by two physicists, until they try to kick Amy off the Nobel nomination. Bernadette gets one of her drugs approved and wants a reluctant Penny to head the sales team.    '),
(271, 12, 'The Meteorite Manifestation', 14, '\n    Sheldon is thrilled to help Bernadette and Howard navigate bureaucracy concerning a neighbor\'s non-compliant balcony until he learns they too have ignored codes. Leonard is disappointed when his friends are uninterested in his new laser.    '),
(272, 12, 'The Donation Oscillation', 15, '\n    Penny tries to throw a wrench into Leonard\'s plan to be a sperm donor for her ex-boyfriend, Wolowitz, Bernadette, Anu and Koothrappali turn Koothrappali\'s canceled bachelor party into a couple\'s trip aboard the \'vomit comet.\'    '),
(273, 12, 'The D & D Vortex', 16, '\n    The gang finds out Wil Wheaton hosts a celebrity Dungeons and Dragons game involving William Shatner, Joe Manganiello, Kareem Abdul-Jabbar and Kevin Smith. Deception and betrayal are the path to make it to the one open seat.    '),
(274, 12, 'The Conference Valuation', 17, '\n    Bernadette and Penny travel to San Diego for a pharmaceutical sales convention. Back home, Amy and the guys experiment on the Wolowitz children when Sheldon finds a book on it.    '),
(275, 12, 'The Laureate Accumulation', 18, '\n    Rivals Pemberton and Campbell charm America on a publicity tour so Sheldon and Amy try to win over Nobel laureates Kip Thorne, George Smoot and Frances Arnold. Halley\'s fear of the dark causes opportunity and conflict at the Wolowitz home.    '),
(276, 12, 'The Inspiration Deprivation', 19, '\n    Contemplating what it would mean to all women if she were to win a Nobel Prize causes Amy to have a meltdown. Koothrappali and Wolowitz try to relive the good old days after Wolowitz buys a scooter that looks like the one he had years ago.    '),
(277, 12, 'The Decision Reverberation', 20, '\n    Koothrappali is worried people won\'t take him seriously in his own field after publishing a paper that suggests he may have discovered alien life. Leonard wants to be the principal investigator on a plasma physics study.    '),
(278, 12, 'The Plagiarism Schism', 21, '\n    Kripke has proof that Dr. Pemberton plagiarized his thesis in college, and Sheldon and Amy aren\'t sure if they should turn him in. Wolowitz learns that Bernadette wasn\'t the only waitress at the Cheesecake Factory who had a crush on him.    '),
(279, 12, 'The Maternal Conclusion', 22, '\n    Leonard is pleasantly surprised when Beverly comes to visit and she\'s genuinely kind to him, until he finds out the real reason she\'s there. Also, Denise and Stuart overstay their welcome at the Wolowitz house.    '),
(280, 12, 'The Change Constant', 23, '\n    Sheldon and Amy await big news.    '),
(281, 12, 'The Stockholm Syndrome', 24, '\n    Bernadette and Wolowitz leave their kids for the first time, Penny and Leonard try to keep a secret, Sheldon and Amy stick together, and Koothrappali makes a new friend, as the gang travels together into an uncharted future.    ');

-- --------------------------------------------------------

--
-- Structure de la table `program`
--

CREATE TABLE `program` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `program`
--

INSERT INTO `program` (`id`, `category_id`, `title`, `summary`, `poster`, `country`, `year`) VALUES
(1, 1, 'Walking Dead', 'Le policier Rick Grimes se réveille après un long coma. Il découvre avec effarement que le monde, ravagé par une épidémie, est envahi par les morts-vivants.', 'https://m.media-amazon.com/images/M/MV5BZmFlMTA0MmUtNWVmOC00ZmE1LWFmMDYtZTJhYjJhNGVjYTU5XkEyXkFqcGdeQXVyMTAzMDM4MjM0._V1_.jpg', NULL, NULL),
(2, 1, 'The Haunting Of Hill House', 'Plusieurs frères et sœurs qui, enfants, ont grandi dans la demeure qui allait devenir la maison hantée la plus célèbre des États-Unis, sont contraints de se réunir pour finalement affronter les fantômes de leur passé.', 'https://m.media-amazon.com/images/M/MV5BMTU4NzA4MDEwNF5BMl5BanBnXkFtZTgwMTQxODYzNjM@._V1_SY1000_CR0,0,674,1000_AL_.jpg', NULL, NULL),
(3, 1, 'American Horror Story', 'A chaque saison, son histoire. American Horror Story nous embarque dans des récits à la fois poignants et cauchemardesques, mêlant la peur, le gore et le politiquement correct.', 'https://m.media-amazon.com/images/M/MV5BODZlYzc2ODYtYmQyZS00ZTM4LTk4ZDQtMTMyZDdhMDgzZTU0XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SY1000_CR0,0,666,1000_AL_.jpg', NULL, NULL),
(4, 1, 'Love Death And Robots', 'Un yaourt susceptible, des soldats lycanthropes, des robots déchaînés, des monstres-poubelles, des chasseurs de primes cyborgs, des araignées extraterrestres et des démons assoiffés de sang : tout ce beau monde est réuni dans 18 courts métrages animés déconseillés aux âmes sensibles.', 'https://m.media-amazon.com/images/M/MV5BMTc1MjIyNDI3Nl5BMl5BanBnXkFtZTgwMjQ1OTI0NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg', NULL, NULL),
(5, 1, 'Penny Dreadful', 'Dans le Londres ancien, Vanessa Ives, une jeune femme puissante aux pouvoirs hypnotiques, allie ses forces à celles d Ethan, un garçon rebelle et violent aux allures de cowboy, et de Sir Malcolm, un vieil homme riche aux ressources inépuisables.  Ensemble, ils combattent un ennemi inconnu, presque invisible, qui ne semble pas humain et qui massacre la population.', 'https://m.media-amazon.com/images/M/MV5BNmE5MDE0ZmMtY2I5Mi00Y2RjLWJlYjMtODkxODQ5OWY1ODdkXkEyXkFqcGdeQXVyNjU2NjA5NjM@._V1_SY1000_CR0,0,695,1000_AL_.jpg', NULL, NULL),
(6, 1, 'Fear The Walking Dead', 'La série se déroule au tout début de l épidémie relatée dans la série-mère The Walking Dead et se passe dans la ville de Los Angeles, et non à Atlanta. Madison est conseillère dans un lycée de Los Angeles. Depuis la mort de son mari, elle élève seule ses deux enfants : Alicia, excellente élève qui découvre les premiers émois amoureux, et son grand frère Nick qui a quitté la fac et a sombré dans la drogue.', 'https://m.media-amazon.com/images/M/MV5BYWNmY2Y1NTgtYTExMS00NGUxLWIxYWQtMjU4MjNkZjZlZjQ3XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SY1000_CR0,0,666,1000_AL_.jpg', NULL, NULL),
(7, 4, 'The Big Bang Theory', 'Leonard Hofstadter et Sheldon Cooper vivent en colocation à Pasadena, ville de l\'agglomération de Los Angeles. Ce sont tous deux des physiciens surdoués, « geeks » de surcroît. C\'est d\'ailleurs autour de cela qu\'est axée la majeure partie comique de la série. Ils partagent quasiment tout leur temps libre avec leurs deux amis Howard Wolowitz et Rajesh Koothrappali pour jouer à des jeux vidéo comme Halo, organiser un marathon de la saga Star Wars, jouer à des jeux de société comme le Boggle klingon ou de rôles tel que Donjons et Dragons, voire discuter de théories scientifiques très complexes.Leur univers routinier est perturbé lorsqu\'une jeune femme, Penny, s\'installe dans l\'appartement d\'en face. Leonard a immédiatement des vues sur elle et va tout faire pour la séduire ainsi que l\'intégrer au groupe et à son univers, auquel elle ne connaît rien.', 'https://upload.wikimedia.org/wikipedia/fr/6/69/BigBangTheory_Logo.png', 'USA', 2007);

-- --------------------------------------------------------

--
-- Structure de la table `season`
--

CREATE TABLE `season` (
  `id` int NOT NULL,
  `program_id` int NOT NULL,
  `number` int NOT NULL,
  `year` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `season`
--

INSERT INTO `season` (`id`, `program_id`, `number`, `year`, `description`) VALUES
(1, 7, 1, 2007, 'Season 1'),
(2, 7, 2, 2008, 'Season 2'),
(3, 7, 3, 2009, 'Season 3'),
(4, 7, 4, 2010, 'Season 4'),
(5, 7, 5, 2011, 'Season 5'),
(6, 7, 6, 2012, 'Season 6'),
(7, 7, 7, 2013, 'Season 7'),
(8, 7, 8, 2014, 'Season 8'),
(9, 7, 9, 2015, 'Season 9'),
(10, 7, 10, 2016, 'Season 10'),
(11, 7, 11, 2017, 'Season 11'),
(12, 7, 12, 2018, 'Season 12');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `actor_program`
--
ALTER TABLE `actor_program`
  ADD PRIMARY KEY (`actor_id`,`program_id`),
  ADD KEY `IDX_B01827EE10DAF24A` (`actor_id`),
  ADD KEY `IDX_B01827EE3EB8070A` (`program_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DDAA1CDA4EC001D1` (`season_id`);

--
-- Index pour la table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F0E45BA93EB8070A` (`program_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `episode`
--
ALTER TABLE `episode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT pour la table `program`
--
ALTER TABLE `program`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `season`
--
ALTER TABLE `season`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actor_program`
--
ALTER TABLE `actor_program`
  ADD CONSTRAINT `FK_B01827EE10DAF24A` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B01827EE3EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `episode`
--
ALTER TABLE `episode`
  ADD CONSTRAINT `FK_DDAA1CDA4EC001D1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`);

--
-- Contraintes pour la table `season`
--
ALTER TABLE `season`
  ADD CONSTRAINT `FK_F0E45BA93EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
