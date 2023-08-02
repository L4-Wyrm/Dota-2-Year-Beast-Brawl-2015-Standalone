// Created by Crowbar 0.36.0.0

$ModelName "creeps/nian/nian_creep.mdl"

$BodyGroup "default"
{
	studio "nian_creep_reference.smd"
}


$SurfaceProp "default"

$Contents "solid"

$MaxEyeDeflection 90

$CDMaterials ""

$TextureGroup "skinfamilies"
{
	{ "models\creeps\nian\nian_creep_body_color" }
	{ "models\creeps\nian\nian_dire_body_color"  }
}

$Attachment "attach_mouthbase" "HeadEnd_JNT" -10 90 0 rotate 0 35 0
$Attachment "attach_mouthend" "Head0_JNT" 500 400 0 rotate 0 0 0
$Attachment "attach_attack2" "LeftPawA0_JNT" 0 0 0 rotate 0 0 0
$Attachment "attach_attack4" "LeftWrist0_JNT" 0 0 0 rotate 0 0 0
$Attachment "attach_attack1" "RightPawA0_JNT" 0 0 0 rotate 0 0 0
$Attachment "attach_pindown" "RightArm3_JNT" -40 0 -50 rotate 0 90 -90
$Attachment "attach_attack3" "RightWrist0_JNT" 0 0 0 rotate 0 0 0
$Attachment "attach_hitloc" "Spine1_JNT" 0 0 0 rotate 0 0 0
$Attachment "attach_stump" "Tail0_JNT" 50 0 0 rotate 0 0 0

$CBox 0 0 0 0 0 0

$BBox -617.076 -146.069 -31.688 314.174 146.069 416.759

// $HBoxSet "default"
// $HBox 0 "Head0_JNT" -99.751656 -67.596214 -72.398041 99.043167 101.891579 72.398041 "Head0_JNT"
// $HBox 0 "LeftArm3_JNT" -18.540529 -75.454933 -37.910179 49.187206 30.479757 39.061184 "LeftArm3_JNT"
// $HBox 0 "RightArm3_JNT" -49.18721 -30.479805 -39.061226 18.540527 75.454887 37.910137 "RightArm3_JNT"
// $HBox 0 "Spine2_JNT" -68.560661 -66.405434 -93.13369 83.994652 119.444443 93.13369 "Spine2_JNT"
// $HBox 0 "LeftLeg3_JNT" -22.700401 -55.077801 -34.68248 33.849342 22.715042 28.33334 "LeftLeg3_JNT"
// $HBox 0 "RightLeg3_JNT" -33.849281 -22.715073 -28.333399 22.700462 55.07777 34.682419 "RightLeg3_JNT"
// $HBox 0 "Root0_JNT" -90.798943 -111.634926 -70.628983 67.173157 63.254028 70.628983 "Root0_JNT"
// $HBoxSet "head"
// $HBox 0 "Head0_JNT" -99.751656 -67.596214 -72.398041 99.043167 101.891579 72.398041 "Head0_JNT"
// $HBoxSet "hands"
// $HBox 0 "LeftArm3_JNT" -18.540529 -75.454933 -37.910179 49.187206 30.479757 39.061184 "LeftArm3_JNT"
// $HBox 0 "RightArm3_JNT" -49.18721 -30.479805 -39.061226 18.540527 75.454887 37.910137 "RightArm3_JNT"
// $HBoxSet "select_high"
// $HBox 0 "Spine2_JNT" -68.560661 -66.405434 -93.13369 83.994652 119.444443 93.13369 "Spine2_JNT"
// $HBox 0 "Root0_JNT" -90.798943 -111.634926 -70.628983 67.173157 63.254028 70.628983 "Root0_JNT"
// $HBoxSet "feet"
// $HBox 0 "LeftLeg3_JNT" -22.700401 -55.077801 -34.68248 33.849342 22.715042 28.33334 "LeftLeg3_JNT"
// $HBox 0 "RightLeg3_JNT" -33.849281 -22.715073 -28.333399 22.700462 55.07777 34.682419 "RightLeg3_JNT"
// $HBoxSet "select_low"
// $HBox 0 "Root0_JNT" -61.601322 -177.900528 -133.816406 192.221603 99.635872 133.816406 "Root0_JNT"

$BoneMerge "Root0_JNT"
$BoneMerge "Tail0_JNT"
$BoneMerge "Spine0_JNT"
$BoneMerge "Tail1_JNT"
$BoneMerge "Tail2_JNT"
$BoneMerge "Tail3_JNT"
$BoneMerge "Tail4_JNT"
$BoneMerge "Tail5_JNT"
$BoneMerge "UpperTailEnd0_JNT"
$BoneMerge "LowerTailEnd0_JNT"
$BoneMerge "UpperTailEnd1_JNT"
$BoneMerge "UpperTailEnd2_JNT"
$BoneMerge "LowerTailEnd1_JNT"
$BoneMerge "LowerTailEnd2_JNT"
$BoneMerge "Spine1_JNT"
$BoneMerge "Spine2_JNT"
$BoneMerge "Spine3_JNT"
$BoneMerge "LowerMane0_JNT"
$BoneMerge "Neck0_JNT"
$BoneMerge "LowerMane1_JNT"
$BoneMerge "UpperMane0_JNT"
$BoneMerge "Head0_JNT"
$BoneMerge "Jaw0_JNT"
$BoneMerge "Horn0_JNT"
$BoneMerge "LeftWhiskerB0_JNT"
$BoneMerge "RightWhiskerB0_JNT"


$SectionFrames 30 125

$PoseParameter "turn" -1 1 0

$Sequence "BindPose" {
	"nian_creep_anims\BindPose.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "run" {
	"nian_creep_anims\run.smd"
	activity "ACT_DOTA_RUN" 1
	{ event AE_CL_PLAYSOUND 0 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 12 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 14 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 4 "Nian.Footstep" }
	fadein 0.2
	fadeout 0.2
	addlayer "turns"
	fps 30
	loop
}

$Sequence "run_pregame" {
	"nian_creep_anims\run_pregame.smd"
	activity "ACT_DOTA_RUN" 1
	activitymodifier pregame
	{ event AE_CL_PLAYSOUND 1 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 12 "Nian.Footstep" }
	fadein 0.2
	fadeout 0.2
	addlayer "turns_dupe1"
	fps 30
	loop
}

$Sequence "swipe_right" {
	"nian_creep_anims\swipe_right.smd"
	activity "ACT_DOTA_ATTACK" 1
	fadein 0.2
	fadeout 0.2
	fps 55
}

$Sequence "swipe_left" {
	"nian_creep_anims\swipe_left.smd"
	activity "ACT_DOTA_ATTACK" 1
	fadein 0.2
	fadeout 0.2
	fps 55
}

$Sequence "three_stage_pounce" {
	"nian_creep_anims\three_stage_pounce.smd"
	activity "ACT_DOTA_CAST_ABILITY_4" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_flinch_small" {
	"nian_creep_anims\nian_flinch_small.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_roar_end" {
	"nian_creep_anims\nian_roar_end.smd"
	activity "ACT_DOTA_RATTLETRAP_HOOKSHOT_END" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_roar_loop" {
	"nian_creep_anims\nian_roar_loop.smd"
	activity "ACT_DOTA_TELEPORT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "nian_roar_loop_victory" {
	"nian_creep_anims\nian_roar_loop_victory.smd"
	activity "ACT_DOTA_VICTORY" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "nian_roar_start" {
	"nian_creep_anims\nian_roar_start.smd"
	activity "ACT_DOTA_RATTLETRAP_HOOKSHOT_START" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_tail360" {
	"nian_creep_anims\nian_tail360.smd"
	activity "ACT_DOTA_CAST_ABILITY_5" 1
	{ event AE_CL_PLAYSOUND 43 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 52 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 60 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 72 "Nian.Footstep" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_knockdown_getup" {
	"nian_creep_anims\nian_knockdown_getup.smd"
	activity "ACT_DOTA_BELLYACHE_END" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_knockdown_loop" {
	"nian_creep_anims\nian_knockdown_loop.smd"
	activity "ACT_DOTA_BELLYACHE_LOOP" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "nian_knockdown_start" {
	"nian_creep_anims\nian_knockdown_start.smd"
	activity "ACT_DOTA_DIE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_flinch_big" {
	"nian_creep_anims\nian_flinch_big.smd"
	activity "ACT_BIG_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_disabled" {
	"nian_creep_anims\nian_disabled.smd"
	activity "ACT_DOTA_DISABLED" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "nian_disabled_end" {
	"nian_creep_anims\nian_disabled_end.smd"
	activity "ACT_DOTA_DISABLED_END" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_flail" {
	"nian_creep_anims\nian_flail.smd"
	activity "ACT_DOTA_FLAIL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "skewer_start" {
	"nian_creep_anims\skewer_start.smd"
	activity "ACT_DOTA_MAGNUS_SKEWER_START" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "skewer_run" {
	"nian_creep_anims\skewer_run.smd"
	activity "ACT_DOTA_MAGNUS_SKEWER_END" 1
	{ event AE_CL_PLAYSOUND 9 "Nian.Footstep.Loud" }
	{ event AE_CL_PLAYSOUND 18 "Nian.Footstep.Loud" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "nian_tail_stomp" {
	"nian_creep_anims\nian_tail_stomp.smd"
	activity "ACT_DOTA_CAST_ABILITY_6" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nian_idle" {
	"nian_creep_anims\nian_idle.smd"
	activity "ACT_DOTA_IDLE" 1
	{ event AE_CL_PLAYSOUND 1 "Nian.Breath_Idle" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "pin_down_start" {
	"nian_creep_anims\pin_down_start.smd"
	activity "ACT_DOTA_NIAN_PIN_START" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "pin_down_loop" {
	"nian_creep_anims\pin_down_loop.smd"
	activity "ACT_DOTA_NIAN_PIN_LOOP" 1
	{ event AE_CL_PLAYSOUND 28 "Nian.GroundImpact" }
	{ event AE_CL_PLAYSOUND 47 "Nian.Roar.PreAttack" }
	{ event AE_CL_PLAYSOUND 96 "Nian.GroundImpact" }
	{ event AE_CL_PLAYSOUND 117 "Nian.GroundImpact" }
	{ event AE_CL_PLAYSOUND 131 "Nian.GroundImpact" }
	{ event AE_CL_PLAYSOUND 129 "Nian.GroundImpact" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "pin_down_end" {
	"nian_creep_anims\pin_down_end.smd"
	activity "ACT_DOTA_NIAN_PIN_END" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "area_deny" {
	"nian_creep_anims\area_deny.smd"
	activity "ACT_DOTA_AREA_DENY" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "leap_stun" {
	"nian_creep_anims\leap_stun.smd"
	activity "ACT_DOTA_LEAP_STUN" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "leap_swipe_right" {
	"nian_creep_anims\leap_swipe_right.smd"
	activity "ACT_DOTA_LEAP_SWIPE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "intro_leap" {
	"nian_creep_anims\intro_leap.smd"
	activity "ACT_DOTA_NIAN_INTRO_LEAP" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "game_end" {
	"nian_creep_anims\game_end.smd"
	activity "ACT_DOTA_NIAN_GAME_END" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "pinDown_to_stun" {
	"nian_creep_anims\pinDown_to_stun.smd"
	activity "ACT_DOTA_NIAN_PIN_TO_STUN" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "capture" {
	"nian_creep_anims\capture.smd"
	activity "ACT_DOTA_CAPTURE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "turns_lookFrame_0" {
	"nian_creep_anims\turns_lookFrame_0.smd"
	delta
	fadein 0.2
	fadeout 0.2
	hidden
	fps 30
}

$Sequence "turns_lookFrame_1" {
	"nian_creep_anims\turns_lookFrame_1.smd"
	delta
	fadein 0.2
	fadeout 0.2
	hidden
	fps 30
}

$Sequence "turns_lookFrame_2" {
	"nian_creep_anims\turns_lookFrame_2.smd"
	delta
	fadein 0.2
	fadeout 0.2
	hidden
	fps 30
}

$Sequence "turns_dupe1_lookFrame_0" {
	"nian_creep_anims\turns_dupe1_lookFrame_0.smd"
	delta
	fadein 0.2
	fadeout 0.2
	hidden
	fps 30
}

$Sequence "turns_dupe1_lookFrame_1" {
	"nian_creep_anims\turns_dupe1_lookFrame_1.smd"
	delta
	fadein 0.2
	fadeout 0.2
	hidden
	fps 30
}

$Sequence "turns_dupe1_lookFrame_2" {
	"nian_creep_anims\turns_dupe1_lookFrame_2.smd"
	delta
	fadein 0.2
	fadeout 0.2
	hidden
	fps 30
}

$Sequence "turns" {
	"nian_creep_anims\turns_lookFrame_0.smd"
	"nian_creep_anims\turns_lookFrame_1.smd"
	"nian_creep_anims\turns_lookFrame_2.smd"
	blend "turn" -1 1
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "turns_dupe1" {
	"nian_creep_anims\turns_dupe1_lookFrame_0.smd"
	"nian_creep_anims\turns_dupe1_lookFrame_1.smd"
	"nian_creep_anims\turns_dupe1_lookFrame_2.smd"
	blend "turn" -1 1
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
	fps 30
}

$KeyValues
{
}
