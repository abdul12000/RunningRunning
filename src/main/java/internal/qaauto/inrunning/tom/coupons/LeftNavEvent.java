package internal.qaauto.inrunning.tom.coupons;

import internal.qaauto.inrunning.tom.InRunningComponentInterface;

/**
 * Created by Harish Renukunta on 03/10/2014.
 */
public interface LeftNavEvent extends InRunningComponentInterface {

    public String getSport();

    public String getLeftNavEventDescription();

    public void collapse();

    public void expand();

    public boolean isCollapsed();

    public String getName();

    public String getTitle();

    public String getTime();

    void select();

    boolean isHighlighted();
}
