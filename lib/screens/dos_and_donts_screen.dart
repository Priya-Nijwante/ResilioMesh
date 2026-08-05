import 'package:flutter/material.dart';

class DosAndDontsScreen extends StatelessWidget {
  const DosAndDontsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'Flood', 'icon': Icons.flood_rounded, 'color': Colors.blue},
      {'title': 'Fire', 'icon': Icons.local_fire_department_rounded, 'color': Colors.deepOrange},
      {'title': 'Earthquake', 'icon': Icons.terrain_rounded, 'color': Colors.brown},
      {'title': 'Cyclone / Storm', 'icon': Icons.air_rounded, 'color': Colors.cyan},
      {'title': 'Building Collapse', 'icon': Icons.domain_disabled_rounded, 'color': Colors.grey},
      {'title': 'Medical Emergency', 'icon': Icons.medical_services_rounded, 'color': Colors.red},
      {'title': 'Electrical Hazard', 'icon': Icons.electrical_services_rounded, 'color': Colors.amber},
      {'title': 'Chemical Leak', 'icon': Icons.science_rounded, 'color': Colors.purple},
      {'title': 'General Safety', 'icon': Icons.security_rounded, 'color': Colors.indigo},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("Do's & Don'ts"),
        backgroundColor: const Color(0xFFFF5252),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 10),
              child: Text(
                'Select a disaster or emergency',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.95,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisasterDetailScreen(
                            title: cat['title'],
                            headerColor: cat['color'],
                            categoryIcon: cat['icon'],
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0A000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(cat['icon'], size: 32, color: cat['color']),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              cat['title'],
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisasterDetailScreen extends StatefulWidget {
  final String title;
  final Color headerColor;
  final IconData categoryIcon;

  const DisasterDetailScreen({
    super.key,
    required this.title,
    required this.headerColor,
    required this.categoryIcon,
  });

  @override
  State<DisasterDetailScreen> createState() => _DisasterDetailScreenState();
}

class _DisasterDetailScreenState extends State<DisasterDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _getDisasterData() {
    switch (widget.title) {
      case 'Flood':
        return {
          'image': 'https://images.unsplash.com/photo-1558448495-5ef3fce92344?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Zmxvb2R8ZW58MHx8MHx8fDA%3D',
          'overview': 'Flooding occurs when heavy rainfall, overflowing rivers, or storm surges overwhelm drainage systems, inundating low-lying land and threatening human life and infrastructure.',
          'dos': [
            'Move to higher ground or upper floors immediately.',
            'Switch off electricity, main breakers, and gas valves safely.',
            'Store clean drinking water, dry rations, and critical medications.',
            'Keep battery-powered or emergency radios tuned for official alerts.',
            'Wear sturdy footwear and avoid contact with stagnant flood waters.'
          ],
          'donts': [
            'Do not walk, swim, or wade through fast-moving flash flood currents.',
            'Do not touch submerged electrical appliances, wires, or power poles.',
            'Do not drive vehicles through flooded roadways or underpasses.',
            'Do not consume food items that have come in direct contact with flood waters.',
            'Do not return to evacuated zones until local authorities give explicit clearance.'
          ],
          'before': 'Identify local flood evacuation routes, compile emergency kits with documents in waterproof bags, and clear home drainage pathways.',
          'during': 'Monitor emergency broadcast channels, secure outdoor furniture, keep mobile communication devices charged, and assist vulnerable neighbors.',
          'after': 'Inspect your property carefully for structural cracks or gas leaks, discard contaminated water, and disinfect living spaces.'
        };
      case 'Fire':
        return {
          'image': 'https://plus.unsplash.com/premium_photo-1661490162121-41df314e1ef1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZpcmV8ZW58MHx8MHx8fDA%3D',
          'overview': 'Uncontrolled fires spread rapidly, producing toxic smoke and extreme heat that can trap individuals and devastate buildings or forest environments within minutes.',
          'dos': [
            'Stay low to the floor beneath the smoke level during evacuation.',
            'Test doors for heat using the back of your hand before opening them.',
            'Cover your mouth and nose with a damp cloth to filter toxic smoke particles.',
            'Utilize stairs for evacuation; never use elevators during a fire emergency.',
            'Assemble at your designated safe meeting point outside immediately.'
          ],
          'donts': [
            'Do not open doors that feel hot to the touch or show smoke leaking through cracks.',
            'Do not re-enter a burning building under any circumstances to retrieve valuables.',
            'Do not panic or run haphazardly if your clothes catch fire; stop, drop, and roll.',
            'Do not overload electrical power sockets or extension multi-plugs.',
            'Do not ignore building fire alarms or warning sirens.'
          ],
          'before': 'Install functional smoke alarms on every level, practice home fire drills, and maintain reachable fire extinguishers.',
          'during': 'Alert nearby occupants instantly, close doors behind you to slow flame progression, and call emergency services.',
          'after': 'Wait for fire safety officials to certify building security before entry, and treat minor burns with cool running water.'
        };
      case 'Earthquake':
        return {
          'image': 'https://plus.unsplash.com/premium_photo-1695914233513-6f9ca230abdb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8RWFydGhxdWFrZXxlbnwwfHwwfHx8MA%3D%3D',
          'overview': 'Sudden and violent tectonic shifts underground cause intense ground shaking that can collapse buildings, rupture utility pipes, and trigger secondary life hazards.',
          'dos': [
            'Drop to your hands and knees immediately before strong shaking knocks you down.',
            'Cover your head and neck, and crawl underneath a sturdy table or desk.',
            'Hold on to your shelter firmly and be prepared to move with it during tremors.',
            'Stay indoors away from exterior windows, glass partitions, and heavy hanging fixtures.',
            'If outdoors, move to an open clearing away from tall structures, trees, and power lines.'
          ],
          'donts': [
            'Do not run outside or rush toward building exits while heavy shaking is actively occurring.',
            'Do not use elevators or lifts under any condition during or immediately after a seismic shock.',
            'Do not stand in doorways, as they offer minimal protection from falling masonry debris.',
            'Do not light matches or use open flames due to potential gas leak hazards.',
            'Do not crowd narrow streets or block disaster response corridors.'
          ],
          'before': 'Secure heavy furniture and tall wall cabinets securely, identify safe indoor shelter spots, and secure breakable items.',
          'during': 'Execute Drop, Cover, and Hold On instantly, and remain sheltered until all ground vibrations completely cease.',
          'after': 'Check family members for traumatic injuries, inspect utility lines for gas or water damage, and expect aftershocks.'
        };
      case 'Cyclone / Storm':
        return {
          'image': 'https://images.unsplash.com/photo-1579004464832-0c014afa448c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fEN5Y2xvbmUlMjAlMkYlMjBTdG9ybXxlbnwwfHwwfHx8MA%3D%3D',
          'overview': 'Severe cyclones and severe storms bring destructive winds, torrential rainfall, and coastal storm surges capable of uprooting trees and destroying weak structures.',
          'dos': [
            'Stay indoors in a designated safe room away from windows and glass doors.',
            'Secure or bring indoors all loose outdoor items like garden furniture and pots.',
            'Unplug sensitive electronic appliances to protect against lightning surges.',
            'Keep emergency battery backups, flashlights, and mobile power banks fully charged.',
            'Stock adequate non-perishable food items and clean bottled drinking water.'
          ],
          'donts': [
            'Do not venture outdoors during the brief calm "eye" of the cyclone.',
            'Do not stand near large windows, glass facades, or weak exterior walls.',
            'Do not ignore weather bulletin updates or local emergency evacuation orders.',
            'Do not use landlines or wired phones unnecessarily during severe thunderstorms.',
            'Do not touch downed power lines or flooded street poles.'
          ],
          'before': 'Reinforce roof structures, board up large windows, and clear loose tree branches around your property.',
          'during': 'Remain sheltered, listen to battery radios for updates, and stay away from external walls.',
          'after': 'Watch out for fallen trees, live electrical wires, and damaged structures when stepping outside.'
        };
      case 'Building Collapse':
        return {
          'image': 'https://media.istockphoto.com/id/1318457726/photo/falling-tower-of-old-grain-elevator-building-after-undermining.jpg?s=612x612&w=0&k=20&c=Rm73TJRQZ3AcmaXOVMWfDE564rmyrLxynXMXsS3olP4=',
          'overview': 'Sudden structural failures can result from construction flaws, soil subsidence, explosions, or major tremors, trapping occupants under heavy debris.',
          'dos': [
            'Take cover under heavy furniture or secure interior structural load-bearing doorways.',
            'Cover your mouth and nose with cloth or clothing to filter concrete dust.',
            'Tap steadily on pipes or walls if trapped so rescue teams can track your location.',
            'Stay calm, conserve your physical energy, and avoid shouting unless rescuers are near.',
            'Evacuate orderly via designated safe fire exits if structural warning signs appear.'
          ],
          'donts': [
            'Do not use elevators or rushed stairwells during an active structural collapse event.',
            'Do not light matches, lighters, or use open flames due to gas line rupture risks.',
            'Do not panic or move heavy blocks of rubble above you haphazardly.',
            'Do not re-enter unstable or partially collapsed structures to rescue belongings.',
            'Do not crowd rescue operation zones or block emergency medical vehicles.'
          ],
          'before': 'Know building evacuation layouts, emergency exits, and ensure clear, unblocked corridors.',
          'during': 'Drop and cover under rigid structures or exit immediately if initial warning cracks occur.',
          'after': 'Move away from the hazard zone, provide basic first aid, and await official clearance.'
        };
      case 'Medical Emergency':
        return {
          'image': 'https://images.unsplash.com/photo-1516549655169-df83a0774514?auto=format&fit=crop&w=800&q=80',
          'overview': 'Critical medical situations such as sudden cardiac arrest, severe trauma, or acute allergic reactions require immediate professional intervention and life support.',
          'dos': [
            'Call local emergency medical services (ambulance hotline) immediately.',
            'Administer CPR or basic first aid if you are trained and certified.',
            'Keep the patient comfortable, warm, and in a stable resting position.',
            'Gather the patient\'s regular medical history, prescriptions, and allergy details.',
            'Clear the surrounding area to ensure adequate ventilation for the patient.'
          ],
          'donts': [
            'Do not move an injured person with potential spinal or neck trauma unnecessarily.',
            'Do not give food, water, or oral medication to an unconscious patient.',
            'Do not panic; keep calm to provide clear details to emergency dispatchers.',
            'Do not leave the patient unattended while awaiting professional medical help.',
            'Do not crowd the patient, ensuring fresh air circulation.'
          ],
          'before': 'Keep emergency medical contacts and first-aid kits readily accessible at home.',
          'during': 'Follow dispatch instructions precisely and assist emergency personnel upon arrival.',
          'after': 'Ensure proper hospital transfer and follow post-care guidance from medical staff.'
        };
      case 'Electrical Hazard':
        return {
          'image': 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&w=800&q=80',
          'overview': 'Electrical faults, overloaded circuits, or direct contact with high-voltage lines pose extreme risks of severe electrocution, burns, and electrical fires.',
          'dos': [
            'Turn off the main electrical circuit breaker immediately before handling faults.',
            'Use non-conductive objects like dry wooden sticks or rubber items to separate victims.',
            'Wear insulated rubber footwear and dry gloves when dealing with minor wiring issues.',
            'Keep water far away from all electrical outlets, distribution boxes, and cords.',
            'Report dangling power lines or transformer explosions to utility providers.'
          ],
          'donts': [
            'Do not touch an electrocuted person directly with bare hands while current flows.',
            'Do not use water to extinguish electrical or transformer fires.',
            'Do not overload wall sockets with multiple high-wattage plug adapters.',
            'Do not touch frayed power cords or operate switches with wet hands.',
            'Do not attempt high-voltage electrical repairs without certified professional training.'
          ],
          'before': 'Install circuit breakers (MCBs/ELCBs) and check home wiring insulation regularly.',
          'during': 'Cut off power sources instantly and keep clear of sparking equipment.',
          'after': 'Get electrical equipment professionally inspected before turning power back on.'
        };
      case 'Chemical Leak':
        return {
          'image': 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?auto=format&fit=crop&w=800&q=80',
          'overview': 'Accidental industrial or household chemical spills release toxic vapors or corrosive liquids that threaten respiratory systems and skin tissue.',
          'dos': [
            'Evacuate the contamination area immediately moving upwind and uphill.',
            'Cover your nose and mouth with a wet cloth or chemical respirator mask.',
            'Wash exposed skin and eyes immediately with copious amounts of clean running water.',
            'Seal indoor ventilation systems, windows, and doors if sheltering in place.',
            'Seek professional emergency medical attention for chemical exposure symptoms.'
          ],
          'donts': [
            'Do not inhale, touch, or taste spilled or leaking chemical substances.',
            'Do not use elevators if evacuating a multi-story facility during a leak.',
            'Do not panic or rush blindly through toxic vapor plumes.',
            'Do not consume food or water exposed to contaminated indoor air environments.',
            'Do not return to the spill zone until hazmat teams declare it completely safe.'
          ],
          'before': 'Store household chemicals securely in labeled containers away from heat sources.',
          'during': 'Evacuate upwind, follow emergency hazmat guidelines, and alert authorities.',
          'after': 'Decontaminate clothing and equipment thoroughly before re-entering exposure zones.'
        };
      default:
        return {
          'image': 'https://images.unsplash.com/photo-1581092335397-9583fe92d232?auto=format&fit=crop&w=800&q=80',
          'overview': 'General safety protocols establish baseline rules for situational awareness, hazard prevention, and emergency preparedness in daily environments.',
          'dos': [
            'Maintain personal calm and evaluate immediate safety risks clearly.',
            'Follow instructions issued by trained emergency response personnel.',
            'Keep emergency communication channels clear for essential coordination.',
            'Provide first-aid assistance to injured individuals if safe to do so.',
            'Keep identification and crucial medical records easily accessible.'
          ],
          'donts': [
            'Do not spread unverified rumors or panic across social networks.',
            'Do not ignore official advisories or safety warning labels.',
            'Do not obstruct active emergency vehicle paths or rescue zones.',
            'Do not consume unverified food sources or untreated water.',
            'Do not attempt high-risk rescue operations without proper training.'
          ],
          'before': 'Prepare structured family response plans and keep emergency supply kits fully updated.',
          'during': 'Prioritize human life safety above property protection and maintain constant vigilance.',
          'after': 'Assess environment safety parameters before resuming normal daily activities.'
        };
    }
  }

  Widget _buildCustomTab(int index, String text) {
    bool isSelected = _tabController.index == index;
    Color activeColor;
    
    if (index == 1) {
      activeColor = Colors.green;
    } else if (index == 2) {
      activeColor = Colors.red;
    } else {
      activeColor = const Color(0xFF1E3A8A);
    }

    return GestureDetector(
      onTap: () => _tabController.animateTo(index),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: (index == 3 && isSelected) || (index == 0 && isSelected)
              ? Border.all(color: activeColor, width: 1.5)
              : null,
        ),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isSelected 
                ? (index == 3 ? activeColor : Colors.white) 
                : const Color(0xFF475569),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _getDisasterData();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFFFF5252),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.network(
                data['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: widget.headerColor.withAlpha(50),
                  child: Icon(widget.categoryIcon, size: 50, color: widget.headerColor),
                ),
              ),
            ),
            
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              child: Row(
                children: [
                  Expanded(flex: 2, child: _buildCustomTab(0, 'Overview')),
                  const SizedBox(width: 3),
                  Expanded(flex: 1, child: _buildCustomTab(1, "Do's")),
                  const SizedBox(width: 3),
                  Expanded(flex: 1, child: _buildCustomTab(2, "Don'ts")),
                  const SizedBox(width: 3),
                  Expanded(flex: 3, child: _buildCustomTab(3, 'Before/During/After')),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE2E8F0)),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0A000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        data['overview'],
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Color(0xFF334155),
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          itemCount: (data['dos'] as List).length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.green.shade200),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.check_circle_rounded, color: Colors.green, size: 20),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      data['dos'][index],
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green.shade900,
                                        height: 1.35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.shield_outlined, color: Colors.green, size: 18),
                            SizedBox(width: 8),
                            Text(
                              'Be prepared. Be safe.',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          itemCount: (data['donts'] as List).length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.red.shade200),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.cancel_rounded, color: Colors.red, size: 20),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      data['donts'][index],
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red.shade900,
                                        height: 1.35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 18),
                            SizedBox(width: 8),
                            Text(
                              'Your safety is more important.',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPhaseCard('BEFORE', data['before'], Colors.blue, Icons.timer_outlined),
                        const SizedBox(height: 12),
                        _buildPhaseCard('DURING', data['during'], Colors.orange, Icons.warning_amber_rounded),
                        const SizedBox(height: 12),
                        _buildPhaseCard('AFTER', data['after'], Colors.purple, Icons.task_alt_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseCard(String phaseTitle, String phaseText, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(
                phaseTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            phaseText,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.45,
              color: Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }
}