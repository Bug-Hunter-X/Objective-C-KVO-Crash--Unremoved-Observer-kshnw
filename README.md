# Objective-C KVO Crash: Unremoved Observer

This repository demonstrates a common but easily overlooked bug in Objective-C: failing to remove a Key-Value Observer (KVO) before the observed object is deallocated. This leads to a crash.  The `bug.m` file shows the problematic code.  `bugSolution.m` provides a corrected version.