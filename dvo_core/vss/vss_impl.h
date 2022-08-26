

#ifndef VSS_IMPL_H
#define VSS_IMPL_H

#include "vss.h"

namespace vss
{

class VssRGBDImpl
{
public:
    VssRGBDImpl(const CameraParameters &camera_parameters);
    ~VssRGBDImpl();

    void Feed(const Eigen::Isometry3f &pose,
              const cv::Mat &image_rgb,
              const uint64_t &image_rgb_timestamp,
              const cv::Mat &image_depth,
              const uint64_t &image_depth_timestamp,
              Eigen::Isometry3f &pose_corrected,
              float &confidence);

private:
};

}

#endif