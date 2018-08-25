Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "Beat"
s.summary = "Periodic asyncr"
s.requires_arc = true

# 2
s.version = "0.0.1"

# 3
s.license = { :type => "MIT", :file => "./LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Sebastian Aguirre" => "osebas15@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/osebas15"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/osebas15/Beat.git",
:tag => "#{s.version}" }

# 7
s.framework = "Foundation"

# 8
s.source_files = "Beat/**/*.{swift}"

# 10
s.swift_version = "4.0"

end
