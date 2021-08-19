// jenkins script console
Jenkins.instance.getItemByFullName("JOBNAME").updateNextBuildNumber(666)  // input in 'manage jenkins'->'script console'. changes the next build's number to 666 for job JOBNAME.
println "Job type: ${Jenkins.getInstance().getItem("MYJOB").getClass()}"  // input in 'manage jenkins'->'script console'. prints the job type of job MYJOB.
// jenkins pipeline (imperative)
x = sh(returnStdout: true, script: "echo value").trim()  // capture shell output into var x.
(x, y, z) = v.tokenize(".")  // split string at dots to variables.
// jenkins pipeline (declerative)
stash(includes: "target/", name: "build_output")  // stashes a workspace artifact (such as "target/") between stages/workers in a jenkins pipeline.
unstash("build_output")  // retrieves above stashed artifact to current workspace.
sh("mvn help:effective-pom -Doutput=/tmp/effective-pom.xml")  // save effective-pom.xml to output file.

