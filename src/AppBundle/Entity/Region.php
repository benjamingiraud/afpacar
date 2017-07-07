<?php

namespace AppBundle\Entity;

/**
 * Region
 */
class Region
{
    /**
     * @var string
     */
    private $region;

    /**
     * @var integer
     */
    private $id;


    /**
     * Set region
     *
     * @param string $region
     *
     * @return Region
     */
    public function setRegion($region)
    {
        $this->region = $region;

        return $this;
    }

    /**
     * Get region
     *
     * @return string
     */
    public function getRegion()
    {
        return $this->region;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
}

