// Run this in cjod script console
// https://build.devsnc.com/cjoc/script

def mms = Jenkins.instance.getAllItems(com.cloudbees.opscenter.server.model.ManagedMaster)

mms.each {
  println it.getName()
}
println ""