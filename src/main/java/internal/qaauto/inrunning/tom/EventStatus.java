package internal.qaauto.inrunning.tom;

/**
 * @author rkora on 13/10/2014.
 */
public enum EventStatus {

    UPCOMING("0", "Upcoming"), In_PROGRESS("1", "In Progress"), HALF_TIME("2", "Half Time"), INACTIVE_NO_TV("3", "Inactive"),
    CLOSED("4", "Closed");

    private static final String STATUS_NOT_DEFINED = "The status %s is not defined";

    private String pxpCode;

    private String statusName;

    private EventStatus(final String pxpCode, final String statusName) {
        this.statusName = statusName;
        this.pxpCode = pxpCode;
    }

    public String getPxpCode() {
        return pxpCode;
    }

    public String getStatus() {
        return statusName;
    }

    /**
     * Returns the corresponding {@link EventStatus} based on the <code>status<code> parameter.
     *
     * @param statusName
     *            the status name to be transformed.
     *
     * @return the transformed {@link EventStatus}.
     *
     * @throws IllegalArgumentException
     *             if the event status is not defined.
     */
    public static EventStatus fromStatus(final String statusName) {
        for (final EventStatus eventStatus : EventStatus.values()) {
            if (eventStatus.statusName.equals(statusName)) {
                return eventStatus;
            }
        }
        throw new IllegalArgumentException(String.format(STATUS_NOT_DEFINED, statusName));
    }
}
