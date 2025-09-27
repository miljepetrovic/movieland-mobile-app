/// Design system tokens for consistent spacing, typography, and sizing
/// Following Material Design specifications and MovieLand design system
class DesignTokens {
  DesignTokens._();

  // ==================== SPACING TOKENS ====================

  /// Extra small spacing: 4dp
  static const double spaceExtraSmall = 4.0;

  /// Small spacing: 8dp
  static const double spaceSmall = 8.0;

  /// Medium spacing: 12dp
  static const double spaceMedium = 12.0;

  /// Large spacing: 16dp
  static const double spaceLarge = 16.0;

  /// Extra large spacing: 20dp
  static const double spaceExtraLarge = 20.0;

  /// Double extra large spacing: 24dp
  static const double spaceDoubleExtraLarge = 24.0;

  /// Triple extra large spacing: 32dp
  static const double spaceTripleExtraLarge = 32.0;

  /// Huge spacing: 40dp
  static const double spaceHuge = 40.0;

  /// Massive spacing: 48dp
  static const double spaceMassive = 48.0;

  // ==================== TYPOGRAPHY TOKENS ====================

  // Display Typography (Large, prominent text)
  static const double fontDisplayLarge = 57.0;    // Material 3 Display Large
  static const double fontDisplayMedium = 45.0;   // Material 3 Display Medium
  static const double fontDisplaySmall = 36.0;    // Material 3 Display Small

  // Headline Typography (Headlines and important titles)
  static const double fontHeadlineLarge = 32.0;   // Material 3 Headline Large
  static const double fontHeadlineMedium = 28.0;  // Material 3 Headline Medium
  static const double fontHeadlineSmall = 24.0;   // Material 3 Headline Small

  // Title Typography (Smaller titles and subtitles)
  static const double fontTitleLarge = 22.0;      // Material 3 Title Large
  static const double fontTitleMedium = 16.0;     // Material 3 Title Medium
  static const double fontTitleSmall = 14.0;      // Material 3 Title Small

  // Body Typography (Main content text)
  static const double fontBodyLarge = 16.0;       // Material 3 Body Large
  static const double fontBodyMedium = 14.0;      // Material 3 Body Medium
  static const double fontBodySmall = 12.0;       // Material 3 Body Small

  // Label Typography (UI labels, buttons, captions)
  static const double fontLabelLarge = 14.0;      // Material 3 Label Large
  static const double fontLabelMedium = 12.0;     // Material 3 Label Medium
  static const double fontLabelSmall = 11.0;      // Material 3 Label Small

  // ==================== COMPONENT SIZING TOKENS ====================

  // Icon Sizes
  static const double iconExtraSmall = 16.0;
  static const double iconSmall = 20.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconExtraLarge = 40.0;
  static const double iconDoubleExtraLarge = 48.0;
  static const double iconHuge = 64.0;

  // Button Heights
  static const double buttonHeightSmall = 32.0;
  static const double buttonHeightMedium = 40.0;
  static const double buttonHeightLarge = 48.0;
  static const double buttonHeightExtraLarge = 56.0;

  // Border Radius
  static const double radiusExtraSmall = 2.0;
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusExtraLarge = 16.0;
  static const double radiusDoubleExtraLarge = 20.0;
  static const double radiusCircular = 50.0;

  // Elevation/Shadow
  static const double elevationNone = 0.0;
  static const double elevationExtraSmall = 1.0;
  static const double elevationSmall = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationLarge = 6.0;
  static const double elevationExtraLarge = 8.0;
  static const double elevationDoubleExtraLarge = 12.0;

  // Layout Constraints
  static const double maxWidthMobile = 768.0;
  static const double maxWidthTablet = 1024.0;
  static const double maxWidthDesktop = 1440.0;

  // ==================== ANIMATION DURATIONS ====================

  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  static const Duration animationVerySlow = Duration(milliseconds: 800);

  // ==================== CONVENIENCE GETTERS ====================

  // Common spacing combinations
  static double get defaultPadding => spaceLarge;        // 16dp
  static double get cardPadding => spaceLarge;           // 16dp
  static double get screenPadding => spaceLarge;         // 16dp
  static double get listItemPadding => spaceMedium;       // 12dp
  static double get buttonPadding => spaceLarge;         // 16dp

  // Common icon sizes
  static double get defaultIconSize => iconMedium;        // 24dp
  static double get placeholderIconSize => iconHuge; // 64dp
  static double get appBarIconSize => iconMedium;         // 24dp

  // Common typography
  static double get tabFontSize => fontLabelLarge;   // 14dp
  static double get titleFontSize => fontHeadlineSmall; // 24dp
  static double get subtitleFontSize => fontBodyLarge;  // 16dp
}