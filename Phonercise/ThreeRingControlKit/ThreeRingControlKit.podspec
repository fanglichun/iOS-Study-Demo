  s.name         = "ThreeRingControlKit"
  s.version      = "0.0.1"
  s.summary      = "A three-ring control like the Activity status bars"


  s.description  = "The three-ring is a completely customizable widget that can be used in any iOS app. It also plays a little victory fanfare."
  s.homepage     = "http://raywenderlich.com"

  s.license      = "MIT"

  s.author             = { "mfang032" => "michal.fang@pwc.com" }

  s.platform     = :ios, "10.0"


  s.source       = { :path => '.' }


  s.source_files = "ThreeRingControlKit", "ThreeRingControlKit/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"

  s.resources  = "ThreeRingControlKit/*.mp3"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }


end
