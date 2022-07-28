#include "glog/logging.h"
#include <iomanip>

#define EIGEN_USE_BLAS
#define EIGEN_USE_LAPACKE_STRICT
#define lapack_complex_float std::complex<float>
#define lapack_complex_double std::complex<double>
#include "Eigen/Eigen"

void CustomPrefix(std::ostream &s, const google::LogMessageInfo &l, void *)
{
    s << l.severity[0]
      << std::setw(4) << 1900 + l.time.year() << '/'
      << std::setw(2) << 1 + l.time.month() << '/'
      << std::setw(2) << l.time.day()
      << ' '
      << std::setw(2) << l.time.hour() << ':'
      << std::setw(2) << l.time.min() << ':'
      << std::setw(2) << l.time.sec() << "."
      << std::setw(6) << l.time.usec()
      << ' '
      << std::setfill(' ') << std::setw(5)
      << l.thread_id << std::setfill('0')
      << ' '
      << l.filename << ':' << l.line_number << "]"
      << " CUSTOM PREFIX";
}

int main(int argc, char **argv)
{
    google::InitGoogleLogging(argv[0], &CustomPrefix);
    FLAGS_logtostdout = true;
    FLAGS_colorlogtostdout = true;
    FLAGS_colorlogtostderr = true;
    google::InstallFailureSignalHandler();

    LOG(INFO) << "Run time linking to glog lib success.";
    LOG(WARNING) << "Run time linking to glog lib success.";
    LOG(ERROR) << "Run time linking to glog lib success.";
    
    Eigen::setNbThreads(0);
    LOG(INFO) << "Number of threads used by eigen " << Eigen::nbThreads;
}