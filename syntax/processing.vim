" Vim syntax file
" Language:	Processing
" Maintainer:	Szabolcs Horvát <szhorvat at gmail dot com>
" Version:	3
" Last Change:	2008-02-02

" This is for Processing 0135 BETA, based on keywords.txt

if exists("b:current_syntax")
  finish
endif

syntax case match

" LITERAL2

syn keyword processingVariable	focused frameCount height key
syn keyword processingVariable	keyCode mouseButton
syn keyword processingVariable	mouseX mouseY online pixels
syn keyword processingVariable	pmouseX pmouseY screen width
" at the moment these need to be "syn match"es so that they don't take
" precedence over processingFunRegion's start pattern:
" syn keyword processingVariable  frameRate mousePressed keyPressed
syn match   processingVariable	display "frameRate"
syn match   processingVariable	display "mousePressed"
syn match   processingVariable	display "keyPressed"

" KEYWORD2

syn keyword processingFunction	contained abs acos alpha ambient ambientLight
syn keyword processingFunction	contained append applyMatrix arc arraycopy
syn keyword processingFunction	contained asin atan atan2 background
syn keyword processingFunction	contained beginCamera beginRecord beginShape
syn keyword processingFunction	contained bezier bezierDetail bezierPoint
syn keyword processingFunction	contained bezierTangent bezierVertex binary
syn keyword processingFunction	contained blend blendColor blue box
syn keyword processingFunction	contained brightness camera ceil colorMode
syn keyword processingFunction	contained concat constrain cos createFont
syn keyword processingFunction	contained createGraphics createImage
syn keyword processingFunction	contained createWriter cursor curve
syn keyword processingFunction	contained curveDetail curvePoint
syn keyword processingFunction	contained curveTightness curveVertex day
syn keyword processingFunction	contained degrees delay directionalLight dist
syn keyword processingFunction	contained draw ellipse ellipseMode emissive
syn keyword processingFunction	contained endCamera endRecord endShape exit
syn keyword processingFunction	contained exp expand fill filter floor
syn keyword processingFunction	contained frustum get green hex hint hour hue
syn keyword processingFunction	contained image imageMode join keyReleased
syn keyword processingFunction	contained keyTyped lerp lerpColor
syn keyword processingFunction	contained lightFalloff lights lightSpecular
syn keyword processingFunction	contained line link loadBytes loadFont
syn keyword processingFunction	contained loadImage loadPixels loadStrings
syn keyword processingFunction	contained log loop mag map match max millis
syn keyword processingFunction	contained min minute modelX modelY modelZ
syn keyword processingFunction	contained month mouseClicked mouseDragged
syn keyword processingFunction	contained mouseMoved mouseReleased nf nfc nfp
syn keyword processingFunction	contained nfs noCursor noFill noise
syn keyword processingFunction	contained noiseDetail noiseSeed noLoop norm
syn keyword processingFunction	contained normal noSmooth noStroke noTint
syn keyword processingFunction	contained open openStream ortho param
syn keyword processingFunction	contained perspective list beginDraw endDraw
syn keyword processingFunction	contained blend copy mask set point
syn keyword processingFunction	contained pointLight popMatrix pow
syn keyword processingFunction	contained printCamera printMatrix
syn keyword processingFunction	contained printProjection close flush print
syn keyword processingFunction	contained println pushMatrix quad radians
syn keyword processingFunction	contained random randomSeed rect rectMode red
syn keyword processingFunction	contained redraw resetMatrix reverse rotate
syn keyword processingFunction	contained rotateX rotateY rotateZ round
syn keyword processingFunction	contained saturation save saveBytes saveFrame
syn keyword processingFunction	contained saveStrings scale screenX screenY
syn keyword processingFunction	contained screenZ second setup shininess
syn keyword processingFunction	contained shorten sin size smooth sort
syn keyword processingFunction	contained specular sphere sphereDetail splice
syn keyword processingFunction	contained split splitTokens spotLight sq sqrt
syn keyword processingFunction	contained status str charAt equals indexOf
syn keyword processingFunction	contained length substring toLowerCase
syn keyword processingFunction	contained toUpperCase stroke strokeCap
syn keyword processingFunction	contained strokeJoin strokeWeight subset tan
syn keyword processingFunction	contained text textAlign textAscent
syn keyword processingFunction	contained textDescent textFont textLeading
syn keyword processingFunction	contained textMode textSize texture
syn keyword processingFunction	contained textureMode textWidth tint
syn keyword processingFunction	contained translate triangle trim unbinary
syn keyword processingFunction	contained unhex unhint updatePixels vertex
syn keyword processingFunction	contained year keyPressed mousePressed
syn keyword processingFunction	contained frameRate

" highlight funtcion names only when they are followed by "("
" need to terminate match using \ze before ( to allow for 
" unmatched bracket higlighting
syn match   processingFunRegion	"\K\k*\s*\ze(" contains=processingFunction

" KEYWORD1

syn keyword processingType	Boolean Byte Character Class Double Float
syn keyword processingType	Integer Math String StringBuffer Thread
syn keyword processingType	Array Object PFont PGraphics PImage
syn keyword processingType	PrintWriter
syn keyword processingType	boolean byte char color double float
syn keyword processingType	int long short void

syn keyword processingBoolean	false true
syn keyword processingConstant	null

syn keyword processingStorageClass	final static synchronized transient volatile 
syn keyword processingConditional	if else switch
syn keyword processingControlFlow	break continue return
syn keyword processingRepeat		while for do
syn keyword processingLabel		case default
syn keyword processingException		try catch throw finally
syn keyword processingOperator		new instanceof

syn keyword processingKeyword	abstract class
syn keyword processingKeyword	interface native
syn keyword processingKeyword	package private protected public
syn keyword processingKeyword	extends implements import throws
syn keyword processingKeyword	super this


" LITERAL1

syn keyword processingConstant	ADD ALPHA ALT AMBIENT ARGB ARROW BACKSPACE
syn keyword processingConstant	BASELINE BEVEL BLEND BLUR BOTTOM BURN CENTER
syn keyword processingConstant	CENTER_RADIUS CHATTER CLOSE CODED COMPLAINT
syn keyword processingConstant	CONTROL CORNER CORNERS CROSS CUSTOM DARKEST
syn keyword processingConstant	DEG_TO_RAD DELETE DIFFERENCE DILATE
syn keyword processingConstant	DIRECTIONAL DISABLE_AUTO_GZIP
syn keyword processingConstant	DISABLE_DEPTH_TEST DISABLE_ERROR_REPORT
syn keyword processingConstant	DISABLE_TEXT_SMOOTH DODGE DOWN DXF
syn keyword processingConstant	ENABLE_ACCURATE_TEXTURES
syn keyword processingConstant	ENABLE_DEPTH_SORT ENABLE_NATIVE_FONTS
syn keyword processingConstant	ENABLE_OPENGL_2X_SMOOTH
syn keyword processingConstant	ENABLE_OPENGL_4X_SMOOTH ENTER EPSILON ERODE
syn keyword processingConstant	ESC EXCLUSION GRAY HAND HARD_LIGHT
syn keyword processingConstant	HINT_COUNT HSB IMAGE INVERT JAVA2D LEFT
syn keyword processingConstant	LIGHTEST LINES LINUX MACOS9 MACOSX MAX_FLOAT
syn keyword processingConstant	MAX_INT MIN_FLOAT MIN_INT MITER MODEL MOVE
syn keyword processingConstant	MULTIPLY NORMALIZED NO_FLYING_POO OPAQUE
syn keyword processingConstant	OPEN OPENGL ORTHOGRAPHIC OTHER OVERLAY P2D P3D
syn keyword processingConstant	PDF PERSPECTIVE PIXEL_CENTER POINT POINTS
syn keyword processingConstant	POLYGON POSTERIZE PROBLEM PROJECT QUADS
syn keyword processingConstant	QUAD_STRIP QUARTER_PI RADIUS RAD_TO_DEG
syn keyword processingConstant	REPLACE RETURN RGB RIGHT ROUND SCREEN SHAPE
syn keyword processingConstant	SHIFT SOFT_LIGHT SPOT SQUARE SUBTRACT TAB
syn keyword processingConstant	TARGA TEXT THIRD_PI THRESHOLD TIFF TOP
syn keyword processingConstant	TRIANGLES TRIANGLE_FAN TRIANGLE_STRIP
syn keyword processingConstant	UP WAIT WHITESPACE
syn keyword processingConstant	COMPOSITE SVIDEO COMPONENT TUNER NTSC PAL
syn keyword processingConstant	SECAM RAW ANIMATION BASE BMP CINEPAK
syn keyword processingConstant	CMYK GIF GRAPHICS H261 H263 H264 JPEG MS_VIDEO
syn keyword processingConstant	MOTION_JPEG_A MOTION_JPEG_B SORENSON VIDEO
syn keyword processingConstant	WORST LOW MEDIUM HIGH BEST LOSSLESS
syn keyword processingConstant	HALF_PI PI TWO_PI

syn match   processingSpecError	display contained "\\."
syn match   processingSpecial	display contained "\\[ntbrf'\"\\]"
syn match   processingSpecial	display contained "\\u\x\{4}"
syn match   processingSpecial	display contained "\\\o\{1,2}"
syn match   processingSpecial	display contained "\\[0-3]\o\o"

syn region  processingString	start=+"+ end=+"+ end='$' contains=processingSpecial,processingSpecError,@Spell

syn region  processingCharacter	start="'" end="'" end="$" contains=processingSpecial,processingSpecError

syn keyword processingTodo	TODO FIXME XXX NOTE contained

syn region  processingComment	start="/\*" end="\*/" contains=processingTodo,@Spell
syn region  processingCommentL	start="//" end="$" contains=processingTodo,@Spell

if !exists("processing_minlines")
  let processing_minlines = 20
endif
exec "syn sync ccomment processingComment minlines=" . processing_minlines

syn match   processingNumber	display "\<\d\+[lL]\=\>"
syn match   processingNumber	display "\<0x\x\+[lL]\=\>"
syn match   processingOctal	display "\<0\o\+[lL]\=\>" contains=processingOctalZero
syn match   processingOctalZero	display contained "\<0"
" The trailing L doesn't make much sense for colors but the PDE accepts it ...
syn match   processingColor	display "#\x\{6}[lL]\=\>"
" float without . or exponent
syn match   processingFloat	display "\<\d\+[fF]\>"
" no \> because it might end in a .
syn match   processingFloat	display "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=[fF]\="
" float starting with .
syn match   processingFloat	display "\.\d\+\%([eE][-+]\=\d\+\)\=[fF]\=\>"
" float with explonent
syn match   processingFloat	display "\<\d\+[eE][-+]\=\d\+"

" prevent highlighting of predefined function names after a dot
syn region  processingEmpty	start="\.\ze\K" end="\>"

" Highlight unmatched brackets
syn match   processingParErr	display ")"
syn match   processingBraErr	display "\]"
syn match   processingCBraErr	display "}"
syn region  processingPar	transparent start="(" end=")" contains=TOP,processingParErr
syn region  processingBra	transparent start="\[" end="\]" contains=TOP,processingBraErr
syn region  processingCBra	transparent start="{" end="}" contains=TOP,processingCBraErr


hi def link processingParErr		Error
hi def link processingBraErr		Error
hi def link processingCBraErr		Error

hi def link processingKeyword		Keyword
hi def link processingRepeat		Repeat
hi def link processingConditional	Conditional
hi def link processingControlFlow	Keyword
hi def link processingException		Exception
hi def link processingLabel		Label
hi def link processingFunction		Function
hi def link processingOperator		Operator
hi def link processingType		Type
hi def link processingStorageClass	StorageClass
hi def link processingConstant 		Constant
hi def link processingVariable		Constant
hi def link processingBoolean		Boolean
hi def link processingNumber		Number
hi def link processingOctal		Number
hi def link processingOctalZero		PreProc
hi def link processingColor		Number
hi def link processingFloat		Float
hi def link processingString		String
hi def link processingCharacter		Character
hi def link processingSpecial		SpecialChar
hi def link processingSpecError		Error
hi def link processingComment		Comment
hi def link processingCommentL		Comment
hi def link processingTodo		Todo

let b:current_syntax = "processing"

" vim: ts=8
