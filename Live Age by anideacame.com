<?php
/**
 * Plugin Name: Live Age by anideacame.com
 * Plugin URI: https://anideacame.com
 * Description: Use this short code [show_age birthdate="1990-01-01"] and replace the 1900-01-01 with the date of birth to show or display the live age.
 * Version: 1.3
 * Author: anideacame.com
 * Tested up to: 6.2.2
 * Author URI: https://anideacame.com/
 * License: GPL2
 * License URI: https://www.gnu.org/licenses/gpl-2.0.html
 */
if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed 
function show_age_shortcode( $atts ) {
  // Get the current date and time.
  $current_date = new DateTime();
  // Get the user's birthdate from the shortcode attributes.
  $user_birthdate = isset( $atts['birthdate'] ) ? $atts['birthdate'] : '';
  // Calculate the user's age.
  $user_age = (int) $current_date->diff( new DateTime( $user_birthdate ) )->y;
  // Return the user's age.
  return $user_age;
}
add_shortcode( 'show_age', 'show_age_shortcode' );
?>
