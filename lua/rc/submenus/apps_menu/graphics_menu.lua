local awful = require("awful")

return {
    {
		"figma",
		function()
			awful.spawn(
				"/opt/figma-linux/figma-linux --no-sandbox --enable-oop-rasterization --ignore-gpu-blacklist -enable-experimental-canvas-features --enable-accelerated-2d-canvas --force-gpu-rasterization --enable-fast-unload --enable-accelerated-vpx-decode=3 --enable-tcp-fastopen --javascript-harmony --enable-checker-imaging --v8-cache-options=code --v8-cache-strategies-for-cache-storage=aggressive --enable-zero-copy --ui-enable-zero-copy --enable-native-gpu-memory-buffers --enable-webgl-image-chromium --enable-accelerated-video --enable-gpu-rasterization"
			)
		end,
	},
    {
        "gimp",
        function ()
            awful.spawn("gimp")
        end
    },
    {
        "gromit mpx",
        function ()
            awful.spawn("gromit-mpx")
        end
    },
    {
        "mypaint",
        function ()
            awful.spawn("mypaint")
        end
    },
}
