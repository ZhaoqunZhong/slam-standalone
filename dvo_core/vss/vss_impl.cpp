#include "vss_impl.h"
#include "glog/logging.h"
#include "dvo/util/stopwatch.h"
#include "dvo/core/surface_pyramid.h"

namespace vss {

VssRGBDImpl::VssRGBDImpl(const CameraParameters &camera_parameters)
    : cam_parameters_(camera_parameters),
      tracker_cfg(dvo::DenseTracker::getDefaultConfig()),
      frames_since_last_success(0),
      vis_(new dvo::visualization::NoopCameraTrajectoryVisualizer()) {
/*    latest_absolute_transform_.setIdentity();
    accumulated_transform.setIdentity();

    dvo::core::IntrinsicMatrix intrinsics = dvo::core::IntrinsicMatrix::create(
        cam_parameters_.fx, cam_parameters_.fy, cam_parameters_.cx, cam_parameters_.cy);

    width = cam_parameters_.width;
    height = cam_parameters_.height;

    camera.reset(new dvo::core::RgbdCameraPyramid(width, height, intrinsics));
    camera->build(tracker_cfg.getNumLevels());

    tracker.reset(new dvo::DenseTracker(tracker_cfg));

    static dvo::core::RgbdImagePyramid *const __null__ = 0;

    reference.reset(__null__);
    current.reset(__null__);

    vis_->reset();*/
}

VssRGBDImpl::~VssRGBDImpl() { delete vis_; }

void VssRGBDImpl::Feed(const Eigen::Isometry3f &pose, const cv::Mat &image_rgb,
                       const uint64_t &image_rgb_timestamp, const cv::Mat &image_depth,
                       const uint64_t &image_depth_timestamp, Eigen::Isometry3f &pose_corrected,
                       float &confidence) {
    /*static dvo::util::stopwatch sw_callback("callback");
    sw_callback.start();

    cv::Mat intensity, depth;
    if (image_rgb.channels() == 3) {
        cv::Mat tmp;
        cv::cvtColor(image_rgb, tmp, cv::COLOR_RGB2GRAY, 1);
        tmp.convertTo(intensity, CV_32F);
    } else {
        image_rgb.convertTo(intensity, CV_32F);
    }

    if (image_depth.type() == CV_16UC1) {
        dvo::core::SurfacePyramid::convertRawDepthImageSse(image_depth, depth, cam_parameters_.depth_factor);
    } else {
        depth = image_depth;
    }
    // DLOG(INFO) << "depth channels num " << depth.channels();

    reference.swap(current);
    current = camera->create(intensity, depth);

    static Eigen::Affine3d first;

    if (!reference) {
        accumulated_transform = latest_absolute_transform_ * from_baselink_to_asus;
        first = accumulated_transform;

        vis_->camera("first")
            ->color(dvo::visualization::Color::blue())
            .update(current->level(0), accumulated_transform)
            .show();

        return;
    }

    Eigen::Affine3d transform;

    static dvo::util::stopwatch sw_match("match", 100);
    sw_match.start();

    bool success = tracker->match(*reference, *current, transform);

    sw_match.stopAndPrint();

    if (success) {
        frames_since_last_success = 0;
        accumulated_transform = accumulated_transform * transform;

        Eigen::Matrix<double, 6, 6> covariance;

        // tracker->getCovarianceEstimate(covariance);

        DLOG(INFO) << "covariance: \n" << covariance;

        vis_->trajectory("estimate")
            ->color(dvo::visualization::Color::red())
            .add(accumulated_transform);

        vis_->camera("current")
            ->color(dvo::visualization::Color::red())
            .update(current->level(0), accumulated_transform)
            .show();
    } else {
        frames_since_last_success++;
        reference.swap(current);
        DLOG(WARNING) << "Fail.";
    }

    sw_callback.stopAndPrint();*/
}

}  // namespace vss