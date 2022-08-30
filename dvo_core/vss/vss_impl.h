

#ifndef VSS_IMPL_H
#define VSS_IMPL_H

#include "vss.h"
#include "dvo/dense_tracking.h"
#include "dvo/visualization/camera_trajectory_visualizer.h"

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
   uint32_t width;
   uint32_t height;

   boost::shared_ptr<dvo::DenseTracker> tracker;
   dvo::DenseTracker::Config tracker_cfg;
   dvo::core::RgbdCameraPyramidPtr camera;
   dvo::core::RgbdImagePyramidPtr current, reference;
   Eigen::Affine3d accumulated_transform, from_baselink_to_asus, latest_absolute_transform_;

   size_t frames_since_last_success;
   dvo::visualization::CameraTrajectoryVisualizerInterface *vis_;

   CameraParameters cam_parameters_;

};

}

#endif