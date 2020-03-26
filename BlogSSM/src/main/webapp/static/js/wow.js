(function() {
	var n, f, t, i, r, u = function(n, t) {
			return function() {
				return n.apply(t, arguments)
			}
		},
		e = [].indexOf || function(n) {
			for(var t = 0, i = this.length; i > t; t++)
				if(t in this && this[t] === n) return t;
			return -1
		};
	f = function() {
		function n() {}
		return n.prototype.extend = function(n, t) {
			var i, r;
			for(i in t) r = t[i], null == n[i] && (n[i] = r);
			return n
		}, n.prototype.isMobile = function(n) {
			return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(n)
		}, n.prototype.addEvent = function(n, t, i) {
			return null != n.addEventListener ? n.addEventListener(t, i, !1) : null != n.attachEvent ? n.attachEvent("on" + t, i) : n[t] = i
		}, n.prototype.removeEvent = function(n, t, i) {
			return null != n.removeEventListener ? n.removeEventListener(t, i, !1) : null != n.detachEvent ? n.detachEvent("on" + t, i) : delete n[t]
		}, n.prototype.innerHeight = function() {
			return "innerHeight" in window ? window.innerHeight : document.documentElement.clientHeight
		}, n
	}();
	t = this.WeakMap || this.MozWeakMap || (t = function() {
		function n() {
			this.keys = [];
			this.values = []
		}
		return n.prototype.get = function(n) {
			var t, u, i, f, r;
			for(r = this.keys, t = i = 0, f = r.length; f > i; t = ++i)
				if(u = r[t], u === n) return this.values[t]
		}, n.prototype.set = function(n, t) {
			var i, f, r, e, u;
			for(u = this.keys, i = r = 0, e = u.length; e > r; i = ++r)
				if(f = u[i], f === n) return void(this.values[i] = t);
			return this.keys.push(n), this.values.push(t)
		}, n
	}());
	n = this.MutationObserver || this.WebkitMutationObserver || this.MozMutationObserver || (n = function() {
		function n() {
			"undefined" != typeof console && null !== console && console.warn("MutationObserver is not supported by your browser.");
			"undefined" != typeof console && null !== console && console.warn("WOW.js cannot detect dom mutations, please call .sync() after loading new content.")
		}
		return n.notSupported = !0, n.prototype.observe = function() {}, n
	}());
	i = this.getComputedStyle || function(n) {
		return this.getPropertyValue = function(t) {
			var i;
			return "float" === t && (t = "styleFloat"), r.test(t) && t.replace(r, function(n, t) {
				return t.toUpperCase()
			}), (null != (i = n.currentStyle) ? i[t] : void 0) || null
		}, this
	};
	r = /(\-([a-z]){1})/g;
	this.WOW = function() {
		function r(n) {
			null == n && (n = {});
			this.scrollCallback = u(this.scrollCallback, this);
			this.scrollHandler = u(this.scrollHandler, this);
			this.start = u(this.start, this);
			this.scrolled = !0;
			this.config = this.util().extend(n, this.defaults);
			this.animationNameCache = new t
		}
		return r.prototype.defaults = {
			boxClass: "wow",
			animateClass: "animated",
			offset: 0,
			mobile: !0,
			live: !0
		}, r.prototype.init = function() {
			var n;
			return this.element = window.document.documentElement, "interactive" === (n = document.readyState) || "complete" === n ? this.start() : this.util().addEvent(document, "DOMContentLoaded", this.start), this.finished = []
		}, r.prototype.start = function() {
			var t, i, u, r;
			if(this.stopped = !1, this.boxes = function() {
					var n, u, i, r;
					for(i = this.element.querySelectorAll("." + this.config.boxClass), r = [], n = 0, u = i.length; u > n; n++) t = i[n], r.push(t);
					return r
				}.call(this), this.all = function() {
					var n, u, i, r;
					for(i = this.boxes, r = [], n = 0, u = i.length; u > n; n++) t = i[n], r.push(t);
					return r
				}.call(this), this.boxes.length)
				if(this.disabled()) this.resetStyle();
				else {
					for(r = this.boxes, i = 0, u = r.length; u > i; i++) t = r[i], this.applyStyle(t, !0);
					this.util().addEvent(window, "scroll", this.scrollHandler);
					this.util().addEvent(window, "resize", this.scrollHandler);
					this.interval = setInterval(this.scrollCallback, 50)
				}
			if(this.config.live) return new n(function(n) {
				return function(t) {
					var u, f, i, e, r;
					for(r = [], i = 0, e = t.length; e > i; i++) f = t[i], r.push(function() {
						var n, r, t, i;
						for(t = f.addedNodes || [], i = [], n = 0, r = t.length; r > n; n++) u = t[n], i.push(this.doSync(u));
						return i
					}.call(n));
					return r
				}
			}(this)).observe(document.body, {
				childList: !0,
				subtree: !0
			})
		}, r.prototype.stop = function() {
			return this.stopped = !0, this.util().removeEvent(window, "scroll", this.scrollHandler), this.util().removeEvent(window, "resize", this.scrollHandler), null != this.interval ? clearInterval(this.interval) : void 0
		}, r.prototype.sync = function() {
			if(n.notSupported) return this.doSync(this.element)
		}, r.prototype.doSync = function(n) {
			var t, i, f, u, r;
			if(!this.stopped) {
				if(null == n && (n = this.element), 1 !== n.nodeType) return;
				for(n = n.parentNode || n, u = n.querySelectorAll("." + this.config.boxClass), r = [], i = 0, f = u.length; f > i; i++) t = u[i], e.call(this.all, t) < 0 ? (this.applyStyle(t, !0), this.boxes.push(t), this.all.push(t), r.push(this.scrolled = !0)) : r.push(void 0);
				return r
			}
		}, r.prototype.show = function(n) {
			return this.applyStyle(n), n.className = "" + n.className + " " + this.config.animateClass
		}, r.prototype.applyStyle = function(n, t) {
			var i, r, u;
			return r = n.getAttribute("data-wow-duration"), i = n.getAttribute("data-wow-delay"), u = n.getAttribute("data-wow-iteration"), this.animate(function(f) {
				return function() {
					return f.customStyle(n, t, r, i, u)
				}
			}(this))
		}, r.prototype.animate = function() {
			return "requestAnimationFrame" in window ? function(n) {
				return window.requestAnimationFrame(n)
			} : function(n) {
				return n()
			}
		}(), r.prototype.resetStyle = function() {
			var r, n, u, t, i;
			for(t = this.boxes, i = [], n = 0, u = t.length; u > n; n++) r = t[n], i.push(r.setAttribute("style", "visibility: visible;"));
			return i
		}, r.prototype.customStyle = function(n, t, i, r, u) {
			return t && this.cacheAnimationName(n), n.style.visibility = t ? "hidden" : "visible", i && this.vendorSet(n.style, {
				animationDuration: i
			}), r && this.vendorSet(n.style, {
				animationDelay: r
			}), u && this.vendorSet(n.style, {
				animationIterationCount: u
			}), this.vendorSet(n.style, {
				animationName: t ? "none" : this.cachedAnimationName(n)
			}), n
		}, r.prototype.vendors = ["moz", "webkit"], r.prototype.vendorSet = function(n, t) {
			var i, r, u, f = [];
			for(i in t) r = t[i], n["" + i] = r, f.push(function() {
				var t, o, f, e;
				for(f = this.vendors, e = [], t = 0, o = f.length; o > t; t++) u = f[t], e.push(n["" + u + i.charAt(0).toUpperCase() + i.substr(1)] = r);
				return e
			}.call(this));
			return f
		}, r.prototype.vendorCSS = function(n, t) {
			var r, f, o, u, s, e;
			for(f = i(n), r = f.getPropertyCSSValue(t), e = this.vendors, u = 0, s = e.length; s > u; u++) o = e[u], r = r || f.getPropertyCSSValue("-" + o + "-" + t);
			return r
		}, r.prototype.animationName = function(n) {
			var t;
			try {
				t = this.vendorCSS(n, "animation-name").cssText
			} catch(r) {
				t = i(n).getPropertyValue("animation-name")
			}
			return "none" === t ? "" : t
		}, r.prototype.cacheAnimationName = function(n) {
			return this.animationNameCache.set(n, this.animationName(n))
		}, r.prototype.cachedAnimationName = function(n) {
			return this.animationNameCache.get(n)
		}, r.prototype.scrollHandler = function() {
			return this.scrolled = !0
		}, r.prototype.scrollCallback = function() {
			var n;
			if(this.scrolled && !(this.scrolled = !1, this.boxes = function() {
					var t, u, i, r;
					for(i = this.boxes, r = [], t = 0, u = i.length; u > t; t++) n = i[t], n && (this.isVisible(n) ? this.show(n) : r.push(n));
					return r
				}.call(this), this.boxes.length || this.config.live)) return this.stop()
		}, r.prototype.offsetTop = function(n) {
			for(var t; void 0 === n.offsetTop;) n = n.parentNode;
			for(t = n.offsetTop; n = n.offsetParent;) t += n.offsetTop;
			return t
		}, r.prototype.isVisible = function(n) {
			var r, u, t, f, i;
			return u = n.getAttribute("data-wow-offset") || this.config.offset, i = window.pageYOffset, f = i + Math.min(this.element.clientHeight, this.util().innerHeight()) - u, t = this.offsetTop(n), r = t + n.clientHeight, f >= t && r >= i
		}, r.prototype.util = function() {
			return null != this._util ? this._util : this._util = new f
		}, r.prototype.disabled = function() {
			return !this.config.mobile && this.util().isMobile(navigator.userAgent)
		}, r
	}()
}).call(this)