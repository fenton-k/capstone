# capstone
CS Capstone Backup
# Setting up ROS (Robot Operating System)
This guide will serve as a guide for how to implement ROS for students at St. Olaf College. It will provide information about getting started, troubleshooting, and a step by step guide to getting your robot moving.

## Choosing ROS Version
- Consider using an older version of ROS with more documentation, instead of the most recent version (e.g., Humble) which may have limited resources.

## Hardware Selection
- We recommended starting with a default TurtleBot3 model (Burger or Waffle.) Note that some of TurtleBots in the advanced lab are modified versions (the ones with 4 wheels are *not* a default configuration and will require custom firmware.)

## Setup Instructions

1. **Ubuntu Machine**
  - Get access to an Ubuntu machine. It's recommended to use a lab machine or dual-boot your computer.
  - Virtual machines (including WSL) and Docker are not recommended due to requiring a GUI and specific networking conditions. If you do go this route, ensure that you have forwarded appropriate (or all?) ports from your base machine to your virtual machine as newer versions of ROS do not require specific IP or port assignments. However, port numbers will depend on domain ID; see ROS docs for more information: https://docs.ros.org/en/foxy/Concepts/About-Domain-ID.html

2. **ROS Installation on Remote PC**
  - Install all the required ROS software on the remote PC.
  - Follow the installation guide: https://docs.ros.org/en/humble/Installation.html or run the following script:
```bash
  ./ROS-install.sh
```
3. **Ubuntu and ROS Installation on Raspberry Pi**
  - Install Ubuntu and ROS packages on the Raspberry Pi. We used a TV to make setup easier.
  - Follow the guide: https://emanual.robotis.com/docs/en/platform/turtlebot3/sbc_setup/

4. **Configure CR Board**
  - Configure the CR board via the Raspberry Pi.
  - Follow the guide: https://emanual.robotis.com/docs/en/platform/turtlebot3/opencr_setup/#opencr-setup or run the following script on your Raspberry Pi after ensuring that the OpenCR board is plugged into it:

```bash
  ./OpenCR-setup.sh
```


5. **Bring up the Robot**
  - Bring up the TurtleBot3 robot.
  - Follow the guide: https://emanual.robotis.com/docs/en/platform/turtlebot3/bringup/#bringup

6. **Teleoperation**
  - Control the robot using teleoperation (WAXD keys add forward/backward and rotational motion and the S key stops the robot entirely).
  - Troubleshooting:
    - To make sure that the motors and OpenCR board are functioning, click the physical buttons (PUSH SW 1 and PUSH SW 2) on the OpenCR board as outlined in this guide: https://emanual.robotis.com/docs/en/platform/turtlebot3/opencr_setup/#opencr-setup
    - To make sure that the Bringup was run correctly, try running the teleoperation command directly on the Raspberry Pi instead of the remote machine. If the robot moves when teleoperating on the Pi, then there is a networking issue.
    - Networking problems can be caused by many things. 
      - A common error is a subneting issue caused by EDUroam/St. Olaf Guest wifi networks. We found success by directly connecting an ethernet cable from our laptop to the Raspberry Pi (like in Hardware Design.) You could also set up another Raspberry Pi as a router or finding a cheap router and then hardwiring that device into ethernet.  
      - Also, make sure that Domain ID matches in remote machine and on Raspberry Pi

7. **Navigation Stack, SLAM, and Cartographer**
  - Set up and use the navigation stack, SLAM, and Cartographer for mapping and navigation: https://emanual.robotis.com/docs/en/platform/turtlebot3/slam/#run-slam-node
  - Once the cartographer is running on your remote machine (it is too intensive to run on a Raspberry Pi) use teleoperation to map your space.

8. **RViz**
  - Play around with RViz, which allows you to view output from the robot's sensors. It can be used to set navigation goals once you have build a map with the cartographer.
