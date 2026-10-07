# Super-Tier Magic 2.3.1 build record

No Minecraft client or gameplay test was launched.
Fire meteors discard ItemEntity instances inside their swept eight-block-radius cylinder. Each exposed collision surface has a 20% ignition attempt; fire replaces only air and must pass the vanilla survival check.
ArtifactRange snapshots supported enchantment levels at cast time, adding five blocks per level, including Unbreaking and Mending. Actual fire/thunder strike distribution, Sword Intent area hits, domain targeting and ghost trajectories use the expanded radius; clients receive the same coverage for primary seals, layers, inscriptions and lighting.
Advancement parents follow recipe dependencies. Item criteria are server-controlled; crafting, pickup and inventory checks record acquisition. Parent completion is enforced for every award. Pending qualifying events are retained until prerequisites complete, avoiding item consumption or immediate-cast races. Existing earned progress is preserved.
All 16 custom advancement JSON files parse; graph prerequisites exist and are acyclic.
Protocol 14 adds coverage to BladeEffect and SwordEffect; both server and clients must update.
Forge compilation and reobfJar passed. Gradle test is NO-SOURCE, not gameplay verification.
Log: downloads/release-2.3.1-build.log.