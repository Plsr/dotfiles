set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;
set -gx PATH /usr/local/opt/mysql@5.7/bin $PATH;
#set -gx LIBRARY_PATH LIBRARY_PATH:/usr/local/opt/openssl/lib/;

set --export JAVA_HOME /Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home;
set -gx PATH $JAVA_HOME/bin $PATH;
set -gx PATH $PATH ~/.cargo/bin

status --is-interactive; and source (rbenv init -|psub);
pyenv init - | source

#source ~/.cache/wal/colors.fish
#command cat ~/.cache/wal/sequences

fish_add_path /opt/homebrew/bin

source /opt/homebrew/opt/asdf/libexec/asdf.fish

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/christianpoplawski/google-cloud-sdk/path.fish.inc' ]; . '/Users/christianpoplawski/google-cloud-sdk/path.fish.inc'; end
