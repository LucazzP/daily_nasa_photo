import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';

abstract class PhotoOfDayRepository {
  Future<Resource<List<PhotoModel>>> getPhotosOfDay([int page = 0]);
}

class PhotoOfDayRepositoryMock extends Mock implements PhotoOfDayRepository {
  @override
  Future<Resource<List<PhotoModel>>> getPhotosOfDay([int page = 0]) {
    final endDate = DateTime(2020, 11, 08).subtract(
      Duration(days: 10 * page),
    );
    final startDate = endDate.subtract(Duration(days: 10));

    final result = NetworkBoundResources<List<PhotoModel>, List>().asFuture(
      createCall: () async {
        return _photos.where((element) {
          final date = DateTime.parse(element["date"]);
          return date.isAfter(startDate) && date.isBefore(endDate.add(Duration(days: 1)));
        }).toList();
      },
      processResponse: (result) => result
          .map<PhotoModel>((e) => PhotoModel.fromJson(Map.from(e)))
          .toList()
          .reversed
          .toList(),
    );
    return result;
  }
}

const List _photos = const [
  {
    "date": "2020-10-07",
    "explanation":
        "An inspirational sight, these giant dish antennas of the Karl G. Jansky Very Large Array (VLA) rise above the New Mexico desert at moonset.  Mounted on piers but transportable on railroad tracks to change the VLA’s configuration, its 27 operating antennas are each house-sized (25 meters across) and can be organized into an array spanning the size of a city (35 kilometers). A prolific radio astronomy workhorse, the VLA has been used to discover water on planet Mercury, radio-bright coronae around stars, micro-quasars in our Galaxy, gravitationally-induced Einstein rings around distant galaxies, and radio counterparts to cosmologically distant gamma-ray bursts. Its vast size has allowed astronomers to study the details of radio galaxies, super-fast cosmic jets, and map the center of our own Milky Way. Now 40 years since its dedication the VLA has been used in more than 14,000 observing projects and contributed to more than 500 Ph.D. dissertations. On October 10, the National Radio Astronomy Observatory will host a day-long online celebration of the VLA at 40 featuring virtual tours and presentations on the history, operations, science, and future of the Very Large Array.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/VLA_Moonset_NIK_0991.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "The Very Large Array at Moonset",
    "url": "https://apod.nasa.gov/apod/image/2010/VLA_Moonset_NIK_0991_1024.jpg"
  },
  {
    "date": "2020-10-08",
    "explanation":
        "An inspirational sight, these giant dish antennas of the Karl G. Jansky Very Large Array (VLA) rise above the New Mexico desert at moonset.  Mounted on piers but transportable on railroad tracks to change the VLA’s configuration, its 27 operating antennas are each house-sized (25 meters across) and can be organized into an array spanning the size of a city (35 kilometers). A prolific radio astronomy workhorse, the VLA has been used to discover water on planet Mercury, radio-bright coronae around stars, micro-quasars in our Galaxy, gravitationally-induced Einstein rings around distant galaxies, and radio counterparts to cosmologically distant gamma-ray bursts. Its vast size has allowed astronomers to study the details of radio galaxies, super-fast cosmic jets, and map the center of our own Milky Way. Now 40 years since its dedication the VLA has been used in more than 14,000 observing projects and contributed to more than 500 Ph.D. dissertations. On October 10, the National Radio Astronomy Observatory will host a day-long online celebration of the VLA at 40 featuring virtual tours and presentations on the history, operations, science, and future of the Very Large Array.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/VLA_Moonset_NIK_0991.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "The Very Large Array at Moonset",
    "url": "https://apod.nasa.gov/apod/image/2010/VLA_Moonset_NIK_0991_1024.jpg"
  },
  {
    "date": "2020-10-09",
    "explanation":
        "An inspirational sight, these giant dish antennas of the Karl G. Jansky Very Large Array (VLA) rise above the New Mexico desert at moonset.  Mounted on piers but transportable on railroad tracks to change the VLA’s configuration, its 27 operating antennas are each house-sized (25 meters across) and can be organized into an array spanning the size of a city (35 kilometers). A prolific radio astronomy workhorse, the VLA has been used to discover water on planet Mercury, radio-bright coronae around stars, micro-quasars in our Galaxy, gravitationally-induced Einstein rings around distant galaxies, and radio counterparts to cosmologically distant gamma-ray bursts. Its vast size has allowed astronomers to study the details of radio galaxies, super-fast cosmic jets, and map the center of our own Milky Way. Now 40 years since its dedication the VLA has been used in more than 14,000 observing projects and contributed to more than 500 Ph.D. dissertations. On October 10, the National Radio Astronomy Observatory will host a day-long online celebration of the VLA at 40 featuring virtual tours and presentations on the history, operations, science, and future of the Very Large Array.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/VLA_Moonset_NIK_0991.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "The Very Large Array at Moonset",
    "url": "https://apod.nasa.gov/apod/image/2010/VLA_Moonset_NIK_0991_1024.jpg"
  },
  {
    "copyright": "Fernando Pena",
    "date": "2020-10-10",
    "explanation":
        "Galaxies of the Virgo Cluster are scattered across this deep telescopic field of view. The cosmic scene spans about three Full Moons, captured in dark skies near Jalisco, Mexico, planet Earth. About 50 million light-years distant, the Virgo Cluster is the closest large galaxy cluster to our own local galaxy group. Prominent here are Virgo's bright elliptical galaxies from the Messier catalog, M87 at the top left, and M84 and M86 seen (bottom to top) below and right of center. M84 and M86 are recognized as part of Markarian's Chain, a visually striking line-up of galaxies vertically on the right side of this frame. Near the middle of the chain lies an intriguing interacting pair of galaxies, NGC 4438 and NGC 4435, known to some as Markarian's Eyes. Of course giant elliptical galaxy M87 dominates the Virgo cluster. It's the home of a super massive black hole, the first black hole ever imaged by planet Earth's Event Horizon Telescope.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/markarian_FernandoPena2048.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Virgo Cluster Galaxies",
    "url":
        "https://apod.nasa.gov/apod/image/2010/markarian_FernandoPena1024.jpg"
  },
  {
    "copyright": "Michael Goh",
    "date": "2020-10-11",
    "explanation":
        "What strange world is this? Earth. In the foreground of the featured image are the Pinnacles, unusual rock spires in Nambung National Park in Western Australia. Made of ancient sea shells (limestone), how these human-sized picturesque spires formed remains unknown.  In the background, just past the end of the central Pinnacle, is a bright crescent Moon. The eerie glow around the Moon is mostly zodiacal light, sunlight reflected by dust grains orbiting between the planets in the Solar System. Arching across the top is the central band of our Milky Way Galaxy. Many famous stars and nebulas are also visible in the background night sky. The featured 29-panel panorama was taken and composed in 2015 September after detailed planning that involved the Moon, the rock spires, and their corresponding shadows. Even so, the strong zodiacal light was a pleasant surprise.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/PinnaclesGalaxy_Goh_2400.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Milky Way over the Pinnacles in Australia",
    "url": "https://apod.nasa.gov/apod/image/2010/PinnaclesGalaxy_Goh_1080.jpg"
  },
  {
    "date": "2020-10-12",
    "explanation":
        "What would it be like to land on an asteroid?  Although no human has yet done it, NASA's robotic OSIRIS-REx spacecraft is scheduled to attempt to touch the surface of asteroid 101955 Bennu next week.  The goal is to collect a sample from the nearby minor planet for return to Earth for a detailed analysis in 2023. The featured video shows what it looks like to descend toward the 500-meter diamond-shaped asteroid, based on a digital map of Bennu's rocky surface constructed from image and surface data taken by OSIRIS-REx over the past 1.5 years.  The video begins by showing a rapidly spinning Bennu -- much faster than its real rotation period of 4.3 hours.  After the rotation stops, the virtual camera drops you down to just above the rugged surface and circles a house-sized rock outcrop named Simurgh, with the flatter outcrop Roc visible behind it.  If the return sample reaches Earth successfully, it will be scrutinized for organic compounds that might have seeded a young Earth, rare or unusual elements and minerals, and clues about the early history of our Solar System.",
    "media_type": "video",
    "service_version": "v1",
    "thumbnail_url": "https://img.youtube.com/vi/fbEcHDfi-vM/0.jpg",
    "title": "Descending Toward Asteroid Bennu",
    "url": "https://www.youtube.com/embed/fbEcHDfi-vM?rel=0"
  },
  {
    "copyright": "Cem Özkeser",
    "date": "2020-10-13",
    "explanation":
        "Three very different -- and very famous -- objects were all captured in a single frame last month. On the upper left is the bright blue Pleiades, perhaps the most famous cluster of stars on the night sky.  The Pleiades (M45) is about 450 light years away and easily found a few degrees from Orion.  On the upper right is the expansive Andromeda Galaxy, perhaps the most famous galaxy -- external to our own -- on the night sky.  Andromeda (M31) is one of few objects visible to the unaided eye where you can see light that is millions of years old.  In the middle is bright red Mars, perhaps the most famous planet on the night sky. Today Mars is at opposition, meaning that it is opposite the Sun, with the result that it is visible all night long.  In the foreground is an ancient tomb in the Phygrian Valley in Turkey.  The tomb, featuring two stone lions, is an impressive remnant of a powerful civilization that lived thousands of years ago.  Mars, currently near its brightest, can be easily found toward the east just after sunset.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/MarsTriangle_Ozkeser_3516.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Mars, Pleiades, and Andromeda over Stone Lions",
    "url": "https://apod.nasa.gov/apod/image/2010/MarsTriangle_Ozkeser_960.jpg"
  },
  {
    "copyright": "Amir H. Abolfath",
    "date": "2020-10-14",
    "explanation":
        "The many spectacular colors of the Rho Ophiuchi (oh'-fee-yu-kee) clouds highlight the many processes that occur there.  The blue regions shine primarily by reflected light.  Blue light from the  Rho Ophiuchi star system and nearby stars reflects more efficiently off this portion of the nebula than red light.  The Earth's daytime sky appears blue for the same reason.  The red and yellow regions shine primarily because of emission from the nebula's atomic and molecular gas.  Light from nearby blue stars - more energetic than the bright star  Antares - knocks electrons away from the gas, which then shines when the electrons recombine with the gas.  The dark brown regions are caused by dust grains - born in young stellar atmospheres - which effectively block light emitted behind them.  The Rho Ophiuchi star clouds, well in front of the globular cluster M4 visible here on the upper right, are even more colorful than humans can see - the clouds emits light in every wavelength band from the radio to the gamma-ray.   Astrophysicists: Browse 2,200+ codes in the Astrophysics Source Code Library",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/RhoAntares_Abolfath_3000.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "The Colorful Clouds of Rho Ophiuchi",
    "url": "https://apod.nasa.gov/apod/image/2010/RhoAntares_Abolfath_1080.jpg"
  },
  {
    "copyright": "Robert Eder",
    "date": "2020-10-15",
    "explanation":
        "This sharp telescopic view reveals galaxies scattered beyond the stars of the Milky Way, at the northern boundary of the high-flying constellation Pegasus. Prominent at the upper right is NGC 7331. A mere 50 million light-years away, the large spiral is one of the brighter galaxies not included in Charles Messier's famous 18th century catalog. The disturbed looking group of galaxies at the lower left is well-known as Stephan's Quintet. About 300 million light-years distant, the quintet dramatically illustrates a multiple galaxy collision, its powerful, ongoing interactions posed for a brief cosmic snapshot. On the sky, the quintet and NGC 7331 are separated by about half a degree.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/NGC7331eder.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Galaxies in Pegasus",
    "url": "https://apod.nasa.gov/apod/image/2010/NGC7331eder_1024.jpg"
  },
  {
    "copyright": "Bernhard Hubl",
    "date": "2020-10-16",
    "explanation":
        "Planetary nebula Abell 78 stands out in this colorful telescopic skyscape. In fact the colors of the spiky Milky Way stars depend on their surface temperatures, both cooler (yellowish) and hotter (bluish) than the Sun. But Abell 78 shines by the characteristic emission of ionized atoms in the tenuous shroud of material shrugged off from an intensely hot central star. The atoms are ionized, their electrons stripped away, by the central star's energetic but otherwise invisible ultraviolet light. The visible blue-green glow of loops and filaments in the nebula's central region corresponds to emission from doubly ionized oxygen atoms, surrounded by strong red emission from electrons recombining with hydrogen atoms. Some 5,000 light-years distant toward the constellation Cygnus, Abell 78 is about three light-years across. A planetary nebula like Abell 78 represents a very brief final phase in stellar evolution that our own Sun will experience ... in about 5 billion years.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/PN_Abell78-1_full.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Planetary Nebula Abell 78",
    "url": "https://apod.nasa.gov/apod/image/2010/PN_Abell78-1_1024c1.jpg"
  },
  {
    "copyright": "Wissam Ayoub",
    "date": "2020-10-17",
    "explanation":
        "These clouds of gas and dust drift through rich star fields along the plane of our Milky Way Galaxy toward the high flying constellation Cygnus. Caught within the telescopic field of view are the Soap Bubble (lower left) and the Crescent Nebula (upper right). Both were formed at a final phase in the life of a star. Also known as NGC 6888, the Crescent was shaped as its bright, central massive Wolf-Rayet star, WR 136, shed its outer envelope in a strong stellar wind. Burning through fuel at a prodigious rate, WR 136 is near the end of a short life that should finish in a spectacular supernova explosion.  Discovered in 2013, the Soap Bubble Nebula is likely a planetary nebula, the final shroud of a lower mass, long-lived, sun-like star destined to become a slowly cooling white dwarf. Both stellar shrouds are 5,000 light-years or so distant. The larger Crescent Nebula is around 25 light-years across.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/NGC6888WissamAyoub.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Cygnus: Bubble and Crescent",
    "url": "https://apod.nasa.gov/apod/image/2010/NGC6888WissamAyoub1024.jpg"
  },
  {
    "copyright": "Domingo Pestana",
    "date": "2020-10-18",
    "explanation":
        "What's happening to this spiral galaxy? Although details remain uncertain, it surely has to do with an ongoing battle with its smaller galactic neighbor. The featured galaxy is labelled UGC 1810 by itself, but together with its collisional partner is known as Arp 273. The overall shape of UGC 1810 -- in particular its blue outer ring -- is likely a result of wild and violent gravitational interactions. This ring's blue color is caused by massive stars that are blue hot and have formed only in the past few million years.  The inner galaxy appears older, redder, and threaded with cool filamentary dust.  A few bright stars appear well in the foreground, unrelated to UGC 1810, while several galaxies are visible well in the background.  Arp 273 lies about 300 million light years away toward the constellation of Andromeda.  Quite likely, UGC 1810 will devour its galactic sidekick over the next billion years and settle into a classic spiral form.    APOD in world languages: Arabic, Catalan, Chinese (Beijing), Chinese (Taiwan), Croatian, Czech, Dutch, Farsi, French, German, Hebrew, Indonesian, Japanese, Korean, Montenegrin, Polish, Russian, Serbian, Slovenian,  Spanish, Turkish, Turkish, and  Ukrainian",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/Arp273Main_HubblePestana_3079.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "UGC 1810: Wildly Interacting Galaxy from Hubble",
    "url":
        "https://apod.nasa.gov/apod/image/2010/Arp273Main_HubblePestana_1080.jpg"
  },
  {
    "date": "2020-10-19",
    "explanation":
        "Are you willing to wait to see the largest and oldest known storm system in the Solar System?  In the featured video, Jupiter's Great Red Spot finally makes its appearance 2 minutes and 12 seconds into the 5-minute video.  Before it arrives, you may find it pleasing to enjoy the continually changing view of the seemingly serene clouds of Jupiter, possibly with your lights low and sound up.  The 41 frames that compose the video were captured in June as the robotic Juno spacecraft was making a close pass over our Solar System's largest planet. The time-lapse sequence actually occurred over four hours.  Since arriving at Jupiter in 2016, Juno's numerous discoveries have included unexpectedly deep atmospheric jet streams, the most powerful auroras ever recorded, and water-bearing clouds bunched near Jupiter's equator.   Follow: Live coverage of tomorrow's OSIRIS-REx attempted touchdown-and-go on asteroid Bennu",
    "media_type": "video",
    "service_version": "v1",
    "thumbnail_url": "https://img.youtube.com/vi/xh3EKDghbuU/0.jpg",
    "title": "A Flight over Jupiter Near the Great Red Spot",
    "url": "https://www.youtube.com/embed/xh3EKDghbuU"
  },
  {
    "copyright": "Giorgia Hofer",
    "date": "2020-10-20",
    "explanation":
        "Saturn and Jupiter are getting closer. Every night that you go out and check for the next two months, these two bright planets will be even closer together on the sky.  Finally, in mid-December, a Great Conjunction will occur -- when the two planets will appear only 0.1 degrees apart -- just one fifth the angular diameter of the full Moon. And this isn't just any Great Conjunction -- Saturn (left) and Jupiter (right) haven't been this close since 1623, and won't be nearly this close again until 2080.  This celestial event is quite easy to see -- already the two planets are easily visible toward the southwest just after sunset -- and already they are remarkably close. Pictured, the astrophotographer and partner eyed the planetary duo above the Tre Cime di Lavaredo (Three Peaks of Lavaredo) in the Italian Alps about two weeks ago.    Follow: Live coverage of today's OSIRIS-REx attempted touchdown-and-go on asteroid Bennu",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/JupiterSaturnPeaks_Hofer_1200.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Saturn and Jupiter over Italian Peaks",
    "url":
        "https://apod.nasa.gov/apod/image/2010/JupiterSaturnPeaks_Hofer_960.jpg"
  },
  {
    "copyright": "Tomáš Slovinský",
    "date": "2020-10-21",
    "explanation":
        "How many famous sky objects can you find in this image?  The featured dark sky composite combines over 60 exposures spanning over 220 degrees to create a veritable menagerie of night sky wonders. Visible celestial icons include the Belt of Orion, the Orion Nebula, the Andromeda Galaxy, the California Nebula, and bright stars Sirius and Betelgeuse.  You can verify that you found these, if you did, by checking an annotated version of the image.  A bit harder, though, is finding Polaris and the Big Dipper. Also discernible are several meteors from the Quandrantids meteor shower, red and green airglow, and two friends of the astrophotographer.  The picture was captured in January from Sardinia, Italy.  You can see sky wonders in your own night sky tonight -- including more meteors than usual -- because tonight is near peak of the yearly Orionids meteor shower.   News: NASA’s OSIRIS-REx Spacecraft Successfully Touches Asteroid",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/Quantrids_Slovinsky_2048.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "A Night Sky Vista from Sardinia",
    "url": "https://apod.nasa.gov/apod/image/2010/Quantrids_Slovinsky_960.jpg"
  },
  {
    "date": "2020-10-22",
    "explanation":
        "On October 20, after a careful approach to the boulder-strewn surface, the OSIRIS-REx spacecraft's arm reached out and touched asteroid Bennu. Dubbed a Touch-And-Go (TAG) sampling event, the 30 centimeter wide sampling head (TAGSAM) appears to crush some of the rocks in this snapshot. The close-up scene was recorded by the spacecraft's SamCam some 321 million kilometers from planet Earth, just after surface contact. One second later, the spacecraft fired nitrogen gas from a bottle intended to blow a substantial amount of Bennu's regolith into the sampling head, collecting the loose surface material. Data show the spacecraft spent approximately 5 more seconds in contact with Bennu's Nightingale sample site and then performed its back-away burn. Timelapse frames from SamCam reveal the aftermath.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/E_tag_aftermath.gif",
    "media_type": "image",
    "service_version": "v1",
    "title": "Tagging Bennu",
    "url": "https://apod.nasa.gov/apod/image/2010/d_tag-2-frames.jpg"
  },
  {
    "date": "2020-10-23",
    "explanation":
        "Big, beautiful, barred spiral galaxy NGC 2525 lies 70 million light-years from the Milky Way. It shines in Earth's night sky within the boundaries of the southern constellation Puppis. About 60,000 light-years across, its spiral arms lined with dark dust clouds, massive blue stars, and pinkish starforming regions wind through this gorgeous Hubble Space Telescope snapshot. Spotted on the outskirts of NGC 2525 in January 2018, supernova SN 2018gv is the brightest star in the frame at the lower left. In time-lapse, a year long series of Hubble observations followed the stellar explosion, the nuclear detonation of a white dwarf star triggered by accreting material from a companion star, as it slowly faded from view. Identified as a Type Ia supernova, its brightness is considered a cosmic standard candle. Type Ia supernovae are used to measure distances to galaxies and determine the expansion rate of the Universe.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/STScI_NGC2525_1865x2000.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Supernova in NGC 2525",
    "url": "https://apod.nasa.gov/apod/image/2010/STScI_NGC2525_955x1024.jpg"
  },
  {
    "copyright": "Jose Mtanous",
    "date": "2020-10-24",
    "explanation":
        "Globular star cluster 47 Tucanae is a jewel of the southern sky. Also known as NGC 104, it roams the halo of our Milky Way Galaxy along with some 200 other globular star clusters. The second brightest globular cluster (after Omega Centauri) as seen from planet Earth, it lies about 13,000 light-years away and can be spotted naked-eye close on the sky to the Small Magellanic Cloud in the constellation of the Toucan. The dense cluster is made up of hundreds of thousands of stars in a volume only about 120 light-years across. Red giant stars on the outskirts of the cluster are easy to pick out as yellowish stars in this sharp telescopic portrait. Tightly packed globular cluster 47 Tuc is also home to a star with the closest known orbit around a black hole.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/ngc104v1Mtanous.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Globular Star Cluster 47 Tuc",
    "url": "https://apod.nasa.gov/apod/image/2010/ngc104v1Mtanous_1024.jpg"
  },
  {
    "copyright": "Tom AbelRalf KaehlerKIPACSLACAMNH",
    "date": "2020-10-25",
    "explanation":
        "Is our universe haunted?  It might look that way on this dark matter map.  The gravity of unseen dark matter is the leading explanation for why galaxies rotate so fast, why galaxies orbit clusters so fast, why gravitational lenses so strongly deflect light, and why visible matter is distributed as it is both in the local universe and on the cosmic microwave background.  The featured image from the American Museum of Natural History's Hayden Planetarium previous Space Show Dark Universe highlights one example of how pervasive dark matter might haunt our universe.  In this frame from a detailed computer simulation, complex filaments of dark matter, shown in black, are strewn about the universe like spider webs, while the relatively rare clumps of familiar baryonic matter are colored orange. These simulations are good statistical matches to astronomical observations.  In what is perhaps a scarier turn of events, dark matter -- although quite strange and in an unknown form -- is no longer thought to be the strangest source of gravity in the universe. That honor now falls to dark energy, a more uniform source of repulsive gravity that seems to now dominate the expansion of the entire universe.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/DarkMatter_KipacAmnh_1200.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Dark Matter in a Simulated Universe",
    "url": "https://apod.nasa.gov/apod/image/2010/DarkMatter_KipacAmnh_960.jpg"
  },
  {
    "copyright": "Bogdan Jarzyna",
    "date": "2020-10-26",
    "explanation":
        "Do any shapes seem to jump out at you from this interstellar field of stars and dust?  The jeweled expanse, filled with faint, starlight-reflecting clouds, drifts through the night in the royal constellation of Cepheus. Far from your own neighborhood on planet Earth, these ghostly apparitions lurk along the plane of the Milky Way at the edge of the Cepheus Flare molecular cloud complex some 1,200 light-years away. Over two light-years across and brighter than the other spooky chimeras, VdB 141 or Sh2-136 is also known as the Ghost Nebula, seen at toward the bottom of the featured image. Within the reflection nebula are the telltale signs of dense cores collapsing in the early stages of star formation.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/GhostNebula_Jarzyna_960.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Reflections of the Ghost Nebula",
    "url": "https://apod.nasa.gov/apod/image/2010/GhostNebula_Jarzyna_960.jpg"
  },
  {
    "date": "2020-10-27",
    "explanation":
        "What would an erupting volcano on Venus look like? Evidence of currently active volcanoes on Venus was announced earlier this year with the unexplained warmth of regions thought to contain only ancient volcanoes.  Although large scale images of Venus have been taken with radar, thick sulfuric acid clouds would inhibit the taking of optical light vistas. Nevertheless, an artist's reconstruction of a Venusian volcano erupting is featured. Volcanoes could play an important role in a life cycle on Venus as they could push chemical foods into the cooler upper atmosphere where hungry microbes might float.  Pictured, the plume from an erupting volcano billows upwards, while a vast lava field covers part of the hot and cracked surface of Earth's overheated twin.  The possibility of airborne microbial Venusians is certainly exciting, but currently controversial.    An APOD Described on TikTok: By astrokirsten",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/VenusVolcano_NasaRubin_1600.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Venusian Volcano Imagined",
    "url":
        "https://apod.nasa.gov/apod/image/2010/VenusVolcano_NasaRubin_1080.jpg"
  },
  {
    "copyright": "Steven Mohr",
    "date": "2020-10-28",
    "explanation":
        "Why is the Lobster Nebula forming some of the most massive stars known? No one is yet sure.  Cataloged as NGC 6357, the Lobster Nebula houses the open star cluster Pismis 24 near its center -- a home to unusually bright and massive stars.  The overall blue glow near the inner star forming region results from the emission of ionized hydrogen gas.   The surrounding nebula, featured here, holds a complex tapestry of gas, dark dust, stars still forming, and newly born stars.  The intricate patterns are caused by complex interactions between interstellar winds, radiation pressures, magnetic fields, and gravity.  NGC 6357 spans about 400 light years and lies about 8,000 light years away toward the constellation of the Scorpion.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/Lobster_Mohr_2048.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "NGC 6357: The Lobster Nebula",
    "url": "https://apod.nasa.gov/apod/image/2010/Lobster_Mohr_1080.jpg"
  },
  {
    "copyright": "Casey Good/Steve Timmons",
    "date": "2020-10-29",
    "explanation":
        "Inspired by the halloween season, this telescopic portrait captures a cosmic cloud with a scary visage. The interstellar scene lies within the dusty expanse of reflection nebula IC 2118 in the constellation Orion, the Hunter. IC 2118 is about 800 light-years from your neighborhood, close to bright bluish star Rigel at Orion's foot. Often identified as the Witch Head nebula for its appearance in a wider field of view it now rises before the witching hour. With spiky stars for eyes, the ghoulish apparition identified here seems to extend an arm many light-years long toward Orion's hot supergiant star. The source of illumination for IC 2118, Rigel is just beyond this frame at the upper left.",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/GhoulGood.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "The Ghoul of IC 2118",
    "url": "https://apod.nasa.gov/apod/image/2010/GhoulGood_1024.jpg"
  },
  {
    "copyright": "Dennis Simmons",
    "date": "2020-10-30",
    "explanation":
        "On Halloween fear and dread will stalk your night skies, also known as Phobos and Deimos the moons of Mars. The 2020 opposition of Mars was on October 13, so the Red Planet will still rise shortly before sunset. Near Halloween's Full Moon on the sky, its strange yellowish glow will outshine other stars throughout the night. But the two tiny Martian moons are very faint and in close orbits, making them hard to spot, even with a small telescope. You can find them in this carefully annotated composite view though. The overexposed planet's glare is reduced and orbital paths for inner moon Phobos and outer moon Deimos are overlayed on digitally combined images captured on October 6. The diminutive moons of Mars were discovered in August of 1877 by astronomer Asaph Hall at the US Naval Observatory using the Great Equatorial 26-inch Alvan Clark refractor",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2010/PhobosDeimosOrbitTimesAnnotatedcopy.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Fear and Dread: The Moons of Mars",
    "url":
        "https://apod.nasa.gov/apod/image/2010/PhobosDeimosOrbitTimesAnnotatedcopy.jpg"
  },
  {
    "date": "2020-10-31",
    "explanation":
        "re extreme and terrifying realms of the Universe tonight. If you dare to look, mysterious dark matter, a graveyard galaxy, zombie worlds, and gamma-ray bursts of doom are not all that awaits. Just follow the link and remember, it's all based on real science, even the scary parts. Have a safe and happy halloween!",
    "hdurl": "https://apod.nasa.gov/apod/image/2010/1c-english-triplet-16.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "A Galaxy of Horrors",
    "url": "https://apod.nasa.gov/apod/image/2010/1c-english-triplet-16.jpg"
  },
  {
    "date": "2020-11-01",
    "explanation":
        "What's happening at the center of the Trifid Nebula? Three prominent dust lanes that give the Trifid its name all come together. Mountains of opaque dust appear near the bottom, while other dark filaments of dust are visible threaded throughout the nebula.  A single massive star visible near the center causes much of the Trifid's glow.  The Trifid, cataloged as M20, is only about 300,000 years old, making it among the youngest emission nebulas known.  The star forming nebula lies about 9,000 light years away toward the constellation of the Archer (Sagittarius). The region pictured here spans about 10 light years.  The featured image is a composite with luminance taken from an image by the 8.2-m ground-based Subaru Telescope, detail provided by the 2.4-m orbiting Hubble Space Telescope, color data provided by Martin Pugh and image assembly and processing provided by Robert Gendler.   Portal Universe: Random APOD Generator",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2011/Trifid_HubbleGendler_2400.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "In the Center of the Trifid Nebula",
    "url": "https://apod.nasa.gov/apod/image/2011/Trifid_HubbleGendler_960.jpg"
  },
  {
    "copyright": "Rainee Colacurcio",
    "date": "2020-11-02",
    "explanation":
        "What's happening to the Sun? Clearly, the Sun's lower half is hidden behind a thick cloud.  Averaging over the entire Earth, clouds block the Sun about 2/3rds of the time, although much less over many land locations. On the Sun's upper right is a prominence of magnetically levitating hot gas. The prominence might seem small but it could easily envelop our  Earth and persist for over a month.  The featured image is a combination of two exposures, one optimizing the cloud and prominence, and the other optimizing the Sun's texture.  Both were taken about an hour apart with the same camera and from the same location in Lynnwood, Washington, USA.  The shaggy texture derives from the Sun's chromosphere, an atmospheric layer that stands out in the specifically exposed color.  The uniformity of the texture shows the surface to be relatively calm, indicative of a Sun just past the solar minimum in its 11-year cycle. In the years ahead, the Sun will progress toward a more active epoch where sunspots, prominences, and ultimately auroras on Earth will be more common: solar maximum.    Gallery: Notable images of the Halloween Blue Moon of 2020 submitted to APOD",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2011/HalfSunProm_Colacurcio_2974.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Half Sun with Prominence",
    "url":
        "https://apod.nasa.gov/apod/image/2011/HalfSunProm_Colacurcio_960.jpg"
  },
  {
    "date": "2020-11-03",
    "explanation":
        "This is what it looks like to punch an asteroid. Last month, NASA's robotic spacecraft OSIRIS-REx descended toward, thumped into, and then quickly moved away from the small near-Earth asteroid 101955 Bennu.  The featured video depicts the Touch-And-Go (TAG) sampling event over a three-hour period.  As the movie begins, the automated probe approaches the 500-meter, diamond-shaped, space rock as it rotates noticeably below. About 20 seconds into the video, Nightingale comes into view -- a touchdown area chosen to be relatively flat and devoid of large boulders that could damage the spaceship.  At 34 seconds, the shadow of OSIRIS-REx's sampling arm suddenly comes into view, while very soon thereafter rocks and gravel fly from the arm's abrupt hard impact.  The wily spacecraft was able to capture and successfully stow some of Bennu's ejecta for return to Earth for a detailed analysis.  This long return is scheduled to start in 2021 March with arrival back on Earth in 2023 September. If the return sample does successfully reach Earth, it will be scrutinized for organic compounds that might have seeded a young Earth, rare or unusual elements and minerals, and clues about the early history of our Solar System.",
    "media_type": "video",
    "service_version": "v1",
    "thumbnail_url": "https://img.youtube.com/vi/F6Tkb8syTK8/0.jpg",
    "title": "Tagging Bennu: The Movie",
    "url": "https://www.youtube.com/embed/F6Tkb8syTK8?rel=0"
  },
  {
    "date": "2020-11-04",
    "explanation":
        "Over fifty gravitational wave events have now been detected. These events mark the distant, violent collisions of two black holes, a black hole and a neutron star, or two neutron stars.  Most of the 50 events were detected in 2019 by the LIGO gravitational wave detectors in the USA and the VIRGO detector in Europe.  In the featured illustration summarizing the masses of the first 50 events, blue dots indicate higher-mass black holes while orange dots denote lower-mass neutron stars. Astrophysicists are currently uncertain, though, about the nature of events marked in white involving masses that appear to be in the middle -- between two and five solar masses.  The night sky in optical light is dominated by nearby and bright planets and stars that have been known since the dawn of humanity. In contrast, the sky in gravitational waves is dominated by distant and dark black holes  that have only been known about for less than five years.  This contrast is enlightening -- understanding the gravitational wave sky is already reshaping humanity's knowledge not only of star birth and death across the universe, but properties of the universe itself.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2011/GWaveSources2020Oct_LigoVIrgo_2977.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Fifty Gravitational Wave Events Illustrated",
    "url":
        "https://apod.nasa.gov/apod/image/2011/GWaveSources2020Oct_LigoVIrgo_960.jpg"
  },
  {
    "copyright": "Terry Hancock",
    "date": "2020-11-05",
    "explanation":
        "Bright stars, interstellar clouds of dust and glowing nebulae fill this cosmic scene, a skyscape just north of Orion's belt. Close to the plane of our Milky Way Galaxy, the wide field view spans just under 5 degrees or about 10 full moons on the sky. Striking bluish M78, a reflection nebula, is at the lower right. M78's tint is due to dust preferentially reflecting the blue light of hot, young stars. In colorful contrast, the red swath of glowing hydrogen gas streaming through the center is part of the region's faint but extensive emission nebula known as Barnard's Loop. At upper left, a dark dust cloud forms a prominent silhouette cataloged as LDN 1622. While M78 and the complex Barnard's Loop are some 1,500 light-years away, LDN 1622 is likely to be much closer, only about 500 light-years distant from our fair planet Earth.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2011/M78_LDN1622_BarnardsLoop_SEP27_28_Oct15_final2048.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "North of Orion's Belt",
    "url":
        "https://apod.nasa.gov/apod/image/2011/M78_LDN1622_BarnardsLoop_SEP27_28_Oct15_final1024.jpg"
  },
  {
    "copyright": "Derek Demeter",
    "date": "2020-11-06",
    "explanation":
        "Completing one orbit of our fair planet in 90 minutes the International Space Station can easily be spotted by eye as a very bright star moving through the night sky. Have you seen it? The next time you do, you will have recognized the location of over 20 years of continuous human presence in space. In fact, the Expedition 1 crew to the ISS docked with the orbital outpost some 400 kilometers above the Earth on November 2, 2000. No telescope is required to spot the ISS flashing through the night. But this telescopic field of view does reveal remarkable details of the space station captured as it transited the waning gibbous moon on November 3, just one day after the space age milestone. The well-timed telescopic snapshot also contains the location of another inspirational human achievement. About 400,000 kilometers away, the Apollo 11 landing site on the dark, smooth lunar Sea of Tranquility is to the right of the ISS silhouette.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2011/ISSlunartransit110320closeup.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Moon over ISS",
    "url":
        "https://apod.nasa.gov/apod/image/2011/ISSlunartransit110320closeup1024.jpg"
  },
  {
    "copyright": "Howard Trottier",
    "date": "2020-11-07",
    "explanation":
        "These are galaxies of the Hercules Cluster, an archipelago of island universes a mere 500 million light-years away. Also known as Abell 2151, this cluster is loaded with gas and dust rich, star-forming spiral galaxies but has relatively few elliptical galaxies, which lack gas and dust and the associated newborn stars. The colors in this deep composite image clearly show the star forming galaxies with a blue tint and galaxies with older stellar populations with a yellowish cast. The sharp picture spans about 1/2 degree across the cluster center, corresponding to over 4 million light-years at the cluster's estimated distance. Diffraction spikes around brighter foreground stars in our own Milky Way galaxy are produced by the imaging telescope's mirror support vanes. In the cosmic vista many galaxies seem to be colliding or merging while others seem distorted - clear evidence that cluster galaxies commonly interact. In fact, the Hercules Cluster itself may be seen as the result of ongoing mergers of smaller galaxy clusters and is thought to be similar to young galaxy clusters in the much more distant, early Universe.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2011/Abell2151_Howard_Trottier_2020_FFTelescope1024.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "The Hercules Cluster of Galaxies",
    "url":
        "https://apod.nasa.gov/apod/image/2011/Abell2151_Howard_Trottier_2020_FFTelescope1024.jpg"
  },
  {
    "date": "2020-11-08",
    "explanation":
        "Why is Phobos so dark?  Phobos, the largest and innermost of two Martian moons, is the darkest moon in the entire Solar System.  Its unusual orbit and color indicate that it may be a captured asteroid composed of a mixture of ice and dark rock.  The featured picture of Phobos near the limb of Mars was captured in 2010 by the robot spacecraft Mars Express currently orbiting Mars.  Phobos is a heavily cratered and barren moon, with its largest crater located on the far side.  From images like this, Phobos has been determined to be covered by perhaps a meter of loose dust.  Phobos orbits so close to Mars that from some places it would appear to rise and set twice a day, but from other places it would not be visible at all.  Phobos' orbit around Mars is continually decaying -- it will likely break up with pieces crashing to the Martian surface in about 50 million years.",
    "hdurl":
        "https://apod.nasa.gov/apod/image/2011/phoboslimb_marsexpress_2592.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Martian Moon Phobos from Mars Express",
    "url":
        "https://apod.nasa.gov/apod/image/2011/phoboslimb_marsexpress_960.jpg"
  }
];
