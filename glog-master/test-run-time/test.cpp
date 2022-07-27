#include "glog/logging.h"
#include <iomanip>

    void CustomPrefix(std::ostream &s, const google::LogMessageInfo &l, void*) {
       s << l.severity[0]
       << std::setw(4) << 1900 + l.time.year() <<'/'
       << std::setw(2) << 1 + l.time.month() <<'/'
       << std::setw(2) << l.time.day()
       << ' '
       << std::setw(2) << l.time.hour() << ':'
       << std::setw(2) << l.time.min()  << ':'
       << std::setw(2) << l.time.sec() << "."
       << std::setw(6) << l.time.usec()
       << ' '
       << std::setfill(' ') << std::setw(5)
       << l.thread_id << std::setfill('0')
       << ' '
       << l.filename << ':' << l.line_number << "]"
       << "CUSTOM PREFIX";
    }

int main(int argc, char** argv) {
    google::InitGoogleLogging(argv[0], &CustomPrefix);
    FLAGS_logtostdout = true;
    FLAGS_colorlogtostdout = true;
    FLAGS_colorlogtostderr = true;
    google::InstallFailureSignalHandler();
    // gflags::ParseCommandLineFlags(&argc, &argv, false);
    LOG(INFO) << "Run time linking to glog lib success.";
    LOG(WARNING) << "Run time linking to glog lib success.";
    LOG(ERROR) << "Run time linking to glog lib success.";
    LOG(INFO) << "gflags version string: " << std::string(gflags::VersionString());
}