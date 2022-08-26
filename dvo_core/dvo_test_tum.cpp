#include "vss/vss.h"
#include "glog/logging.h"

void CustomPrefix(std::ostream &s, const google::LogMessageInfo &l, void *data) {
    s << l.severity[0] << std::setw(1) << "[" <</* 1900 + l.time.year() << '/' << std::setw(2)
      << 1 + l.time.month() << '/' << std::setw(2) << l.time.day() << ' ' << std::setw(2)
      << l.time.hour() << ':' << std::setw(2) << l.time.min() << ':' << std::setw(2) << l.time.sec()
      << "." << std::setw(6) << l.time.usec() << ' ' << std::setfill(' ') << std::setw(5)
      << l.thread_id << std::setfill('0') << ' ' << */l.filename << ':' << l.line_number << "]"
      << "[DVO]";
}

int main(int argc, char **argv) {
	FLAGS_logtostdout = true;
	FLAGS_colorlogtostdout = true;
	FLAGS_colorlogtostderr = true;
	google::InitGoogleLogging(argv[0], &CustomPrefix);
	DLOG(INFO) << "INFO.";
	DLOG(WARNING) << "WARNNING.";
	DLOG(ERROR) << "ERROR.";
	return 0;
}