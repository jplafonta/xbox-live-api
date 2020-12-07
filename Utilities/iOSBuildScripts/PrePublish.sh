#!/bin/sh

# Create directory structure for debug framework
mkdir -p "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_MULTIARCH}"

cp -r \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_IPHONESIMULATOR}/" \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_MULTIARCH}/"

# Create the debug multiarchitecture framework
lipo -create \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_IPHONEOS}/HttpClient.framework/HttpClient" \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_IPHONESIMULATOR}/HttpClient.framework/HttpClient" \
    -output "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_MULTIARCH}/HttpClient.framework/HttpClient"

lipo -create \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_IPHONEOS}/Xal.framework/Xal" \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_IPHONESIMULATOR}/Xal.framework/Xal" \
    -output "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_MULTIARCH}/Xal.framework/Xal"

lipo -create \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_IPHONEOS}/xsapi-c.framework/xsapi-c" \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_IPHONESIMULATOR}/xsapi-c.framework/xsapi-c" \
    -output "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_MULTIARCH}/xsapi-c.framework/xsapi-c"

# Create directory structure for release framework
mkdir -p "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_MULTIARCH}/"

cp -r \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_IPHONESIMULATOR}/" \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_MULTIARCH}/"

# Create the release multiarchitecture framework
lipo -create \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_IPHONEOS}/HttpClient.framework/HttpClient" \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_IPHONESIMULATOR}/HttpClient.framework/HttpClient" \
    -output "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_MULTIARCH}/HttpClient.framework/HttpClient"

lipo -create \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_IPHONEOS}/Xal.framework/Xal" \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_IPHONESIMULATOR}/Xal.framework/Xal" \
    -output "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_MULTIARCH}/Xal.framework/Xal"

lipo -create \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_IPHONEOS}/xsapi-c.framework/xsapi-c" \
    "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_IPHONESIMULATOR}/xsapi-c.framework/xsapi-c" \
    -output "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_MULTIARCH}/xsapi-c.framework/xsapi-c"

# Copy build outputs to //Gameshare/XboxLiveSDK
ditto "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_MULTIARCH}/HttpClient.framework" "/Volumes/XboxLiveSDK/iOS/${BUILD_SOURCEBRANCHNAME}/${BUILD_BUILDID}/${BUILDCONFIGURATION_DEBUG}/HttpClient.framework"
ditto "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_MULTIARCH}/Xal.framework" "/Volumes/XboxLiveSDK/iOS/${BUILD_SOURCEBRANCHNAME}/${BUILD_BUILDID}/${BUILDCONFIGURATION_DEBUG}/Xal.framework"
ditto "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_DEBUG}-${SDK_MULTIARCH}/xsapi-c.framework" "/Volumes/XboxLiveSDK/iOS/${BUILD_SOURCEBRANCHNAME}/${BUILD_BUILDID}/${BUILDCONFIGURATION_DEBUG}/xsapi-c.framework"
ditto "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_MULTIARCH}/HttpClient.framework" "/Volumes/XboxLiveSDK/iOS/${BUILD_SOURCEBRANCHNAME}/${BUILD_BUILDID}/${BUILDCONFIGURATION_RELEASE}/HttpClient.framework"
ditto "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_MULTIARCH}/Xal.framework" "/Volumes/XboxLiveSDK/iOS/${BUILD_SOURCEBRANCHNAME}/${BUILD_BUILDID}/${BUILDCONFIGURATION_RELEASE}/Xal.framework"
ditto "${BUILD_BINARIESDIRECTORY}/${BUILDCONFIGURATION_RELEASE}-${SDK_MULTIARCH}/xsapi-c.framework" "/Volumes/XboxLiveSDK/iOS/${BUILD_SOURCEBRANCHNAME}/${BUILD_BUILDID}/${BUILDCONFIGURATION_RELEASE}/xsapi-c.framework"