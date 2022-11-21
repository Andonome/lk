---
title: "fonts"
tags: [ "Documentation", "distros" ]
---
# Step 1: Multilib

Enable multilib (32-bit) support in `/etc/pacman.d/mirrorlist`:

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

And update:

> sudo pacman -Syu

# Step 2: Check Card Manufacturer

Check your graphics card type:

> lspci  | grep VGA

# Step 3: Install Drivers

## Step 3A

If you see `Nvidia`, then install the intel drivers:

> sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

## Step 3B

If you see `Intel`, then install the intel drivers:

> sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader xf86-video-intel

## Step 3C

If you see `AMD`, then check your card support `vulkan`:

> yay -S gpu-viewer

> vulkaninfo | grep 'VkPhysicalDeviceVulkanMemoryModelFeatures' -A 3

You should see 'true' here.

> sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader xf86-video-amdgpu

