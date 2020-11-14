function [chi_d] = guidance(eta, startWp, endWp, pi_p)
    crossTrackErr = crosstrackWpt(endWp(1), endWp(2), startWp(1), startWp(2), eta(1), eta(2));
    dist2Wp = norm(endWp - eta(1:2));
    lookAheadDist = sqrt(dist2Wp^2 - crossTrackErr^2); % Pythagoran thm
    K_p_path = 1 / (lookAheadDist + 1e-3); % Kp = 1 / delta (avoid singularity)
    chi_d = pi_p - atan(K_p_path * crossTrackErr);
end

