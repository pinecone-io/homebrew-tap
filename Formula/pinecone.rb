class Pinecone < Formula
    desc "The Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    license "Apache-2.0"
  
    head do
      url "", branch: "main"
  
      depends_on "go@1.22" => :build if build.head?
    end
  
    bottle :unneeded
  
    option "without-completion", "Do not install shell completion"
    
    depends_on OS.linux? ? :linux : :macos
  
    def install
      if build.head?
        ENV["CGO_ENABLED"] = "0"
        ENV["GOGC"] = "off"
  
        ENV.prepend_create_path "PATH", "#{HOMEBREW_PREFIX}/bin"
        ENV.prepend_create_path "PATH", buildpath/"bin"
  
        cd buildpath do
          package = "github.com/pinecone-io/cli/internal/build"
          
          sha = Utils.safe_popen_read("git", "rev-parse", "--short", "HEAD").strip
          tag = Utils.safe_popen_read("git", "describe", "--tags", "--abbrev=0").strip
          date = Utils.safe_popen_read("git", "log", "-1", "--format=\"%cd\"", "--date=format:\"%Y-%m-%d\"").strip
          
          ldflags = %W[
            -s -w
            -X #{package}.Date=#{date}
            -X #{package}.Commit=#{version.commit}
            -X #{package}.Version="#{tag}-homebrew-SNAPSHOT-#{sha}"
          ].join(" ")
  
          system "go", "mod", "tidy"
          system "go", "build", *std_go_args(ldflags: ldflags)
  
          unless build.without? "completion"
            output = Utils.safe_popen_read("#{bin}/", "completion", "bash")
            (bash_completion/"").write output
  
            output = Utils.safe_popen_read("#{bin}/", "completion", "zsh")
            (zsh_completion/"_").write output
  
            output = Utils.safe_popen_read("#{bin}/", "completion", "fish")
            (fish_completion/".fish").write output
          end
        end
      end
  
      if OS.mac? && MacOS.version >= :catalina
        if /com.apple.quarantine/.match?(Utils.safe_popen_read("xattr #{bin}/"))
          (bin/"").chmod 0755
          begin
            system "xattr", "-d",
                            "com.apple.quarantine",
                            bin/""
          ensure
            (bin/"").chmod 0555
          end
        end
      end
  
      prefix.install_metafiles
    end
  
    def caveats
      <<~EOS
      EOS
    end
  
    test do
      assert_predicate bin/"", :exist?
      system "", "--help"
    end
  end