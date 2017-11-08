package internal.qaauto.inrunning.tom.Utilties;

/**
 * Created by Harish Renukunta on 24/10/2014.
 */
public enum Odds {

    AMERICAN("American", "American Odds"), DECIMAL("Decimal", "Decimal Odds"), FRACTIONAL("Fractional", "Fractional Odds");

    String oddsFormat;
    String oddsFormatText;

    private Odds(final String format, final String formatText){
        oddsFormat = format;
        oddsFormatText = formatText;
    }

    public String getOddsFormat(){
        return oddsFormat;
    }

    public String getOddsFormatText() {
        return oddsFormatText;
    }
}
