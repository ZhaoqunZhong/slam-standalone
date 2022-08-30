#ifndef VSS_H
#define VSS_H

#include <Eigen/Eigen>
#include <cstdint>
#include <opencv2/opencv.hpp>

namespace vss
{

struct CameraParameters
{
    uint32_t width;
    uint32_t height;
    float fx;
    float fy;
    float cx;
    float cy;
    float k1;
    float k2;
    float p1;
    float p2;
    float depth_factor;
};

class VssRGBD
{
public:
    VssRGBD(const CameraParameters &camera_parameters);
    ~VssRGBD();

    void Feed(const Eigen::Isometry3f &pose,
              const cv::Mat &image_rgb,
              const uint64_t &image_rgb_timestamp,
              const cv::Mat &image_depth,
              const uint64_t &image_depth_timestamp,
              Eigen::Isometry3f &pose_corrected,
              float &confidence);

private:
    void *ptr_;
};

}

#endif