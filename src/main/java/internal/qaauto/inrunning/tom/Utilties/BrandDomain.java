package internal.qaauto.inrunning.tom.Utilties;

/**
 * {@link Enum} that holds the possible Brand/Domains to be mapped with the ones from Automation POD.
 * 
 * @author rsanchez
 */
public enum BrandDomain {

    BOVADA("0", "BOVADA", "lv"), BODOG("1", "BODOG","eu");
    
    private final static String DOMAIN_NOT_DEFINED = "The status %s is not defined";
    
    public static final String BRAND = "domain";
    
    private String brandIndex;

    private String brandName;
    
    private String automationPodExtension;
    
    private BrandDomain(String brandIndex, String brandName, String automationPodExtension) {
        this.brandIndex = brandIndex;
        this.brandName = brandName;
        this.automationPodExtension = automationPodExtension;
    }

    /**
     * @return the brandIndex
     */
    public String getBrandIndex() {
        return brandIndex;
    }


    /**
     * @return the brandName
     */
    public String getBrandName() {
        return brandName;
    }


    /**
     * @return the automationPodExtension
     */
    public String getAutomationPodExtension() {
        return automationPodExtension;
    }

    
    public static BrandDomain getExtension(final String brand) {
            for (final BrandDomain domain : BrandDomain.values()) {
                if (domain.getBrandName().equals(brand)) {
                    return domain;
                }
            }
            throw new IllegalArgumentException(String.format(DOMAIN_NOT_DEFINED, brand));
        }

    public static BrandDomain getDomainByExtension(final String brandExtension){
        for (final BrandDomain domain : BrandDomain.values()) {
            if (domain.getAutomationPodExtension().equals(brandExtension)) {
                return domain;
            }
        }
        throw new IllegalArgumentException(String.format(DOMAIN_NOT_DEFINED, brandExtension));
    }

}
