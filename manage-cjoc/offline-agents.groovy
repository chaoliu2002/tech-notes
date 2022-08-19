import hudson.slaves.OfflineCause

for (aSlave in hudson.model.Hudson.instance.slaves) {
  if (aSlave.name == 'agent-teams-star-0-co-37vbn') {
    println aSlave.name
    aSlave.getComputer().setTemporarilyOffline(true, OfflineCause.create(Messages._CauseOfInterruption_ShortDescription("catch up new npmrc")))
    //aSlave.getComputer().setTemporarilyOffline(true)
  }
}
