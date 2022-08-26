#include "vss_impl.h"
#include "vss.h"

namespace vss
{

VssRGBD::VssRGBD(const CameraParameters &camera_parameters) : ptr_((void *)new VssRGBDImpl(camera_parameters))
{
}

VssRGBD::~VssRGBD()
{
    delete ((VssRGBDImpl *)ptr_);
}

void VssRGBD::Feed(const Eigen::Isometry3f &pose,
                   const cv::Mat &image_rgb,
                   const uint64_t &image_rgb_timestamp,
                   const cv::Mat &image_depth,
                   const uint64_t &image_depth_timestamp,
                   Eigen::Isometry3f &pose_corrected,
                   float &confidence)
{
    ((VssRGBDImpl *)ptr_)->Feed(pose, image_rgb, image_rgb_timestamp, image_depth, image_depth_timestamp, pose_corrected, confidence);
}

}