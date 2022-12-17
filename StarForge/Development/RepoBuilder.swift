////
////  RepoBuilder.swift
////  StarForge
////
////  Created by Lilliana on 17/11/2022.
////
//
//// This is what I use to make the control.json file, it's commented out on release build
//
//enum RepoBuilder {
//    // MARK: Internal
//
//    static func main() async {
//        await ch.add(
//            "Dialogue Improvements",
//            "Improve dialogue for a more immersive experience",
//            "Salk & Kainzorus Prime",
//            .immersion,
//            .essential,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/wg19wkol6d22lgw/GBL_Dialogue.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Character Startup Changes",
//            "Free up the auto-selected feats when creating a new character",
//            "jonathan7",
//            .mechanics,
//            .suggest,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/nbu5qwgwlp6z8ps/END_StartChange.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Character Startup Changes Patch",
//            "Prevent you from dying on the Endar Spire tutorial if you don't select armour/weapon proficiency",
//            "A Future Pilot",
//            .mechanics,
//            .suggest,
//            ["Character Startup Changes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/zkgx82n16mi67vs/END_StartChange_Patch.tzst?dl=0"
//        )
//
//        await ch.add(
//            "JC Minor Fixes",
//            "A variety of small bug fixes and improvements",
//            "JCarter426",
//            .bugfix,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/zxx5ugbfwt3v1ke/GBL_JCMinor.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Unique Ajunta Pall",
//            "Give the ghost of Ajunta Pall an appearance more suiting his legendary status",
//            "Silveredge9",
//            .graphics,
//            .optional,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/men5ccrtihdpff0/KOR_Ajunta.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Unique Ajunta Pall Patch",
//            "Fix transparency issues in Unique Ajunta Pall",
//            "A Future Pilot",
//            .graphics,
//            .optional,
//            ["Unique Ajunta Pall"],
//            [],
//            false,
//            "https://www.dropbox.com/s/iolmw9j1hdme2d5/KOR_Ajunta_Patch.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Community Patch",
//            "Almost 600 miscellaneous bug fixes and improvements",
//            "Various Authors",
//            .bugfix,
//            .essential,
//            [],
//            ["lka_leaf03.tpc"],
//            false,
//            "https://www.dropbox.com/s/lpzrffc6j7y6hsz/GBL_Community.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Specularity Tweaks",
//            "Improve textures by adjusting specularity levels",
//            "ebmar",
//            .graphics,
//            .recommend,
//            [],
//            ["plc_comppnl.tpc", "plc_comppnl2.tpc", "plc_footlker.tpc"],
//            false,
//            "https://www.dropbox.com/s/2nqg04y3tij69tx/GBL_Specularity.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Duncaan on Manaan",
//            "Restore a scene with duelist Deadeye Duncan in Ahto City",
//            "Seamhainn",
//            .restore,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ryymzkexjr03lo9/MAN_Duncan.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Pazaak Cards",
//            "Improve the appearance of pazaak cards",
//            "CarthOnasty",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/z9u75e9ia1efy9p/GBL_PazaakCards.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Republic Soldiers",
//            "Improve the appearance of the Republic soldier NPCs",
//            "ebmar & JCarter426",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/12f3y5gbkvyfb67/GBL_RepSold.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Twi'leks",
//            "Improve the appearance of Twi'lek NPCs",
//            "Dark Hope",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/hhnyvwbflqrf7jf/GBL_Twilek.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Shaleena/Lashowe Mouth Fix",
//            "Fix a bug wherein minor characters Shaleena and Lashowe have no teeth",
//            "Ashton Scorpius",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/h1fhwnchxsk6o15/KOR_Lashowe.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Unique Shaleena Restoration",
//            "Restore a unique appearance for minor character Shaleena",
//            "StellarExile",
//            .restore,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/1q68duejupmr0o1/TAR_Shaleena.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Calo Nord Recolour",
//            "Give bounty hunter Calo Nord a more muted colour scheme",
//            "Watcher07",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ys9enck8u8p0prg/GBL_Calo.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Darth Malak",
//            "Improve the appearance of the Sith Lord, Darth Malak",
//            "Dark Hope",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/74cef9r0ewrxq0t/UNK_Malak.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Galaxy Map",
//            "Improve the appearance of planet icons on the Ebon Hawk",
//            "Yours, etc.",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/60e1zczf76qz3oe/EBH_GalaxyMap.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Scout",
//            "Improve the appearance of the Scout class's default clothes",
//            "Dark Hope",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/jbyzdjtk4d5b9xe/PAR_Scout.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Soldier",
//            "Improve the appearance of the Soldier class's default clothes",
//            "Dark Hope",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/k7asvpu4cm069qd/PAR_Soldier.tzst?dl=0"
//        )
//        
//        await ch.add(
//            "HD Scoundrel",
//            "Improve the appearance of the Scoundrel class's default clothes",
//            "Dark Hope",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/3odtwtdlalupc2f/PAR_Scoundrel.tzst?dl=0"
//        )
//        
//        await ch.add(
//            "HD Bastila Shan",
//            "Improve the appearance of party member and best LI, Bastila Shan",
//            "Dark Hope",
//            .graphics,
//            .recommend,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/j7sq6hzrgtyk5lb/PAR_Bastila.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Party Model Fixes",
//            "Fix some visual glitches in party member models",
//            "redrob41",
//            .bugfix,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ai9o3ovlszg7ihl/PAR_ModelFix.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Canderous Ordo",
//            "Improve the appearance of party member Canderous Ordo",
//            "Dark Hope",
//            .graphics,
//            .recommend,
//            ["Party Model Fixes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/8gddpml7kzfl7gr/PAR_Canderous.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Carth Onasi",
//            "Improve the appearance of party member Carth Onasi",
//            "Dark Hope",
//            .graphics,
//            .recommend,
//            ["Party Model Fixes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/qoc48bi03qusqnr/PAR_Carth.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD HK-47",
//            "Improve the appearance of party member HK-47",
//            "Dark Hope",
//            .graphics,
//            .recommend,
//            ["Party Model Fixes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/9s8mo0knb0cwfdi/PAR_HK-47.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Jolee Bindo",
//            "Improve the appearance of party member Jolee Bindo",
//            "Dark Hope & Fens",
//            .graphics,
//            .recommend,
//            ["Party Model Fixes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/pml8rhyse11vzpo/PAR_Jolee.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Juhani",
//            "Improve the appearance of party member Juhani",
//            "Fens",
//            .graphics,
//            .recommend,
//            ["Party Model Fixes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/7nkyot73i8eia9q/PAR_Juhani.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Mission Vao",
//            "Improve the appearance of party member Mission Vao",
//            "Dark Hope",
//            .graphics,
//            .recommend,
//            ["Party Model Fixes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/uscgq5xvopj1uir/PAR_Mission.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD T3-M4",
//            "Improve the appearance of party member T3-M4",
//            "Dark Hope",
//            .graphics,
//            .recommend,
//            ["Party Model Fixes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/itws1yuh9yzkub4/PAR_T3-M4.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Zaalbar",
//            "Improve the appearance of party member Zaalbar",
//            "Dark Hope",
//            .graphics,
//            .recommend,
//            ["Party Model Fixes"],
//            [],
//            false,
//            "https://www.dropbox.com/s/hacxs9fyv1o3fng/PAR_Zaalbar.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Korriban Sith Robes",
//            "Give robes instead of officer uniforms to the Dark Jedi on Korriban",
//            "JCarter426",
//            .immersion,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/gaemk56rj5156za/KOR_BlackRobes.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Cloaked Jedi Robes",
//            "Add cloaks to most Jedi robes",
//            "JCarter426",
//            .graphics,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/lidgnre00yt5jjl/GBL_Cloaks.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Jedi Tailor",
//            "Add a new character, a Trandoshan tailor, to the Jedi Academy on Dantooine. He can change the colour of most robes",
//            "JCarter426",
//            .added,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/coep7g0qgqxoax6/DAN_Tailor.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Star Maps",
//            "Improve the appearance of the star maps found on each planet",
//            "Sdub",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/nffrhc0a0ptul4r/GBL_StarMaps.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Background Ships",
//            "Improve the appearance of starships in the background. Size Warning: 138 MB",
//            "Dark Hope",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/0l1l2q2vmgzd2ll/TAR_Ships.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Ebon Hawk",
//            "Improve the appearance of your ship, the Ebon Hawk. Size Warning: 185 MB",
//            "Vurt",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/zdgvyf30xwgyja2/EBH_EbonHawk.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Cockpit Skyboxes",
//            "Improve the appearance of planets as seen from the cockpit of the Ebon Hawk",
//            "Sithspectre",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/tl69e4leuvefzck/EBH_Skybox.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Taris Reskin",
//            "Add a pretty and story-compatible reskin to all of Taris, as well as the manors on Dantooine.",
//            "Quanon",
//            .immersion,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/xi43s09tp5r1mm2/TAR_Reskin.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Starfields",
//            "Improve the appearance of the starfields and nebulae",
//            "Kexikus",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/8wzxcz0zinhzksu/GBL_Starfields.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Skyboxes",
//            "Improve the appearance of the skies and background of every planet",
//            "Kexikus",
//            .graphics,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/j7bdps4rrlz5hvu/GBL_Skybox.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Beam Effects",
//            "Improve the appearance of beam effects, e.g., Force Lightning",
//            "InSidious",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/8ryl0s2nxaulij0/GBL_Beam.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Animated Cantina Signs",
//            "Animate the signs for the cantinas on Taris",
//            "Sith Holocron",
//            .immersion,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/lga9pfi5sy4f1hz/TAR_AniCantina.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Animated Swoop Monitors",
//            "Animate the monitors for swoop racing tracks; backported from K2",
//            "ebmar",
//            .immersion,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/pekcmxlac8leky0/MAN_AniSwoop.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Animated Ebon Hawk Screen",
//            "Animate the screens in the cockpit of the Ebon Hawk",
//            "Dark Hope",
//            .immersion,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/s22bb7jyt52qski/EBH_AniScreen.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Coloured Load Screens",
//            "Render the loading screens in colour instead of greyscale",
//            "SithSpectre",
//            .graphics,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/64sypfch799p6lv/GBL_ColourLoad.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Reflective Lightsaber Blades",
//            "Give the lightsaber blades a true ambient light and reflect on the environment",
//            "Crazy34",
//            .immersion,
//            .essential,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/8je24lwhd6rkjqb/GBL_ReflectSabre.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Blaster Shots",
//            "Improves the appearance of blaster shots",
//            "JCarter426",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/32gsi46xomfl6hp/GBL_BlasterShots.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Wookie Warblade Fix",
//            "Fix positioning of the Wookie warblade",
//            "redrob",
//            .bugfix,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/0smrv6ksbymmgxk/GBL_Warblade.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Extended Force Powers",
//            "Extend the duration of time-limited force powers",
//            "brig",
//            .immersion,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/a8nj9053adnys3x/GBL_ExtForce.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Korriban Academy Workbench",
//            "Add a workbench to the Sith academy on Korriban",
//            "InSidious",
//            .added,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/tl7yajw5yy1x1qz/KOR_Workbench.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Sharina on Dantooine",
//            "Restores a scene with minor character Sharina Fizark at the Jedi academy",
//            "Sekan",
//            .restore,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ziaf2paxys7pc87/DAN_Sharina.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Senni Vek on Tatooine",
//            "Restores a scene with minor character Senni Vek in the Dune Sea",
//            "N-Drew25",
//            .restore,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ionwbjs7rvg86tl/TAT_Senni.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Hidden Beck Control Room Restoration",
//            "Restores the control room in the Hidden Bek base on Taris",
//            "N-Drew25",
//            .restore,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/qmthfxkjkjivs2u/TAR_Bek.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Vision Enhancement",
//            "Sleep in your underwear instead of armour during visions",
//            "JCarter426",
//            .immersion,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/6yibvx6jra5cbfm/EBH_Visions.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Leviathan Dialogue Improvements",
//            "More interesting dialogue with the Rodian on the Leviathan",
//            "Revanator",
//            .immersion,
//            .optional,
//            ["Dialogue Improvements"],
//            [],
//            false,
//            "https://www.dropbox.com/s/cmkxu2b94unwcbz/LEV_Dialogue.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Balanced Pazaak",
//            "Counters the blatant cheating in Pazaak by worsening opponents' decks",
//            "A Future Pilot",
//            .mechanics,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/me06ihrnc8xdv49/GBL_PazaakCheat.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Ebon Hawk Camera Fix",
//            "Fix zoomed in camera angles on the Ebon Hawk",
//            "LDR",
//            .bugfix,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/l7oiampe0z96bwo/EBH_Camera.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Enhanced Grenades",
//            "Add Demolitions skill modifier to grenade damage",
//            "jc2",
//            .mechanics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/eqwkgeczuzagupp/GBL_Grenades.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Turret Minigame Remover",
//            "Removes the unscripted minigames (scripted games still appear)",
//            "KittyKitty",
//            .mechanics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/4t497ei14bunmd1/GBL_RemTurret.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Repeating Blaster Fix",
//            "Fixes a bug wherein repeating blasters don't repeat",
//            "R2-X2",
//            .bugfix,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/b8tsbml6f0hydmu/GBL_Repeater.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Tutorial Remover",
//            "Removes Trask and his annoying tutorial",
//            "Darthbdaman",
//            .immersion,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/6or8qcsr0a7zebf/END_NoTutorial.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Advanced Lightsaber Throw Knockdown",
//            "Adds a knockdown effect to the Advanced Lightsaber Throw force power",
//            "uwadmin12",
//            .mechanics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/95ziow8z41er63p/GBL_SabreThrow.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Sunry Trial Enhancement",
//            "Adds a new cutscene to Sunry's, Jolee's old friend, murder trial on Manaan",
//            "FallenGuardian",
//            .immersion,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/1o5nyn5gis076ez/MAN_Sunry.tzst?dl=0"
//        )
//
//        await ch.add(
//            "T3-M4 Early Recruitment Restoration",
//            "Restores the ability to recruit T3-M4 as soon as you can afford him",
//            "brents742",
//            .restore,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/q992f5h7iv0ewa1/TAR_RecruitT3-M4.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Security Spike Restoration",
//            "Restores the use of security spikes or replaces with credits",
//            "JCarter426",
//            .restore,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/3iqc2s7mt64jrjp/GBL_SecuSpike.tzst?dl=0"
//        )
//        
//        await ch.add(
//            "HD Weapons",
//            "Improves the appearance of most weapons",
//            "Yours, etc.",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/0bydyyd6qybfzzr/GBL_Weapons.tzst?dl=0"
//        )
//        
//        await ch.add(
//            "HD Weapons Patch",
//            "Improves the appearance of blasters",
//            "SithSpectre",
//            .graphics,
//            .suggest,
//            [],
//            ["w_rptnblstr_004.mdl", "w_rptnblstr_004.mdx", "w_blstrpstl_006.mdl", "w_blstrpstl_006.mdx"],
//            true,
//            "https://www.dropbox.com/s/6k54351vb7l4ijf/GBL_Weapons_Patch.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Crashed Republic Cruiser",
//            "Adds a whole new module (!) to the Unknown World, wherein you explore the crashed Republic cruiser which is normally part of the background",
//            "LDR",
//            .added,
//            .essential,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/rlh3is67tec1g3v/UNK_RepCruiser.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Crashed Republic Cruiser Patch",
//            "Fixes for iOS devices",
//            "Yours, etc.",
//            .added,
//            .essential,
//            ["Crashed Republic Cruiser"],
//            [],
//            false,
//            "https://www.dropbox.com/s/rj147n89u7awhk1/UNK_RepCruiser_Patch.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Rescaled Trandoshans",
//            "Rescales Trandoshans to their canonical height",
//            "DarthParametric",
//            .immersion,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/kyuis9dp9870qca/YVN_Trandoshan.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Angry Selkath Restoration",
//            "Restores the angry animation for Selkath",
//            "Alvar007",
//            .restore,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/g86fyrcewq7gc31/MAN_AngrySelkath.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Sneak Attack 10 Restoration",
//            "Restores the Sneak Attack 10 feat for level 19 Scoundrels, i.e., Mission Vao",
//            "N-Drew25",
//            .restore,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ct971oqvua11ig8/GBL_SneakTen.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Sherruk with Lightsabers",
//            "Makes the Mandalorian criminal Sherruk use the lightsabers he has in his pocket (he is not happy to see you)",
//            "Shem",
//            .immersion,
//            .recommend,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/jx196d6fjl7cr1o/DAN_Sherruk.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Sherruk with Lightsabers Patch",
//            "Fixes a crash when entering one of Dantooine's plains",
//            "A Future Pilot & DarthParametric",
//            .immersion,
//            .recommend,
//            ["Sherruk with Lightsabers"],
//            [],
//            false,
//            "https://www.dropbox.com/s/augg9oh3o9lxixj/DAN_Sherruk_Patch.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Bastila New Robes",
//            "Gives Bastila Shan a new set of robes when she receives her promotion",
//            "Revanator",
//            .immersion,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/w4lufx7ivj8p2zu/UNK_DarkBasti.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Dueling Arena Adjustment",
//            "Fixes timing bugs and improves the appearance of the dueling arena on Taris",
//            "DarthParametric",
//            .bugfix,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/0haulvqv7mzkcq8/TAR_Arena.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Light Side Bendak Bounty",
//            "Adds the option to turn in illegal duelist Bendak Starkiller's bounty without gaining dark side points",
//            "Thrak Farella & A Future Pilot",
//            .added,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ug1met1b0uwlcgh/TAR_Bendak.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Kashyyyk Forcefield Rework",
//            "Adds a control panel to the forcefield in the Shadowlands of Kashyyyk",
//            "DarthParametric",
//            .immersion,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/88mi10g5mboyi25/KSH_Forcefield.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Engine on a Bench",
//            "Fixes a positioning bug that leaves the very valuable prototype swoop bike's engine lying about on the floor",
//            "DarthParametric",
//            .bugfix,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ncodut64mlnxcuo/TAR_EngineBench.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Missing Lamp Fix",
//            "Fix lamps mysteriously disappearing in the temple on an Unknown World",
//            "ebmar",
//            .bugfix,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/fqxxwsi4u2z8i65/UNK_Lamp.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Elite Sith Soldier Restoration",
//            "Restore different appearance for elite Sith soldiers",
//            "A Future Pilot",
//            .restore,
//            .optional,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/pkbfzrk7blhr3zs/GBL_SithSold.tzst?dl=0"
//        )
//        
//        await ch.add(
//            "HD Sith Soldiers",
//            "Improve the appearance of the Sith soldier NPCs",
//            "Dark Hope",
//            .graphics,
//            .optional,
//            ["Elite Sith Soldier Restoration"],
//            [],
//            false,
//            "https://www.dropbox.com/s/z628d5e2ed75tw5/GBL_SithSold_Patch.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Diverse Republic Soldiers",
//            "Diversifies the models of Republic soldiers on Taris",
//            "DarthParametric",
//            .immersion,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/qupvp7hpv5ziaiq/TAR_DivSold.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Diverse Jedi",
//            "Diversifies the models of Jedi NPCs on Dantooine",
//            "DarthParametric",
//            .immersion,
//            .recommend,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/jn0hcow4xetf1pb/UNK_DivJedi.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Diverse Cloaked Jedi Compatibility",
//            "Fixes compatibility between Diverse Jedi and Cloaked Jedi Robes",
//            "DarthParametric",
//            .bugfix,
//            .recommend,
//            ["Cloaked Jedi Robes", "Diverse Jedi"],
//            [],
//            false,
//            "https://www.dropbox.com/s/mcvmy5rpuv42cwh/CMP_DivJedi_Cloak.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Dodonna's Transmission",
//            "Fix your character not showing up in the transmission cutscene if you are light side",
//            "danil-ch",
//            .bugfix,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/a7wfu6nzrgws6l7/UNK_Transmission.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Endgame Holograms",
//            "Improves the appearance of holograms in the endgame cutscene",
//            "DarthParametric",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/fsxjq2548msw6f1/UNK_Holo.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Twisted Rancor Trio Holograms",
//            "Improves the appearance of holograms in the Twisted Rancor Trio puzzle on Taris",
//            "DarthParametric",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ygd9os5aux2eelt/TAR_Holo.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Rakatan Holograms",
//            "Improves the appearance of holograms of Rakatans",
//            "DarthParametric",
//            .graphics,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/oy2m56lzbx31039/KSH_Holo.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Elder Droid Voice",
//            "Make the elder droids on Dantooine speak ancient Selkath as the text implies they do",
//            "ebmar",
//            .immersion,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/beni2nhwxu08soj/UNK_Elder.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Coloured Mandalorian Armour",
//            "Adds different colours to Mandalorian armour based on their rank as they canonically have",
//            "JCarter426",
//            .immersion,
//            .suggest,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/ngdu8gl33tbqmqk/GBL_Mandalorian.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Dantooine Training Lightsabers",
//            "Use lightsabers instead of longswords whilst training with Bastila at the Jedi academy",
//            "Kexikus",
//            .immersion,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/8sor7rv79duqtc1/DAN_Training.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Realistic Visual Effects",
//            "Remove pointless and unrealistic visual effects from abilities and force buffs",
//            "Shem",
//            .immersion,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/h9o4lkvbfjzjdqm/GBL_Effects.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Weapon Rebalance",
//            "Rebalance the weapons' stats to match those of K2",
//            "TK-664",
//            .mechanics,
//            .essential,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/9sa2cpxocp8ivjj/GBL_WeaponStats.tzst?dl=0"
//        )
//
//        await ch.add(
//            "HD Plant Life",
//            "Improve the appearance of grass, ivy, and leaves",
//            "MadDerp",
//            .graphics,
//            .optional,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/3k1c755ix6fwvsa/GBL_PlantLife.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Mobile Swoop Racing",
//            "Make the swoop racing minigames mobile-friendly on all planets except Taris",
//            "Darth333",
//            .mechanics,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/1oax6farq7p44ap/GBL_MobileSwoop.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Pan-Galactic Flirting",
//            "Remove gender restrictions so you can flirt with NPCs of the same gender as you",
//            "JCarter426",
//            .bugfix,
//            .essential,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/u2z3yk2pdyrcl93/GBL_Flirting.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Bi Bastila",
//            "Lets both men and women romance Bastila, fixing the dialogue and everything!",
//            "JCarter426",
//            .bugfix,
//            .essential,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/9g6p3yhe2b5e5k9/GBL_BiBasti.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Movement Fix",
//            "Fixes some bugs in movement animations",
//            "ZimmMaster",
//            .bugfix,
//            .recommend,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/pfutxfb3owmu8wc/GBL_Movement.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Bastila Slave Outfit",
//            "Gives Bastila a Leia-esque slave outfit when rescuing her on Taris",
//            "JCarter426",
//            .graphics,
//            .optional,
//            [],
//            [],
//            true,
//            "https://www.dropbox.com/s/q2s8z6vu3zenhc4/TAR_SlaveBasti.tzst?dl=0"
//        )
//
//        await ch.add(
//            "Bastila Slave Outfit Patch",
//            "Improves the appearance of the slave outfit",
//            "Dark Hope",
//            .immersion,
//            .recommend,
//            ["Bastila's Slave Outfit"],
//            [],
//            false,
//            "https://www.dropbox.com/s/ggkb3369m3fw5ke/TAR_SlaveBasti_Patch.tzst?dl=0"
//        )
//        
//        await ch.add(
//            "NPC Alignment Fix",
//            "Adds alignments to NPCs who should have one, but mysteriously don't",
//            "TK-664",
//            .bugfix,
//            .essential,
//            [],
//            [],
//            false,
//            "https://www.dropbox.com/s/wrtwuilwxca5f1y/GBL_NPCAlign.tzst?dl=0"
//        )
//
//        await ch.buildRepo()
//    }
//
//    // MARK: Private
//
//    private static var ch: ControlHelper = .init()
//}
