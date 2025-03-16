<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Bq)n-3q]^yj)I05uv&vUAmb6/#*+=0D6eM>_6Y|7ac=Jo$,4fvB812$Eq+NX9iFw' );
define( 'SECURE_AUTH_KEY',  '/S(w12]gFr917wTWS<]dkSnKp5]v ug$L7R6xcJX+Rb^ds98)+.PJW<fI>!ye`U3' );
define( 'LOGGED_IN_KEY',    'en!0c5=}jw+[e~Nfhh_I8<`cep9b3{))g]dNXR;PcZ`5nGZ+/5z5?<fs1V++W52F' );
define( 'NONCE_KEY',        '`hw[<)VMYD`B9Z[<]3h?Pn6a[P*dh29fLkkt^m^@x7)V?vc49WMbU@fY7*z8KmX^' );
define( 'AUTH_SALT',        '1y9A9yDIq*.nsxQPE$<W*mY^>0_tL/UFDY)R6,o,7}BdO;Rar<U%91@(arQ`/IIu' );
define( 'SECURE_AUTH_SALT', '}^3aa~)G3lP~5JCpDJ9Tc?:bh(A|B,C,1<C>Y=41_>.$8?}Q8oM;d&!O3P{!{8,l' );
define( 'LOGGED_IN_SALT',   'iPnX@Rf_`?[$doYyCi(+@v:FYl!^^o5SA[/-s#|sZ%,:F z)fHNk@eA^Xc}ld[tF' );
define( 'NONCE_SALT',       'F @}>CE#8e2jN[@@UbHObV-P1Iv!Ep%R~&,!q6I[5`&KwqjJy6QIuG.n}#YO8&*L' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
