JsOsaDAS1.001.00bplist00�Vscript_~ObjC.import("AppKit");

function run(argv) { 
  if (argv.length > 0) {
  	url = argv[0];
	$.NSLog("[thunder.scpt] url to download: %@", url);
  	thunderAppIdentifier = "com.xunlei.Thunder";

	progress = $.NSProgress.currentProgress
	nc = $.NSDistributedNotificationCenter.defaultCenter;
	dict = {
		"url" : url
	};

	apps = $.NSRunningApplication.runningApplicationsWithBundleIdentifier(thunderAppIdentifier);
	if (apps.count > 0) {
		thunder = apps.objectAtIndex(0);
		thunder.activateWithOptions(1<<1);
	} else {
		$.NSWorkspace.sharedWorkspace.launchApplication("Thunder");
		delay(1);
		apps = $.NSRunningApplication.runningApplicationsWithBundleIdentifier(thunderAppIdentifier);
		if (apps.count > 0) {
			thunder = apps.objectAtIndex(0);
			thunder.activateWithOptions(1<<1);
		}
	}

	nc.postNotificationNameObjectUserInfo("XLNewTaskNotification", "com.xunlei.thunderplugin", dict);
  }
}                              �jscr  ��ޭ