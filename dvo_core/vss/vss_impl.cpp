#include "vss_impl.h"
#include "dvo/dense_tracking.h"

namespace vss
{

VssRGBDImpl::VssRGBDImpl(const CameraParameters &camera_parameters)
{
}

VssRGBDImpl::~VssRGBDImpl()
{
}

void VssRGBDImpl::Feed(const Eigen::Isometry3f &pose,
                       const cv::Mat &image_rgb,
                       const uint64_t &image_rgb_timestamp,
                       const cv::Mat &image_depth,
                       const uint64_t &image_depth_timestamp,
                       Eigen::Isometry3f &pose_corrected,
                       float &confidence)
{
}

}