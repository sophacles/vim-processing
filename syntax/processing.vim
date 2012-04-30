" Vim syntax file
" Language:	Processing
" Maintainer:	Szabolcs Horvát <szhorvat at gmail dot com>
" Version:	3
" Last Change:	2008-02-02

" This is for Processing 0135 BETA, based on keywords.txt

:runtime! syntax/java.vim
syn clear javaError2
"syn match   javaError2 "\|=<"
"hi def link javaError2 Error

"syn region processingFold start="{" end="}" transparent fold
"if exists("b:current_syntax")
"  finish
"endif

"syntax case match

"
syn keyword processingVariable focused frameCount height key keyCode
syn keyword processingVariable mouseButton mouseX mouseY online pixels
syn keyword processingVariable pmouseX pmouseY screen screenHeight
syn keyword processingVariable screenWidth width

" at the moment these need to be "syn match"es so that they don't take
" precedence over processingFunRegion's start pattern:
" syn keyword processingVariable  frameRate mousePressed keyPressed
syn match   processingVariable	display "frameRate"
syn match   processingVariable	display "mousePressed"
syn match   processingVariable	display "keyPressed"

" NOTE: just to make sure that this stuff works right, make these into
" a list, one word per line, then add the stuff from the keyfile, hightlight
" it all, and !sort it then !unique it, and anything that goes away, in
" keywords.txt will still be captured here for happiness with older versions
" of processing
"
" KEYWORD2
syn keyword processingFunction	contained BufferedReader abs acos add
syn keyword processingFunction	contained alpha ambient ambientLight
syn keyword processingFunction	contained angleBetween append applyMatrix
syn keyword processingFunction	contained arc array arrayCopy arraycopy
syn keyword processingFunction	contained asin atan atan2 background
syn keyword processingFunction	contained beginCamera beginDraw beginRaw
syn keyword processingFunction	contained beginRecord beginShape bezier
syn keyword processingFunction	contained bezierDetail bezierPoint bezierTangent
syn keyword processingFunction	contained bezierVertex binary blend blendColor
syn keyword processingFunction	contained blue boolean box brightness
syn keyword processingFunction	contained byte cache camera ceil char charAt
syn keyword processingFunction	contained close color colorMode concat constrain
syn keyword processingFunction	contained copy cos createFont createGraphics
syn keyword processingFunction	contained createImage createInput createOutput
syn keyword processingFunction	contained createReader createWriter cross cursor
syn keyword processingFunction	contained curve curveDetail curvePoint curveTangent
syn keyword processingFunction	contained curveTightness curveVertex day degrees
syn keyword processingFunction	contained delay directionalLight disableStyle
syn keyword processingFunction	contained dist div dot draw ellipse ellipseMode
syn keyword processingFunction	contained emissive enableStyle endCamera
syn keyword processingFunction	contained endDraw endRaw endRecord endShape
syn keyword processingFunction	contained equals exit exp expand fill filter
syn keyword processingFunction	contained float floor flush frameRate frustum
syn keyword processingFunction	contained get getChild getChildCount getChildren
syn keyword processingFunction	contained getContent getFloat getInt getName
syn keyword processingFunction	contained getString green hex hint hour hue image
syn keyword processingFunction	contained imageMode indexOf int isVisible join
syn keyword processingFunction	contained keyPressed keyReleased keyTyped length
syn keyword processingFunction	contained lerp lerpColor lightFalloff lightSpecular
syn keyword processingFunction	contained lights limit line link list loadBytes
syn keyword processingFunction	contained loadFont loadImage loadPixels loadShape
syn keyword processingFunction	contained loadStrings log loop mag map mask match
syn keyword processingFunction	contained matchAll max millis min minute modelX
syn keyword processingFunction	contained modelY modelZ month mouseClicked mouseDragged
syn keyword processingFunction	contained mouseMoved mousePressed mouseReleased mult
syn keyword processingFunction	contained nf nfc nfp nfs noCursor noFill noLights
syn keyword processingFunction	contained noLoop noSmooth noStroke noTint noise
syn keyword processingFunction	contained noiseDetail noiseSeed norm normal
syn keyword processingFunction	contained normalize open openStream ortho param
syn keyword processingFunction	contained perspective point pointLight popMatrix
syn keyword processingFunction	contained popStyle pow print printCamera
syn keyword processingFunction	contained printMatrix printProjection println
syn keyword processingFunction	contained pushMatrix pushStyle quad
syn keyword processingFunction	contained radians random randomSeed readLine rect
syn keyword processingFunction	contained rectMode red redraw requestImage
syn keyword processingFunction	contained resetMatrix resize reverse rotate
syn keyword processingFunction	contained rotateX rotateY rotateZ round saturation
syn keyword processingFunction	contained save saveBytes saveFrame saveStream
syn keyword processingFunction	contained saveStrings scale screenX screenY
syn keyword processingFunction	contained screenZ second selectFolder selectInput
syn keyword processingFunction	contained selectOutput set setVisible setup shape
syn keyword processingFunction	contained shapeMode shearX shearY shininess
syn keyword processingFunction	contained shorten sin size smooth sort specular
syn keyword processingFunction	contained sphere sphereDetail splice split
syn keyword processingFunction	contained splitTokens spotLight sq sqrt status
syn keyword processingFunction	contained str stroke strokeCap strokeJoin
syn keyword processingFunction	contained strokeWeight sub subset substring
syn keyword processingFunction	contained switch tan text textAlign textAscent
syn keyword processingFunction	contained textDescent textFont textLeading textMode
syn keyword processingFunction	contained textSize textWidth texture textureMode
syn keyword processingFunction	contained tint toLowerCase toUpperCase translate
syn keyword processingFunction	contained triangle trim unbinary unhex unhint
syn keyword processingFunction	contained updatePixels vertex year

" highlight funtcion names only when they are followed by "("
" need to terminate match using \ze before ( to allow for
" unmatched bracket higlighting
syn match   processingFunRegion	"\K\k*\s*\ze(" contains=processingFunction

" KEYWORD1

" Some of this overlaps the Java, but some of it is unique here, so just
" letting it all stay, it doesn't really hurt anything :)
syn keyword processingType	Boolean Byte Character Class Double Float
syn keyword processingType	Integer Math String StringBuffer Thread
syn keyword processingType	Array Object PFont PGraphics PImage
syn keyword processingType	PrintWriter
syn keyword processingType	boolean byte char color double float
syn keyword processingType	int long short void
syn keyword processingType	ArrayList PVector PShape

syn keyword processingBoolean	false true
syn keyword processingConstant	null

"XXX: All covered in Java, just keeping it here cuz it may be useful for
"historic comparison for a while
"syn keyword processingStorageClass	final static synchronized transient volatile
"syn keyword processingConditional	if else switch
"syn keyword processingControlFlow	break continue return
"syn keyword processingRepeat		while for do
"syn keyword processingLabel		case default
"syn keyword processingException		try catch throw finally
"syn keyword processingOperator		new instanceof

"syn keyword processingKeyword	abstract class
"syn keyword processingKeyword	interface native
"syn keyword processingKeyword	package private protected public
"syn keyword processingKeyword	extends implements import throws
"syn keyword processingKeyword	super this


" LITERAL1

syn keyword processingConstant	ADD ALIGN_CENTER ALIGN_LEFT ALIGN_RIGHT
syn keyword processingConstant	ALPHA ALPHA_MASK ALT AMBIENT ANIMATION
syn keyword processingConstant	ARGB ARROW BACKSPACE BASE BASELINE BEST
syn keyword processingConstant	BEVEL BLEND BLUE_MASK BLUR BMP BOTTOM BURN
syn keyword processingConstant	CENTER CENTER_RADIUS CHATTER CINEPAK CLOSE
syn keyword processingConstant	CMYK CODED COMPLAINT COMPONENT COMPOSITE
syn keyword processingConstant	CONCAVE_POLYGON CONTROL CONVEX_POLYGON CORNER
syn keyword processingConstant	CORNERS CROSS CUSTOM DARKEST DEGREES DEG_TO_RAD
syn keyword processingConstant	DELETE DIAMETER DIFFERENCE DIFFUSE DILATE
syn keyword processingConstant	DIRECTIONAL DISABLED DISABLE_ACCURATE_TEXTURES
syn keyword processingConstant	DISABLE_AUTO_GZIP DISABLE_DEPTH_SORT
syn keyword processingConstant	DISABLE_DEPTH_TEST DISABLE_ERROR_REPORT
syn keyword processingConstant	DISABLE_NATIVE_FONTS DISABLE_OPENGL_2X_SMOOTH
syn keyword processingConstant	DISABLE_OPENGL_4X_SMOOTH DISABLE_OPENGL_ERROR_REPORT
syn keyword processingConstant	DISABLE_TEXT_SMOOTH DODGE DOWN DXF
syn keyword processingConstant	ENABLE_ACCURATE_TEXTURES ENABLE_DEPTH_SORT
syn keyword processingConstant	ENABLE_DEPTH_TEST ENABLE_NATIVE_FONTS
syn keyword processingConstant	ENABLE_OPENGL_2X_SMOOTH ENABLE_OPENGL_4X_SMOOTH
syn keyword processingConstant	ENABLE_OPENGL_ERROR_REPORT ENTER EPSILON ERODE
syn keyword processingConstant	ESC EXCLUSION GIF GRAPHICS GRAY GREEN_MASK GROUP
syn keyword processingConstant	H261 H263 H264 HALF HALF_PI HAND HARD_LIGHT HIGH
syn keyword processingConstant	HINT_COUNT HSB IMAGE INVERT JAVA2D JPEG LEFT
syn keyword processingConstant	LIGHTEST LINES LINUX LOSSLESS LOW MACOS9 MACOSX
syn keyword processingConstant	MAX_FLOAT MAX_INT MEDIUM MIN_FLOAT MIN_INT MITER
syn keyword processingConstant	MODEL MOTION_JPEG_A MOTION_JPEG_B MOVE MS_VIDEO
syn keyword processingConstant	MULTIPLY NORMAL NORMALIZED NO_DEPTH_TEST
syn keyword processingConstant	NO_FLYING_POO NTSC ONE OPAQUE OPEN OPENGL
syn keyword processingConstant	ORTHOGRAPHIC OTHER OVERLAY P2D P3D PAL PDF
syn keyword processingConstant	PERSPECTIVE PI PIXEL_CENTER POINT POINTS POLYGON
syn keyword processingConstant	POSTERIZE PROBLEM PROJECT QUADS QUAD_STRIP
syn keyword processingConstant	QUARTER_PI RADIANS RADIUS RAD_TO_DEG RAW RED_MASK
syn keyword processingConstant	REPLACE RETURN RGB RIGHT ROUND SCREEN SECAM SHAPE
syn keyword processingConstant	SHIFT SOFT_LIGHT SORENSON SPECULAR SPOT SQUARE
syn keyword processingConstant	SUBTRACT SVIDEO TAB TARGA TEXT TFF THIRD_PI
syn keyword processingConstant	THRESHOLD TIFF TOP TRIANGLES TRIANGLE_FAN
syn keyword processingConstant	TRIANGLE_STRIP TUNER TWO TWO_PI UP VIDEO
syn keyword processingConstant	WAIT WHITESPACE WORST

"syn match   processingSpecError	display contained "\\."
"syn match   processingSpecial	display contained "\\[ntbrf'\"\\]"
"syn match   processingSpecial	display contained "\\u\x\{4}"
"syn match   processingSpecial	display contained "\\\o\{1,2}"
"syn match   processingSpecial	display contained "\\[0-3]\o\o"
"
"syn region  processingString	start=+"+ end=+"+ end='$' contains=processingSpecial,processingSpecError,@Spell
"
"syn region  processingCharacter	start="'" end="'" end="$" contains=processingSpecial,processingSpecError
"
syn keyword processingTodo	TODO FIXME XXX NOTE contained
"
"syn region  processingComment	start="/\*" end="\*/" contains=processingTodo,@Spell
"syn region  processingCommentL	start="//" end="$" contains=processingTodo,@Spell
"
"if !exists("processing_minlines")
"  let processing_minlines = 20
"endif
"exec "syn sync ccomment processingComment minlines=" . processing_minlines

"syn match   processingNumber	display "\<\d\+[lL]\=\>"
"syn match   processingNumber	display "\<0x\x\+[lL]\=\>"
"syn match   processingOctal	display "\<0\o\+[lL]\=\>" contains=processingOctalZero
"syn match   processingOctalZero	display contained "\<0"

" NOTE: Java highlight doesn't do different colors for int and float, which is
" dumb: so keep this code here :)

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

" this leverages some features from the java syntax file... keeps the
" hightlighting working properly in () and other regions
syn cluster javaTop add=processingColor,processingFloat

" prevent highlighting of predefined function names after a dot
syn region  processingEmpty	start="\.\ze\K" end="\>"

" Highlight unmatched brackets
"syn match   processingParErr	display ")"
"syn match   processingBraErr	display "\]"
"syn match   processingCBraErr	display "}"
"syn region  processingPar	transparent start="(" end=")" contains=TOP,processingParErr
"syn region  processingBra	transparent start="\[" end="\]" contains=TOP,processingBraErr
"syn region  processingCBra	transparent start="{" end="}" contains=TOP,processingCBraErr


"hi def link processingParErr		Error
"hi def link processingBraErr		Error
"hi def link processingCBraErr		Error

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
